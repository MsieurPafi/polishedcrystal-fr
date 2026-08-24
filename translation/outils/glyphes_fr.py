#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Dessine les 9 glyphes accentués français dans les 8 polices de Polished Crystal.

POURQUOI COMPOSER PLUTÔT QUE RECOPIER
-------------------------------------
Le Cristal français officiel possède déjà `à â ç è ê î ô ù û`, et ses corps de
lettres sont identiques à ceux de la police `normal` de PC. On pourrait les
recopier. **Mais PC a huit polices** — `normal narrow bold italic serif micr
chicago unown` — que le joueur choisit dans les options (`Options_Typeface`).
Chacune a son propre style d'accent. Recopier donnerait un `è` de style vanilla
au milieu d'un `bold` ou d'un `italic`.

On compose donc chaque glyphe **à partir des lettres de sa propre police** :

  corps    ← la lettre de base de cette police  (a e i o u c)
  accent   ← l'accent AIGU que cette police possède déjà (á é í ó)
             · grave       = l'aigu, retourné horizontalement
             · circonflexe = un chevron bâti sur l'emprise de l'aigu
             · cédille     = dessinée sous le `c`, ligne 7

Chaque lettre hérite ainsi de l'accent de sa propre sœur accentuée : `è` et `ê`
suivent `é`, `à` et `â` suivent `á`, `î` suit `í`, `ô` suit `ó`. `ù` et `û`
n'ont pas de sœur (`ú` n'existe pas) et reprennent le style de `á`.

