#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Amorce le glossaire anglais → français depuis les tables NOMMÉES du Cristal
officiel (pokecrystal ↔ pokecrystal-fr).

Deux modes d'appariement, et le choix entre les deux n'est pas cosmétique :

  « label »      — « Fire: db "FIRE@" » ↔ « Fire: db "FEU@" ».
                   EXACT. C'est le mode à préférer partout où il est possible.

  « position »   — « li "POUND" » ↔ « li "ECRAS'FACE" », appariés par rang.
                   Le cahier de mission interdit l'appariement par position
                   POUR LES LIGNES DE TEXTE, et il a raison : deux traductions
                   n'ont pas la même longueur. Mais ces tables-ci sont
                   INDEXÉES par une constante (MOVE_*, ITEM_*, dex national) :
                   le rang EST l'identifiant. C'est le seul endroit du
                   chantier où la position est une clé légitime.

                   Garde-fou : si les deux côtés n'ont pas exactement le même
                   nombre d'entrées, la table est REFUSÉE en bloc. Un décalage
                   d'un rang produirait un glossaire faux et silencieux —
                   « ECRAS'FACE » collé sur « KARATE CHOP ».

Sortie : translation/donnees/glossaire_officiel.tsv
"""

import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from chemins import EN, FR, DONNEES, relatif  # noqa: E402

# fichier, mode, catégorie
TABLES = [
    ("data/pokemon/names.asm",        "position", "Pokémon"),
    ("data/moves/names.asm",          "position", "Capacité"),
    ("data/items/names.asm",          "position", "Objet"),
    ("data/trainers/class_names.asm", "position", "Classe de dresseur"),
    ("data/decorations/names.asm",    "position", "Décoration"),
    ("data/battle/stat_names.asm",    "position", "Statistique"),
    ("data/types/names.asm",          "label",    "Type"),
    ("data/items/pocket_names.asm",   "label",    "Poche"),
    ("data/phone/non_trainer_names.asm", "label", "Contact Pokématos"),
    ("data/maps/landmarks.asm",       "label",    "Lieu"),
]

RX_LISTE = re.compile(r'^\s*(?:li|dname)\s+"([^"]*)"')
RX_LABEL = re.compile(r'^\s*(\.?\w+):\s*db\s+"([^"]*?)@?"')


def lire(chemin: Path, mode: str):
    if not chemin.is_file():
        return None
    lignes = chemin.read_text(encoding="utf-8", errors="replace").splitlines()
    if mode == "position":
        return [m.group(1) for l in lignes if (m := RX_LISTE.match(l))]
    return [(m.group(1), m.group(2)) for l in lignes if (m := RX_LABEL.match(l))]


def main():
    entrees = []
    refus = []
    for rel, mode, categorie in TABLES:
        en, fr = lire(EN / rel, mode), lire(FR / rel, mode)
        if en is None or fr is None:
            refus.append((rel, "fichier absent d'un des deux dépôts"))
            continue
        if not en:
            refus.append((rel, "aucune entrée reconnue — motif d'analyse à revoir"))
            continue

        if mode == "position":
            if len(en) != len(fr):
                refus.append((rel, f"{len(en)} entrées EN ≠ {len(fr)} FR — "
                                   f"table refusée en bloc, un décalage de rang "
                                   f"produirait un glossaire faux"))
                continue
            paires = zip(en, fr)
        else:
            dfr = dict(fr)
            manquants = [k for k, _ in en if k not in dfr]
            if manquants:
                refus.append((rel, f"{len(manquants)} labels absents côté FR : "
                                   f"{', '.join(manquants[:5])}"))
            paires = ((v, dfr[k]) for k, v in en if k in dfr)

        n = 0
        for a, b in paires:
            a, b = a.strip(), b.strip()
            if not a or not b:
                continue
            entrees.append((categorie, a, b, "identique" if a == b else "", rel))
            n += 1
        print(f"  {categorie:22s} {n:5d}  ({relatif(EN / rel)})")

    DONNEES.mkdir(parents=True, exist_ok=True)
    sortie = DONNEES / "glossaire_officiel.tsv"
    with sortie.open("w", encoding="utf-8") as f:
        f.write("categorie\tanglais\tfrancais\tnote\tsource\n")
        for e in sorted(set(entrees)):
            f.write("\t".join(e) + "\n")

    identiques = sum(1 for e in entrees if e[3] == "identique")
    print(f"\n  {len(entrees)} entrées → {relatif(sortie)}")
    print(f"  dont {identiques} identiques en français "
          f"(CONFIRMATIONS, pas des lacunes — cf. §4 du cahier)")

    if refus:
        print("\n  ⚠️  Tables écartées — à examiner, un « 0 » n'est jamais bon signe :")
        for rel, motif in refus:
            print(f"      {rel}\n        {motif}")

    # Contrôle sur cas connu : si celui-ci tombe, le reste ment aussi.
    temoins = {("Pokémon", "BULBASAUR"): "BULBIZARRE",
               ("Capacité", "POUND"): "ECRAS'FACE"}
    index = {(c, a): b for c, a, b, _, _ in entrees}
    for cle, attendu in temoins.items():
        obtenu = index.get(cle)
        etat = "✓" if obtenu == attendu else "✗"
        print(f"  {etat} témoin {cle[1]} → {obtenu} (attendu {attendu})")
        if obtenu != attendu:
            return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
