#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Estime le coût en octets du texte français dans Polished Crystal.

LA QUESTION : il reste ~17,8 Ko libres dans la ROM. Le texte français,
passé dans des tables de compression calibrées pour l'anglais, tient-il ?

LA MÉTHODE — un corpus apparié, pas une extrapolation :

  On prend les blocs de texte de `pokecrystal` (EN) et `pokecrystal-fr` (FR)
  APPARIÉS PAR LABEL. Même contenu, deux langues. On encode les deux avec le
  simulateur validé (`encodage.py`) et on compare.

  Le rapport FR/EN ainsi obtenu porte sur du texte réel traduit par des
  professionnels sous contrainte de place — c'est le meilleur substitut
  disponible pour notre propre traduction à venir.

  Ce rapport est ensuite appliqué au volume RÉEL de Polished Crystal.

QUATRE SCÉNARIOS :

  0. EN / tables anglaises        — la référence, ce qui est dans la ROM
  A. FR / accents SANS Huffman    — l'erreur à ne pas commettre
  B. FR / Huffman refait, n-grammes anglais gardés
  C. FR / tout refait             — la cible

⚠️ Ce module ne dit rien sur les CASES de charmap disponibles (voir
DECISIONS.md A1). Il suppose le problème de place résolu, pour isoler la
seule question de la compression.
"""

import heapq
import math
import re
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from chemins import EN, FR, HACK, relatif          # noqa: E402
from encodage import Tables, cout_bloc, blocs_du_fichier, _jeton_a  # noqa: E402


# ---------------------------------------------------------------- corpus

def corpus(depot: Path):
    """label -> items, pour tous les .asm versionnés d'un dépôt."""
    import subprocess
    fichiers = subprocess.run(
        ["git", "-C", str(depot), "ls-files", "*.asm"],
        capture_output=True, text=True, check=True,
    ).stdout.split()
    out = {}
    for rel in fichiers:
        for label, items in blocs_du_fichier(depot / rel):
            if any(g == "txt" for g, _ in items):
                out.setdefault(label, items)
    return out


def texte(items):
    return "".join(v for g, v in items if g == "txt")


# ---------------------------------------------------- construction Huffman

def huffman(freqs: dict) -> dict:
    """Codes canoniques pour un dictionnaire jeton -> fréquence.

    Reproduit l'esprit de `utils/huffman.py` du dépôt amont : un simple
    Huffman sur les fréquences observées.
    """
    if len(freqs) == 1:
        return {next(iter(freqs)): "0"}
    tas = [(f, i, [t]) for i, (t, f) in enumerate(sorted(freqs.items()))]
    heapq.heapify(tas)
    codes = {t: "" for t in freqs}
    compteur = len(tas)
    while len(tas) > 1:
        f1, _, g = heapq.heappop(tas)
        f2, _, d = heapq.heappop(tas)
        for t in g:
            codes[t] = "0" + codes[t]
        for t in d:
            codes[t] = "1" + codes[t]
        heapq.heappush(tas, (f1 + f2, compteur, g + d))
        compteur += 1
    return codes


def ngrammes_optimaux(textes, jetons_base, nombre=67, longueur_max=5):
    """Choisit les n-grammes qui économisent le plus, façon `utils/ngram.py`.

    Gain d'un n-gramme = occurrences × (jetons_remplacés − 1).
    Sélection gloutonne, avec recomptage pour éviter les chevauchements.
    """
    compte = Counter()
    for s in textes:
        for n in range(2, longueur_max + 1):
            for i in range(len(s) - n + 1):
                bout = s[i:i + n]
                if "<" in bout or ">" in bout or "@" in bout:
                    continue
                compte[bout] += 1
    candidats = [(occ * (len(b) - 1), b) for b, occ in compte.items() if occ > 20]
    candidats.sort(reverse=True)
    retenus, vus = [], set()
    for _, b in candidats:
        if len(retenus) >= nombre:
            break
        if any(b in r or r in b for r in vus):
            continue
        retenus.append(b)
        vus.add(b)
    return retenus


# ------------------------------------------------------------- scénarios

ELISIONS_FR = ["l'", "d'", "n'", "c'", "u'", "t'", "j'", "m'", "s'"]
ACCENTS_FR = list("àâçèêîôùû") + ["ï"]
RETIRES = ["'d", "'l", "'m", "'r", "'t", "'v", "É", "á", "í", "ó", "¿", "¡"]


