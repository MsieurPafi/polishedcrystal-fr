#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Tri de l'inventaire : sépare le travail RÉEL du plafond brut.

Le cahier de mission est formel : le total du critère exact est un **plafond**,
et il « ment d'un facteur qui peut dépasser dix ». Sur le chantier jumeau, un
reliquat annoncé de 659 chaînes est tombé à **7** réelles — sans traduire une
seule ligne, uniquement en triant mieux.

CE QUE CET OUTIL SÉPARE
-----------------------
- **symboles orphelins** — déclarés, cités par aucun autre fichier. Un label
  déclaré n'est pas un texte affiché (`PIEGES.md` #9).
- **le reste**, ventilé par domaine, pour savoir où le travail se trouve.

CE QU'IL NE MESURE PAS, ET LE DIT
---------------------------------
⚠️ **L'accessibilité en jeu** — quelles cartes le joueur atteint réellement —
n'est pas mesurée. Elle demande une analyse de connectivité des cartes que cet
outil ne fait pas. Le décompte ci-dessous inclut donc du texte peut-être
inatteignable. **Ne pas le présenter comme le chiffre final.**
"""

import re
import subprocess
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from chemins import HACK, relatif                  # noqa: E402
import inventaire as I                             # noqa: E402

# Labels dont l'absence de référence textuelle est NORMALE : ils sont
# fabriqués par des macros ou appelés par table. Repris de l'esprit de
# `utils/unreferenced.py` du dépôt amont.
FAUX_ORPHELINS = re.compile(r"""
      ^Battle(?:Text|Command)
    | Description$
    | ^Move\d+Description$
    | PokedexEntry$
    | ^Unknown
