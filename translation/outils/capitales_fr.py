#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Dessine les 4 CAPITALES accentuées françaises dans les 8 polices.

POURQUOI C'EST DIFFÉRENT DES MINUSCULES
---------------------------------------
Une minuscule occupe les lignes 2 à 6 : les lignes 0-1 sont libres et
accueillent l'accent. **Une capitale occupe les lignes 0 à 6** — il n'y a
aucune place au-dessus.

Polished Crystal résolvait déjà le problème pour son `É` : le `E` y est
**comprimé de 7 lignes à 5**, et l'accent occupe les deux lignes libérées.

On reproduit cette compression algorithmiquement :

    ligne 0 du résultat = lignes 0 ET 1 de la capitale, fusionnées
    lignes 1 à 3        = lignes 2, 3, 4
    ligne 4 du résultat = lignes 5 ET 6, fusionnées

⚠️ **Validé** : appliqué au `E`, cet algorithme redonne **exactement** le corps
du `É` que le dessinateur de PC avait tracé à la main. Voir `controle()`.

`Ç` fait exception : la cédille se pose sous la lettre, ligne 7, qui est libre.
Le `C` n'a donc pas besoin d'être comprimé et garde sa forme entière.
"""

import sys
from pathlib import Path

from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parent))
from chemins import HACK                                        # noqa: E402
from glyphes_fr import (POLICES, BASE, lire, ecrire, colonnes, vide, pose,   # noqa: E402
                        circonflexe_depuis, ecrire_png_2bits, art)

# Octets libérés (2e vague) -> capitale à y placer
CIBLES = {
    0xBA: "É",   # était “
    0xBB: "Ç",   # était ”
    0xC5: "Î",   # était 's
    0xDB: "Â",   # était ×
}

# capitale -> octet de la lettre de base
BASES = {"É": 0x84, "Ç": 0x82, "Î": 0x88, "Â": 0x80}   # E C I A


def comprimer(g):
    """Comprime une capitale de 7 lignes (0-6) à 5 lignes, façon PC."""
    return [[a or b for a, b in zip(g[0], g[1])],
            list(g[2]), list(g[3]), list(g[4]),
            [a or b for a, b in zip(g[5], g[6])]]


def cedille_sous_capitale(base):
    """Cédille ligne 7, centrée sous la dernière ligne pleine de la lettre."""
    derniere = max((y for y in range(7) if any(base[y])), default=6)
    xs = colonnes(base[derniere])
    cx = (min(xs) + max(xs)) // 2
    out = [list(l) for l in base]
    pose(out, 7, [cx, cx + 1])
    return out


def composer_capitale(im, car, aigu, ancien_E_aigu, sans_accents):
    base = lire(im, BASES[car])

    if sans_accents:
        # Police sans diacritiques (`unown`) : ses « lettres » sont des runes,
        # les comprimer n'aurait aucun sens. On rend la lettre telle quelle,
        # comme PC le faisait déjà pour son propre `É`.
        return base

    if car == "É":
        # ⚠️ On REPREND le glyphe que le dessinateur de PC avait tracé, on ne
        # le recalcule pas. Dans `serif` il conserve des empattements que la
        # compression automatique perdait, et dans `chicago` il est décalé
        # d'un pixel. Notre algorithme est une approximation ; le sien est
        # le dessin de référence.
        return [list(l) for l in ancien_E_aigu]

    if car == "Ç":
        return cedille_sous_capitale(base)

    corps = comprimer(base)
    if False:
        pass
    else:
        # ⚠️ Le circonflexe se centre sur la LETTRE, pas sur l'emprise de
        # l'accent aigu. L'aigu de `É` est volontairement décalé (c'est sa
        # nature) ; en hériter donnait un `Î` dont le chevron tombait à côté
        # du fût.
        xs = [x for l in corps for x in colonnes(l)]
        cx = (min(xs) + max(xs)) // 2
        epais = max(len(colonnes(aigu[0])), len(colonnes(aigu[1])))
        accent = [[False] * 8 for _ in range(2)]
        if epais <= 1:
            pose(accent, 0, [cx])
            pose(accent, 1, [cx - 1, cx + 1])
        else:
            pose(accent, 0, [cx, cx + 1])
            pose(accent, 1, [cx - 1, cx + 2])
    out = vide()
    for y in range(5):
        out[y + 2] = corps[y]
    for y in (0, 1):
        for x in colonnes(accent[y]):
            out[y][x] = True
    return out


def accent_capital_origine(police):
    """L'accent aigu du `É` que PC dessinait, récupéré de l'historique git.

    On ne l'invente pas : c'est le dessinateur du hack qui a choisi sa
    position et son épaisseur pour une capitale.
    """
    import io
    import subprocess
    brut = subprocess.run(
        ["git", "-C", str(HACK), "show", f"413d98e01~1:gfx/font/{police}.png"],
        capture_output=True, check=True).stdout
    ancien = Image.open(io.BytesIO(brut)).convert("L")
    g = lire(ancien, 0xC9)          # $c9 portait « É » avant la 1re vague
    return [list(g[0]), list(g[1])], g


def controle(police, aigu, ancien_E_aigu):
    """L'algorithme de compression redonne-t-il le corps dessiné à la main ?"""
    im = Image.open(HACK / "gfx/font" / f"{police}.png").convert("L")
    corps_calcule = comprimer(lire(im, 0x84))          # E comprimé
    corps_dessine = [list(l) for l in ancien_E_aigu[2:7]]
    return corps_calcule == corps_dessine


def main():
    apercu = "--apercu" in sys.argv
    for police in POLICES:
        chemin = HACK / "gfx/font" / f"{police}.png"
        im = Image.open(chemin).convert("L")
        aigu, ancien = accent_capital_origine(police)
        ok = controle(police, aigu, ancien)
        sans_accents = ancien[2:7] == lire(im, 0x84)[2:7] and ancien[:2] == lire(im, 0x84)[:2]
        composes = {o: composer_capitale(im, c, aigu, ancien, sans_accents)
                    for o, c in CIBLES.items()}
        if apercu:
            etat = ("police sans diacritiques" if sans_accents
                    else ("✓ compression conforme au dessin de PC" if ok
                          else "compression approchée (É repris de PC)"))
            print(f"  === {police} ===   {etat}")
            cars = list(CIBLES.items())
            print("    " + "     ".join(f"{c} $%02x" % o for o, c in cars))
            arts = [art(composes[o]) for o, _ in cars]
            for y in range(8):
                print("     " + "    ".join(a[y] for a in arts))
            print()
        else:
            for o, g in composes.items():
                ecrire(im, o, g)
            ecrire_png_2bits(chemin, im)
            print(f"  {police}.png : 4 capitales écrites"
                  + ("  (sans diacritiques)" if sans_accents
                     else ("  (compression validée)" if ok
                           else "  (É repris de PC, Î/Â comprimés)")))
    return 0


if __name__ == "__main__":
    sys.exit(main())