def tables_fr(base: Tables, textes_fr, avec_huffman=True, ngrammes_fr=True):
    """Fabrique des tables adaptées au français à partir des tables de PC."""
    t = Tables.__new__(Tables)
    t.ngrammes = dict(base.ngrammes)
    t.huffman = {k: v for k, v in base.huffman.items() if k not in RETIRES}
    t.simples = {k: v for k, v in base.simples.items() if k not in RETIRES}

    nouveaux = ACCENTS_FR + ELISIONS_FR
    if not avec_huffman:
        # L'ERREUR : déclarés au charmap, sans code Huffman.
        for c in nouveaux:
            t.simples[c] = 0
        t._maj_jetons()
        return t

    if ngrammes_fr:
        t.ngrammes = {}
        t._maj_jetons()
        for i, g in enumerate(ngrammes_optimaux(textes_fr, t.jetons_compr)):
            t.ngrammes[g] = 0x0A + i

    # fréquences observées, sur les jetons compressibles
    t._maj_jetons()
    freqs = Counter()
    for s in textes_fr:
        i = 0
        while i < len(s):
            j = _jeton_a(s, i, sorted(set(t.huffman) | set(t.simples) | set(nouveaux),
                                      key=len, reverse=True))
            freqs[j] += 1
            i += len(j)
    for c in nouveaux:
        freqs.setdefault(c, 1)
    for c in t.huffman:
        freqs.setdefault(c, 1)
    # seuls 125 jetons peuvent être des feuilles de l'arbre
    gardes = dict(Counter(freqs).most_common(125))
    t.huffman = huffman(gardes)
    t.simples = {k: v for k, v in t.simples.items() if k not in t.huffman}
    t._maj_jetons()
    return t


# ---------------------------------------------------------------- rapport

def main():
    base = Tables(HACK / "constants/charmap.asm")
    print("Lecture des corpus…")
    cen, cfr = corpus(EN), corpus(FR)
    communs = sorted(set(cen) & set(cfr))
    print(f"  blocs appariés par label EN/FR : {len(communs)}")

    txt_en = [texte(cen[l]) for l in communs]
    txt_fr = [texte(cfr[l]) for l in communs]
    car_en = sum(len(s) for s in txt_en)
    car_fr = sum(len(s) for s in txt_fr)
    print(f"  caractères  EN {car_en}   FR {car_fr}   "
          f"(rapport {car_fr / car_en:.3f})")

    print("\nConstruction des tables françaises…")
    tA = tables_fr(base, txt_fr, avec_huffman=False)
    tB = tables_fr(base, txt_fr, avec_huffman=True, ngrammes_fr=False)
    tC = tables_fr(base, txt_fr, avec_huffman=True, ngrammes_fr=True)

    def total(labels, corp, tab):
        return sum(cout_bloc(corp[l], tab) for l in labels)

    print("Encodage des quatre scénarios…")
    o_en = total(communs, cen, base)
    o_a = total(communs, cfr, tA)
    o_b = total(communs, cfr, tB)
    o_c = total(communs, cfr, tC)

    # volume réel de Polished Crystal, tables actuelles
    chack = corpus(HACK)
    o_pc = sum(cout_bloc(v, base) for v in chack.values())

    print(f"\n{'=' * 66}")
    print("CORPUS APPARIÉ  (pokecrystal ↔ pokecrystal-fr, "
          f"{len(communs)} blocs)")
    print(f"{'=' * 66}")
    lignes = [
        ("0. EN, tables anglaises  (référence)", o_en),
        ("A. FR, accents SANS code Huffman", o_a),
        ("B. FR, Huffman refait, n-grammes EN", o_b),
        ("C. FR, tout refait", o_c),
    ]
    for nom, v in lignes:
        print(f"  {nom:<40s} {v:8d} o   {v / o_en:6.3f} ×")

    print(f"\n{'=' * 66}")
    print("PROJECTION SUR POLISHED CRYSTAL")
    print(f"{'=' * 66}")
    print(f"  texte de PC, tables actuelles          {o_pc:8d} o")
    for nom, v in lignes[1:]:
        proj = round(o_pc * v / o_en)
        print(f"  {nom:<40s} {proj:8d} o   "
              f"{proj - o_pc:+8d} o")
    return 0


if __name__ == "__main__":
    sys.exit(main())