""", re.VERBOSE)


def index_references(racine):
    """Compte les occurrences de chaque identifiant dans tout le dépôt.

    ⚠️ Comptage TEXTUEL, pas sémantique. Un label cité une seule fois est
    sa propre déclaration, donc orphelin. Deux fois ou plus : référencé.
    """
    fichiers = subprocess.run(
        ["git", "-C", str(racine), "ls-files", "*.asm"],
        capture_output=True, text=True, check=True,
    ).stdout.split()
    if not fichiers:
        raise RuntimeError(f"aucun .asm versionné dans {racine}")
    compte = Counter()
    locaux = {}          # fichier -> Counter des « .Enfant »
    rx = re.compile(r"\b[A-Za-z_][A-Za-z0-9_]*\b")
    # ⚠️ Les labels LOCAUX sont cités par leur forme COURTE (`.Enfant`), pas
    # par leur nom qualifié. Sans ce second index, 3 622 labels parfaitement
    # référencés passaient pour orphelins — 86 % du total annoncé.
    rx_local = re.compile(r"\.[A-Za-z_][A-Za-z0-9_]*")
    for rel in fichiers:
        texte = (racine / rel).read_text(encoding="utf-8", errors="replace")
        compte.update(rx.findall(texte))
        locaux[str(racine / rel)] = Counter(rx_local.findall(texte))
    return compte, locaux


def domaine(chemin):
    rel = relatif(chemin)
    p = rel.split("/", 1)[-1]
    for prefixe, nom in [
        ("maps/", "cartes"),
        ("data/text/", "textes communs"),
        ("data/phone/", "Pokématos"),
        ("data/pokemon/dex_entries", "Pokédex"),
        ("data/moves/", "capacités"),
        ("data/items/", "objets"),
        ("data/abilities/", "talents"),
        ("data/battle", "combat"),
        ("engine/", "moteur"),
        ("data/", "autres données"),
    ]:
        if p.startswith(prefixe):
            return nom
    return "divers"


def controle_detecteur(refs, locaux):
    """Cas fabriqué : le détecteur voit-il ce qu'il doit voir ?

    Un « 0 orphelin » n'est jamais une bonne nouvelle tant qu'il n'est pas
    prouvé — et un « beaucoup d'orphelins » non plus.
    """
    invente = "CeLabelNExistePasDuTout_" + "x" * 8
    assert refs[invente] == 0, "un label inexistant devrait compter 0"
    # un label franchement référencé doit compter plus de 1
    temoin = "PokemonNames"
    assert refs[temoin] > 1, (
        f"le témoin {temoin} devrait être référencé plusieurs fois "
        f"(compté {refs[temoin]}) — le détecteur est cassé")
    # et un label local franchement référencé
    total_locaux = sum(sum(c.values()) for c in locaux.values())
    assert total_locaux > 1000, "l'index des labels locaux paraît vide"
    return (f"détecteur contrôlé : {temoin} vu {refs[temoin]} fois, "
            f"label inventé vu 0 fois, {total_locaux} références locales indexées")


def main():
    cat, exclus, corpus = I.classer()
    refs, locaux = index_references(HACK)
    print("  " + controle_detecteur(refs, locaux))
    pc = corpus["pc"]

    # catégories qui représentent du travail (le reste est déjà résolu)
    travail = {
        "applicable": [l for l in cat["applicable"]],
        "renomme": [l for l, _ in cat["renomme"]],
        "retouche": [l for l in cat["retouche"]],
        "ambigu": [l for l in cat["ambigu"]],
        "propre_au_hack": [l for l in cat["propre_au_hack"]],
    }

    print("=" * 68)
    print("TRIAGE — du plafond au travail réel")
    print("=" * 68)

    orphelins = Counter()
    retenus = Counter()
    par_domaine = Counter()
    for cle, labels in travail.items():
        for label in labels:
            # ⚠️ Un bloc IMPLICITE (« Parent#3 ») est du texte EN LIGNE, écrit
            # au milieu d'un script. Il n'a pas de nom dans la source, donc
            # rien ne peut le citer : le compter orphelin gonflait le tri de
            # près de 3 000 blocs pourtant bien affichés en jeu.
            if "#" in label:
                est_orphelin = False
            elif "." in label:
                court = "." + label.split(".", 1)[1]
                n = locaux.get(pc[label].fichier, Counter())[court]
                est_orphelin = n <= 1 and not FAUX_ORPHELINS.search(label)
            else:
                est_orphelin = (refs[label] <= 1
                                and not FAUX_ORPHELINS.search(label))
            if est_orphelin:
                orphelins[cle] += 1
            else:
                retenus[cle] += 1
                par_domaine[(cle, domaine(pc[label].fichier))] += 1

    print("\n  catégorie              plafond   orphelins   RETENU")
    print("  " + "-" * 52)
    tot_p = tot_o = tot_r = 0
    for cle, libelle in [("applicable", "applicable"), ("renomme", "renommé"),
                         ("retouche", "retouché"), ("ambigu", "ambigu"),
                         ("propre_au_hack", "propre au hack")]:
        p, o, r = len(travail[cle]), orphelins[cle], retenus[cle]
        tot_p += p; tot_o += o; tot_r += r
        print(f"  {libelle:<22s} {p:6d}  {o:9d}  {r:7d}")
    print("  " + "-" * 52)
    print(f"  {'TOTAL':<22s} {tot_p:6d}  {tot_o:9d}  {tot_r:7d}")

    print("\n  OÙ SE TROUVE LE TRAVAIL RESTANT (à rédiger)")
    for (cle, dom), n in par_domaine.most_common():
        if cle == "propre_au_hack":
            print(f"     {n:5d}  {dom}")

    print("\n  OÙ SE TROUVE LE TRAVAIL MÉCANIQUE (reprise de l'officiel)")
    mec = Counter()
    for (cle, dom), n in par_domaine.items():
        if cle in ("applicable", "renomme", "retouche", "ambigu"):
            mec[dom] += n
    for dom, n in mec.most_common():
        print(f"     {n:5d}  {dom}")

    print("\n" + "-" * 68)
    print("  ⚠️ NON MESURÉ : l'accessibilité en jeu. Une partie de ce texte")
    print("     est peut-être sur des cartes que le joueur n'atteint jamais.")
    print("     Ce chiffre reste donc un MAJORANT du travail réel.")
    print("-" * 68)


if __name__ == "__main__":
    main()
