#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
PHASE 2 — appliquer le français officiel là où le critère exact le permet.

    PolishedCrystal == pokecrystal (EN)   ET   pokecrystal-fr (FR) != EN
        => on reprend le français officiel, converti en casse mixte (D3).

CE QU'IL FAIT
-------------
Remplace, dans les sources de Polished Crystal, les **lignes de texte** d'un
bloc par celles du Cristal français, en conservant :

- le label et son indentation ;
- les macros qui ne portent pas de texte (`text_ram`, `text_decimal`…) ;
- la structure de découpe du français, qui n'est PAS celle de l'anglais —
  une traduction ne tombe pas sur les mêmes sauts de ligne.

⚠️ **Il ne touche qu'aux catégories `applicable` et `renomme`.** Les blocs
`retouche` demandent un report manuel de la retouche du hack (phase 3), et
`propre_au_hack` demande une rédaction (phase 4).

CONTRÔLES
---------
- Aucune ligne produite ne dépasse **18 tuiles** — sinon le bloc est REFUSÉ
  et signalé, jamais écrit tronqué.
- Le nombre de macros porteuses de texte doit correspondre entre le bloc
  français lu et le bloc écrit.
"""

import re
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from chemins import EN, FR, HACK, relatif           # noqa: E402
from lecteur import TEXTE, RX_CHAINE                # noqa: E402
from casse import Convertisseur                     # noqa: E402
import inventaire as I                              # noqa: E402

RX_LIGNE_TEXTE = re.compile(
    r'^(\s*)(' + "|".join(sorted(TEXTE)) + r')(\s+)"((?:[^"\\]|\\.)*)"\s*$')
RX_TERMINATEUR = re.compile(r'^(\s*)(done|prompt|text_end)\s*$')

# Le Cristal français emploie parfois `db "…"` là où Polished Crystal emploie
# `text "…"`. Recopier ses lignes telles quelles produisait un bloc que
# l'assembleur refusait (« 'text' was already started! ») : PC compte sur
# `done` pour fermer, le vanilla terminait par `db "@"`.
# On ne recopie donc PAS la structure du français : on reprend son TEXTE et
# ses sauts de ligne, puis on les réémet avec les macros de PC.
EQUIV = {"text": "text", "line": "line", "cont": "cont", "para": "para",
         "next": "next", "next1": "next1", "page": "page"}

# jetons valant UNE tuile à l'affichage
UNE_TUILE = ["#mon", "<PLAYER>", "<RIVAL>", "<TRENDY>", "#", "<PK>", "<MN>",
             "<PO>", "<KE>", "<LV>", "<ID>", "<BOLDH>", "<BOLDP>", "<SHARP>"]
LARGEUR_MAX = 18
# Contextes plus larges que la boîte de dialogue (CONVENTIONS.md §1)
LARGEURS = {"data/credits_strings.asm": 20,
            "data/pokemon/dex_entries.asm": 19,
            "data/abilities/descriptions.asm": 19}


def largeur_max(chemin):
    rel = relatif(chemin).split("/", 1)[-1]
    return LARGEURS.get(rel, LARGEUR_MAX)


def tuiles(s):
    x = s.rstrip("@")
    x = re.sub(r"\{d:[^}]*\}", "", x)
    for t in ["<PLAYER>", "<RIVAL>", "<TRENDY>"]:
        x = x.replace(t, "")
    for t in sorted(UNE_TUILE, key=len, reverse=True):
        x = x.replace(t, "\x01")
    return len(x)


def lignes_du_bloc(chemin, ligne_label):
    """Les lignes brutes d'un bloc, du label jusqu'à son terminateur."""
    lignes = Path(chemin).read_text(encoding="utf-8", errors="replace").splitlines()
    debut = ligne_label            # 1-indexé : la ligne du label
    i = debut                      # on commence APRÈS le label
    fin = None
    while i < len(lignes):
        nu = lignes[i].strip()
        if re.match(r"^(done|prompt|text_end)\b", nu):
            fin = i
            break
        if re.match(r"^[A-Za-z_.][A-Za-z0-9_]*::?\s*$", lignes[i]) or nu.startswith("SECTION"):
            fin = i - 1
            break
        i += 1
    return debut, (fin if fin is not None else i), lignes


def charger_reformulations():
    """Substitutions ligne à ligne décidées avec l'utilisateur (D4, D5).

    Deux motifs :
    · `D4` / `D5` — éviter un `Ê` capital, que le charmap n'a pas ;
    · `largeur` — une ligne qui dépasse 18 tuiles depuis qu'on a renoncé
      aux ligatures d'élision (`d'` valait 1 tuile, il en vaut 2).
    """
    import csv
    chemin = Path(__file__).resolve().parent.parent / "donnees" / "reformulations.tsv"
    if not chemin.is_file():
        return {}
    return {r["ligne_convertie"]: r["remplacement"]
            for r in csv.DictReader(chemin.open(encoding="utf-8"), delimiter="\t")}


def jetons_du_charmap():
    """Tout ce que le charmap de Polished Crystal sait encoder."""
    jetons = set()
    for ligne in (HACK / "constants/charmap.asm").read_text(encoding="utf-8").splitlines():
        m = re.match(r'\s*(?:ctxtmap|charmap)\s+"((?:[^"\\]|\\.)*)"', ligne)
        if m:
            jetons.add(m.group(1))
    return jetons


def encodable(texte, jetons):
    """Rend le premier caractère que le charmap ne sait PAS encoder.

    ⚠️ Garde-fou indispensable : le convertisseur produit `Être` là où le
    français officiel écrit `Etre`, et `Ê` n'est PAS dans le charmap. Sans ce
    contrôle, l'erreur n'apparaîtrait qu'à la compilation, des centaines de
    fichiers plus tard — ou pire, passerait.
    """
    reste = re.sub(r"<[^>]*>|\{[^}]*\}", "", texte)
    for c in reste:
        if c not in jetons and c != "@":
            return c
    return None


def main():
    simulation = "--appliquer" not in sys.argv
    cat, exclus, corpus = I.classer()
    conv = Convertisseur()
    reform = charger_reformulations()
    jetons = jetons_du_charmap()

    # cible -> (label source côté français)
    cibles = {l: l for l in cat["applicable"]}
    cibles.update({pcl: enl for pcl, enl in cat["renomme"]})
    # ⚠️ Les blocs IMPLICITES (texte en ligne dans un script, sans label) ont
    # pour « ligne » celle de leur premier `text` et non celle d'un label :
    # le découpage sautait leur première ligne et insérait le français APRÈS
    # l'anglais. Ils sont 13 ; on les écarte plutôt que de risquer un
    # découpage faux. À traiter séparément.
    cibles = {k: v for k, v in cibles.items() if "#" not in k and "#" not in v}

    par_fichier = {}
    stats = Counter()
    refuses = []

    for pc_label, fr_label in cibles.items():
        bpc = corpus["pc"].get(pc_label)
        bfr = corpus["fr"].get(fr_label)
        if bpc is None or bfr is None:
            stats["source absente"] += 1
            continue

        # --- 1. lire la STRUCTURE de Polished Crystal ---------------------
        src_pc = Path(bpc.fichier).read_text(encoding="utf-8", errors="replace").splitlines()
        d_pc, f_pc, _ = lignes_du_bloc(bpc.fichier, bpc.ligne)
        corps_pc = src_pc[d_pc:f_pc + 1]
        indent = "\t"
        terminateur = None
        pur = True
        for ligne in corps_pc:
            if not ligne.strip():
                continue
            m = RX_LIGNE_TEXTE.match(ligne)
            if m:
                indent = m.group(1)
                continue
            m = RX_TERMINATEUR.match(ligne)
            if m:
                terminateur = m.group(2)
                continue
            pur = False          # macro non textuelle : structure à préserver
        if not pur or terminateur is None:
            stats["écarté (structure non purement textuelle)"] += 1
            continue

        # --- 2. lire le TEXTE et les sauts de ligne du FRANÇAIS ------------
        src_fr = Path(bfr.fichier).read_text(encoding="utf-8", errors="replace").splitlines()
        d_fr, f_fr, _ = lignes_du_bloc(bfr.fichier, bfr.ligne)
        morceaux = []
        pur_fr = True
        for ligne in src_fr[d_fr:f_fr + 1]:
            if not ligne.strip():
                morceaux.append(None)        # ligne vide : séparation visuelle
                continue
            m = RX_LIGNE_TEXTE.match(ligne)
            if m:
                morceaux.append((EQUIV[m.group(2)], m.group(4)))
                continue
            if RX_TERMINATEUR.match(ligne):
                continue
            pur_fr = False
        if not pur_fr or not any(morceaux):
            stats["écarté (source française non purement textuelle)"] += 1
            continue

        # --- 3. réémettre avec les macros de PC ---------------------------
        nouvelles = []
        probleme = None
        for m in morceaux:
            if m is None:
                nouvelles.append("")
                continue
            macro, contenu = m
            converti = conv.texte(contenu)
            converti = reform.get(converti, converti)
            mauvais = encodable(converti, jetons)
            if mauvais:
                probleme = (converti, f"caractère « {mauvais} » hors charmap")
            elif tuiles(converti) > largeur_max(bpc.fichier):
                probleme = (converti, tuiles(converti))
            nouvelles.append(f'{indent}{macro} "{converti}"')
        while nouvelles and not nouvelles[-1]:
            nouvelles.pop()
        nouvelles.append(f"{indent}{terminateur}")
        if probleme:
            refuses.append((pc_label, *probleme))
            stats["refusé"] += 1
            continue

        par_fichier.setdefault(bpc.fichier, []).append((bpc.ligne, nouvelles))
        stats["appliqué"] += 1

    print("=" * 66)
    print("PHASE 2 — application du critère exact" + ("  (SIMULATION)" if simulation else ""))
    print("=" * 66)
    for k, v in stats.most_common():
        print(f"  {v:6d}  {k}")
    print(f"\n  fichiers touchés : {len(par_fichier)}")

    if refuses:
        print(f"\n  ⚠️ {len(refuses)} bloc(s) REFUSÉS — ligne trop longue :")
        for lab, txt, n in refuses[:12]:
            print(f"     {lab}  ({n}) {txt!r}")

    if simulation:
        print("\n  (simulation — relancer avec --appliquer pour écrire)")
        return 0

    # écriture : un fichier à la fois, blocs traités de la fin vers le début
    for fichier, blocs in par_fichier.items():
        lignes = Path(fichier).read_text(encoding="utf-8", errors="replace").splitlines()
        for ligne_label, nouvelles in sorted(blocs, key=lambda b: -b[0]):
            d, f, _ = lignes_du_bloc(fichier, ligne_label)
            lignes[d:f + 1] = nouvelles
        Path(fichier).write_text("\n".join(lignes) + "\n", encoding="utf-8")
    print(f"\n  écrit dans {len(par_fichier)} fichier(s)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
