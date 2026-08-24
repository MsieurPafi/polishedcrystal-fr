#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Inventaire au CRITÈRE EXACT.

    Une chaîne est applicable si et seulement si
        PolishedCrystal == pokecrystal (EN)   ET   pokecrystal-fr (FR) != EN

**Jamais de score de similarité, jamais d'heuristique de détection d'anglais.**
Sur le chantier jumeau, trois détecteurs successifs ont échoué dans les deux
sens, et chacun a laissé passer des chaînes vues en jeu.

L'appariement se fait **PAR LABEL**, jamais par numéro de ligne : les deux
dépôts divergent en longueur dès qu'une traduction prend une ligne de plus.

CE QUE CET OUTIL ANNONCE
------------------------
Un **plafond**, pas une liste de tâches. Le tri (`triage.py`) le réduit.

CE QU'IL EXCLUT, ET LE DIT
--------------------------
- les blocs **conditionnels** (`if DEF(FAITHFUL)`) : le lecteur en concatène
  les deux branches, leur chaîne n'est comparable à rien ;
- les labels **sans texte** (renvois `text_far`, pointeurs) ;
- `mobile/`, `engine/debug/` et le mystery gift : code mort, et absent de PC.
"""

import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from chemins import EN, FR, HACK, relatif          # noqa: E402
from lecteur import lire_depot                     # noqa: E402

MORT = ("mobile/", "engine/debug/", "engine/link/mystery_gift")

# --- NORMALISATION AVANT COMPARAISON -------------------------------------
# ⚠️ Sans elle, le critère exact échoue sur de purs écarts de NOTATION et
# sous-compte massivement (`PIEGES.md` #10). Mesuré : la première version de
# cet inventaire classait 1 849 blocs « retouchés par le hack », dont **1 311
# ne différaient que par la casse**.
#
# Polished Crystal a converti systématiquement la casse ALL-CAPS du vanilla
# en casse mixte : « LUCKY NUMBER SHOW! » -> « Lucky Number Show! »,
# « PROF.ELM » -> « Prof.Elm », « #MON » -> « #mon », « FARFETCH'D » ->
# « Farfetch'd ». Ce n'est pas une retouche de contenu.
#
# ⚠️ La casse est ignorée POUR COMPARER. Elle ne l'est pas pour ÉCRIRE :
# le français repris devra suivre la convention de casse de PC.
JETONS_EQUIVALENTS = [
    ("<PLAY_G>", "<PLAYER>"),   # renommage 1:1 (205 EN / 206 PC)
    ("<……>", "……"),            # vanilla : une tuile valant « …… »
]


def pour_comparer(texte):
    for vieux, neuf in JETONS_EQUIVALENTS:
        texte = texte.replace(vieux, neuf)
    return texte.lower()


def vivant(bloc):
    rel = relatif(bloc.fichier)
    return not rel.split("/", 1)[-1].startswith(MORT)


def classer():
    en, fr, pc = (lire_depot(d) for d in (EN, FR, HACK))

    def utiles(d):
        return {k: v for k, v in d.items()
                if v.a_du_texte and not v.conditionnel and vivant(v)}

    en_u, fr_u, pc_u = utiles(en), utiles(fr), utiles(pc)

    exclus = Counter()
    for nom, brut, filtre in (("EN", en, en_u), ("FR", fr, fr_u), ("PC", pc, pc_u)):
        exclus[nom + " conditionnels"] = sum(
            1 for v in brut.values() if v.a_du_texte and v.conditionnel)
        exclus[nom + " code mort"] = sum(
            1 for v in brut.values() if v.a_du_texte and not vivant(v))

    cat = {k: [] for k in
           ("applicable", "confirme", "retouche", "renomme",
            "ambigu", "propre_au_hack", "sans_reference")}

    # Index du texte vanilla par CONTENU : le hack renomme parfois un label
    # sans toucher au texte. Sans cet index, ces blocs passent pour du
    # contenu neuf alors que le français officiel s'y applique.
    par_texte = {}
    for lab, b in en_u.items():
        par_texte.setdefault(pour_comparer(b.texte_normalise()), []).append(lab)

    for label, bpc in pc_u.items():
        tpc = pour_comparer(bpc.texte_normalise())
        ben = en_u.get(label)
        if ben is None:
            # Label absent du vanilla : est-ce du texte NEUF, ou un label
            # RENOMMÉ ? On cherche le même texte sous un autre nom.
            # ⚠️ Uniquement si UN SEUL label vanilla le porte : sinon
            # l'appariement serait ambigu, et `Move00Description` (« ? »)
            # se retrouverait apparié à un texte du Prof. Chen.
            jumeaux = par_texte.get(tpc, [])
            if len(jumeaux) == 1 and len(tpc) >= 8:
                cat["renomme"].append((label, jumeaux[0]))
            elif jumeaux:
                # Le texte EXISTE en vanilla, mais plusieurs labels le
                # portent : l'appariement serait un pari. Catégorie à part,
                # récupérable au cas par cas, pas à rédiger de zéro.
                cat["ambigu"].append(label)
            else:
                cat["propre_au_hack"].append(label)
            continue
        ten = pour_comparer(ben.texte_normalise())
        bfr = fr_u.get(label)
        if bfr is None:
            cat["sans_reference"].append(label)
            continue
        tfr = pour_comparer(bfr.texte_normalise())
        if tpc != ten:
            cat["retouche"].append(label)
        elif tfr == ten:
            cat["confirme"].append(label)
        else:
            cat["applicable"].append(label)

    return cat, exclus, dict(en=en_u, fr=fr_u, pc=pc_u)


LIBELLES = [
    ("renomme", "RENOMMÉ par le hack — même texte, autre label : l'officiel s'applique"),
    ("applicable", "APPLICABLE — critère exact rempli, le français officiel se reprend tel quel"),
    ("retouche", "retouché par le hack — l'officiel reste utilisable, avec report de la retouche"),
    ("confirme", "confirmé — FR == EN, le terme ne se traduit pas"),
    ("ambigu", "texte vanilla, appariement ambigu — récupérable au cas par cas"),
    ("propre_au_hack", "propre au hack — aucun équivalent vanilla, à rédiger"),
    ("sans_reference", "sans référence française — présent en EN, absent de la VF"),
]


def main():
    cat, exclus, corpus = classer()
    total = sum(len(v) for v in cat.values())
    print("=" * 68)
    print("INVENTAIRE AU CRITÈRE EXACT")
    print("=" * 68)
    print(f"  blocs de texte retenus dans Polished Crystal : {total}\n")
    for cle, libelle in LIBELLES:
        n = len(cat[cle])
        print(f"  {n:6d}  {100*n/total:5.1f} %   {libelle}")
    print("\n" + "-" * 68)
    print("  EXCLUS DU PÉRIMÈTRE (annoncés, pas cachés)")
    for k, v in exclus.items():
        if v:
            print(f"     {v:5d}  {k}")
    print("-" * 68)
    print("\n  ⚠️ Ce total est un PLAFOND, pas une liste de tâches.")
    print("     Le tri (triage.py) en retire les symboles orphelins et")
    print("     le contenu hors d'atteinte. Ne rien promettre avant.")
    return cat, corpus


if __name__ == "__main__":
    main()