⚠️ tuile = octet − $80. L'espace (`$7f`) ne vient PAS de ces images mais de
`TextboxSpaceGFX`. Vérifié : la tuile 0 est bien `A` (`$80`).
"""

import struct
import sys
import zlib
from pathlib import Path

try:
    from PIL import Image
except ImportError:
    sys.exit("Pillow requis : pip install Pillow")

sys.path.insert(0, str(Path(__file__).resolve().parent))
from chemins import HACK  # noqa: E402

POLICES = ["normal", "narrow", "bold", "italic", "serif", "micr", "chicago", "unown"]

BASE = 0x80          # la tuile 0 est le caractère $80 ('A')
NOIR, BLANC = 0, 255

# Octets libérés (voir CHARMAP.md) -> caractère français à y placer
CIBLES = {
    0xC1: "à",   # était 'd
    0xC2: "â",   # était 'l
    0xC3: "ç",   # était 'm
    0xC4: "è",   # était 'r
    0xC6: "ê",   # était 't
    0xC7: "î",   # était 'v
    0xC9: "ô",   # était É
    0xCC: "ù",   # était í
    0xCD: "û",   # était ó
}

# caractère -> (octet de la lettre de base, octet de la sœur accentuée ou None)
RECETTE = {
    "à": (0xA0, 0xCA), "â": (0xA0, 0xCA),          # a  ← á
    "è": (0xA4, 0xC8), "ê": (0xA4, 0xC8),          # e  ← é
    "î": (0xA8, 0xCC),                             # i  ← í
    "ô": (0xAE, 0xCD),                             # o  ← ó
    "ù": (0xB4, 0xCA), "û": (0xB4, 0xCA),          # u  ← á (pas de ú)
    "ç": (0xA2, None),                             # c  + cédille
}


# octet de la sœur accentuée -> octet de SA lettre de base (pour isoler l'accent)
RECETTE_BASE = {0xCA: 0xA0, 0xC8: 0xA4, 0xCC: 0xA8, 0xCD: 0xAE}

# quel diacritique porte chaque caractère à composer
FORME = {"à": "grave", "è": "grave", "ù": "grave",
         "â": "circ", "ê": "circ", "î": "circ", "ô": "circ", "û": "circ"}


def ecrire_png_2bits(chemin, im):
    """Réécrit un PNG en niveaux de gris 2 bits, comme les originaux.

    ⚠️ PIL ne sait pas produire du 2 bits : il ignore `bits=2` et sort du
    8 bits, ce qui gonfle les fichiers de 50 % et change leur en-tête. Les
    polices de PC sont toutes en profondeur 2 (4 niveaux, format Game Boy).
    On écrit donc le fichier nous-mêmes.

    Validé en réécrivant un fichier INCHANGÉ : il doit ressortir identique
    octet pour octet à l'original.
    """
    largeur, hauteur = im.size
    px = im.load()
    brut = bytearray()
    for y in range(hauteur):
        brut.append(0)                      # filtre « None »
        ligne = bytearray()
        acc = pos = 0
        for x in range(largeur):
            v = 0 if px[x, y] < 128 else 3  # 2 bits : 0 = noir, 3 = blanc
            acc = (acc << 2) | v
            pos += 1
            if pos == 4:
                ligne.append(acc)
                acc = pos = 0
        if pos:
            ligne.append(acc << (2 * (4 - pos)))
        brut += ligne

    def bloc(typ, data):
        return (struct.pack(">I", len(data)) + typ + data
                + struct.pack(">I", zlib.crc32(typ + data) & 0xFFFFFFFF))

    ihdr = struct.pack(">IIBBBBB", largeur, hauteur, 2, 0, 0, 0, 0)
    Path(chemin).write_bytes(
        b"\x89PNG\r\n\x1a\n"
        + bloc(b"IHDR", ihdr)
        + bloc(b"IDAT", zlib.compress(bytes(brut), 9))
        + bloc(b"IEND", b"")
    )


def lire(im, octet):
    """Les 8x8 pixels d'un caractère, en liste de listes de booléens."""
    largeur = im.width // 8
    idx = octet - BASE
    cx, cy = (idx % largeur) * 8, (idx // largeur) * 8
    px = im.load()
    return [[px[cx + x, cy + y] < 128 for x in range(8)] for y in range(8)]


def ecrire(im, octet, grille):
    largeur = im.width // 8
    idx = octet - BASE
    cx, cy = (idx % largeur) * 8, (idx // largeur) * 8
    px = im.load()
    for y in range(8):
        for x in range(8):
            px[cx + x, cy + y] = NOIR if grille[y][x] else BLANC


def colonnes(ligne):
    return [x for x, v in enumerate(ligne) if v]


def accent_de(soeur, base):
    """L'accent seul = les lignes 0-1 de la sœur accentuée.

    ⚠️ On prend les lignes 0-1 telles quelles, on ne soustrait PAS la lettre
    de base. Première version faite ainsi : le point du `i` se soustrayait de
    l'accent de `í`, l'emprise se décalait d'une colonne et le circonflexe de
    `î` sortait de travers. Les minuscules n'occupent jamais les lignes 0-1
    (sauf le point du `i`, que l'accent remplace justement).

    Rend None si la sœur n'a pas d'accent du tout — c'est le cas de la police
    `unown`, dont les runes ignorent les diacritiques.
    """
    if soeur[0] == base[0] and soeur[1] == base[1]:
        return None
    return [list(soeur[0]), list(soeur[1])]


def emprise(accent):
    xs = colonnes(accent[0]) + colonnes(accent[1])
    if not xs:
        raise ValueError("accent vide")
    return min(xs), max(xs)


def vide():
    return [[False] * 8 for _ in range(8)]


def pose(grille, y, xs):
    for x in xs:
        if 0 <= x < 8:
            grille[y][x] = True


def centre(grille, debut=2):
    xs = [x for y in range(debut, 8) for x in colonnes(grille[y])]
    return (min(xs) + max(xs)) // 2 if xs else 3


def grave_depuis(aigu):
    """L'aigu retourné horizontalement autour de sa propre emprise."""
    x0, x1 = emprise(aigu)
    out = [[False] * 8 for _ in range(2)]
    for y in (0, 1):
        pose(out, y, [x0 + x1 - x for x in colonnes(aigu[y])])
    return out


def circonflexe_depuis(aigu):
    """Un chevron bâti sur l'emprise de l'aigu, à son épaisseur."""
    x0, x1 = emprise(aigu)
    epais = max(len(colonnes(aigu[0])), len(colonnes(aigu[1])))
    cx = (x0 + x1) // 2
    out = [[False] * 8 for _ in range(2)]
    if epais <= 1:
        pose(out, 0, [cx])
        pose(out, 1, [cx - 1, cx + 1])
    else:
        pose(out, 0, [cx, cx + 1])
        pose(out, 1, [cx - 1, cx + 2])
    return out


def decale(accent, delta):
    out = [[False] * 8 for _ in range(2)]
    for y in (0, 1):
        pose(out, y, [x + delta for x in colonnes(accent[y])])
    return out


def cedille_sous(base):
    """Une cédille ligne 7, centrée sur la dernière ligne pleine du `c`.

    La ligne 7 est libre dans toutes les polices (aucune minuscule n'y
    descend), donc le `c` garde sa forme entière — contrairement au Cristal
    français officiel, qui comprime le `c` sur quatre lignes pour loger une
    cédille sur deux.
    """
    derniere = max((y for y in range(7) if any(base[y])), default=6)
    xs = colonnes(base[derniere])
    cx = (min(xs) + max(xs)) // 2
    out = [list(l) for l in base]
    pose(out, 7, [cx, cx + 1])
    return out


def normaliser_e_aigu(im):
    """Aligne l'accent de `é` sur celui de `á`, quand ils diffèrent.

    Dans `normal`, `bold` et `serif`, PC dessine l'accent de `é` décalé à
    gauche et deux fois plus épais que celui de `á` — une incohérence interne
    du hack. Comme `è` et `ê` héritent de l'accent de `é`, cette bizarrerie se
    propagerait à toute la famille `e`, soit 4 187 occurrences.

    Vérifié : une fois `é` aligné sur `á`, les `è` et `ê` composés sont
    **identiques au pixel près** à ceux du Cristal français officiel. Cette
    normalisation ne fait donc pas qu'harmoniser — elle ramène la famille
    entière sur la typographie officielle française.

    ⚠️ C'est le seul endroit où l'on modifie un glyphe **préexistant** de
    Polished Crystal. Décidé avec l'utilisateur (décision D2).
    """
    a, e = lire(im, 0xA0), lire(im, 0xA4)
    a_aigu, e_aigu = lire(im, 0xCA), lire(im, 0xC8)
    if a_aigu == a:
        # Police sans diacritiques (unown) : `á` y est identique à `a`, donc
        # il n'y a aucun accent à propager. Première version sans ce test :
        # elle comparait les lignes 0-1 de deux runes DIFFÉRENTES, les jugeait
        # incohérentes, et écrasait le `é` d'unown par un mélange des deux.
        return False
    if [a_aigu[0], a_aigu[1]] == [e_aigu[0], e_aigu[1]]:
        return False                       # déjà cohérente
    accent = decale([a_aigu[0], a_aigu[1]], centre(e) - centre(a))
    neuf = vide()
    for y in range(2, 8):
        neuf[y] = list(e[y])
    for y in (0, 1):
        for x in colonnes(accent[y]):
            neuf[y][x] = True
    ecrire(im, 0xC8, neuf)
    return True


def composer(im, caractere):
    octet_base, octet_soeur = RECETTE[caractere]
    base = lire(im, octet_base)
    if caractere == "ç":
        return cedille_sous(base)

    soeur = lire(im, octet_soeur)
    aigu = accent_de(soeur, lire(im, RECETTE_BASE[octet_soeur]))
    if aigu is None:
        # Police sans diacritiques (unown) : on rend la lettre telle quelle,
        # exactement comme PC le fait déjà pour son propre `á`.
        return base

    accent = {"grave": grave_depuis, "circ": circonflexe_depuis}[FORME[caractere]](aigu)
    # Recentrer si la lettre visée n'a pas la même emprise que la lettre
    # dont l'accent est emprunté (cas de `ù`/`û`, empruntés à `á`).
    delta = centre(base) - centre(lire(im, RECETTE_BASE[octet_soeur]))
    if delta:
        accent = decale(accent, delta)

    out = vide()
    for y in range(2, 8):          # lignes 0-1 laissées vierges : elles
        out[y] = list(base[y])     # accueillent l'accent, et le point du `i`
    for y in (0, 1):               # doit disparaître sous le circonflexe
        for x in colonnes(accent[y]):
            out[y][x] = True
    return out


def art(grille):
    return ["".join("#" if v else "." for v in ligne) for ligne in grille]


def main():
    apercu = "--apercu" in sys.argv or "-n" in sys.argv
    for nom in POLICES:
        chemin = HACK / "gfx/font" / f"{nom}.png"
        im = Image.open(chemin).convert("L")
        normalise = normaliser_e_aigu(im)   # AVANT de composer è et ê
        # Tout lire AVANT d'écrire : í et ó sont des sources ET des cibles.
        composes = {}
        for octet, car in CIBLES.items():
            composes[octet] = composer(im, car)
        for octet, grille in composes.items():
            ecrire(im, octet, grille)
        if apercu:
            print(f"  === {nom} ===")
            cars = list(CIBLES.items())
            for debut in range(0, len(cars), 5):
                groupe = cars[debut:debut + 5]
                print("    " + "     ".join(f"{c} $%02x" % o for o, c in groupe))
                arts = [art(composes[o]) for o, _ in groupe]
                for y in range(8):
                    print("     " + "    ".join(a[y] for a in arts))
                print()
        else:
            ecrire_png_2bits(chemin, im)
            print(f"  {nom}.png : 9 glyphes écrits"
                  + ("  + é normalisé" if normalise else ""))
    return 0


if __name__ == "__main__":
    sys.exit(main())
