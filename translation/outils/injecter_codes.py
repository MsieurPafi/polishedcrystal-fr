#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Réinjecte les codes de Huffman dans constants/charmap.asm.

Préserve les octets : seule la longueur des codes change, l'attribution
octet -> caractère reste celle du charmap.

Contrôle intégré : l'arbre doit rester **préfixe** (aucun code n'en préfixe
un autre), sans quoi le décodage part en vrille sans que rien ne le signale.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from chemins import HACK  # noqa: E402


def main():
    if len(sys.argv) != 2:
        sys.exit(f"usage : {sys.argv[0]} codes.txt")
    codes = {}
    for ligne in Path(sys.argv[1]).read_text(encoding="utf-8").splitlines():
        m = re.match(r'"((?:[^"\\]|\\.)*)": ([01]+)\s*$', ligne)
        if m:
            codes[m.group(1)] = m.group(2)
    if not codes:
        sys.exit("aucun code lu — ne pas croire un résultat vide")

    tri = sorted(codes.values())
    for a, b in zip(tri, tri[1:]):
        if b.startswith(a):
            sys.exit(f"ARBRE INVALIDE : le code {a!r} en préfixe un autre ({b!r})")

    p = HACK / "constants/charmap.asm"
    s = p.read_text(encoding="utf-8")
    manquants, n = [], 0

    def remplace(m):
        nonlocal n
        jeton, octet = m.group(1), m.group(2)
        if jeton not in codes:
            manquants.append(jeton)
            return m.group(0)
        n += 1
        return '\tctxtmap %-11s %s, %s' % (f'"{jeton}",', octet, codes[jeton])

    s = re.sub(r'\tctxtmap\s+"((?:[^"\\]|\\.)*)",\s*(\$[0-9a-f]+),\s*[01]+', remplace, s)
    p.write_text(s, encoding="utf-8")
    print(f"     {n} codes réinjectés, arbre préfixe valide")
    if manquants:
        print(f"     ⚠️ sans nouveau code : {manquants}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
