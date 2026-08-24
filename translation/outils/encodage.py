#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Simulateur de l'encodage de texte de Polished Crystal.

Reproduit fidèlement la machine à états de `macros/scripts/text.asm`, qui est
plus subtile qu'un simple « Huffman » :

1. Un bloc de texte commence en mode BRUT, avec le charmap `default` —
   n-grammes actifs. Chaque jeton coûte 1 octet.

2. Dès qu'un jeton possède un code Huffman de MOINS DE 8 BITS, le mode
   COMPRIMÉ s'enclenche : un octet `<CTXT>`, puis un flux de bits. Et le
   charmap bascule sur `compressing`, qui n'a PAS de n-grammes.
   → **n-grammes et Huffman s'excluent mutuellement.**

3. Si, en mode comprimé, un caractère SANS code Huffman survient, la
   compression est ABANDONNÉE pour tout le bloc, qui repart en octets bruts.

4. À la fin du bloc, les deux tailles sont comparées et **la plus petite est
   retenue**.

⚠️ Conséquence décisive pour le français : un caractère accentué ajouté sans
code Huffman ferait échouer la compression de TOUT bloc le contenant. Avec
« é » 3 253 fois et « à » 899 fois dans le Cristal français officiel, cela
concernerait la quasi-totalité du texte. Les accents DOIVENT recevoir un
`ctxtmap`, pas un `charmap`.

Ce module ne sert à rien tant qu'il n'est pas validé : voir `valider()`, qui
le confronte aux tailles réelles mesurées dans la ROM compilée.
"""

import math
import re
from pathlib import Path


class Tables:
    """Les tables d'encodage lues dans un charmap.asm."""

    def __init__(self, chemin_charmap: Path):
        self.ngrammes = {}   # chaîne -> octet   ($0a-$4c), pas de code Huffman
        self.huffman = {}    # chaîne -> code binaire (str de '0'/'1')
        self.simples = {}    # chaîne -> octet, sans code Huffman
        for ligne in Path(chemin_charmap).read_text(encoding="utf-8").splitlines():
            m = re.match(r'\s*ctxtmap\s+"((?:[^"\\]|\\.)*)"\s*,\s*\$([0-9a-fA-F]+)\s*,\s*([01]+)', ligne)
            if m:
                self.huffman[m.group(1)] = m.group(3)
                continue
            m = re.match(r'\s*charmap\s+"((?:[^"\\]|\\.)*)"\s*,\s*\$([0-9a-fA-F]+)', ligne)
            if m:
                valeur = int(m.group(2), 16)
                if 0x0A <= valeur <= 0x4C:
                    self.ngrammes[m.group(1)] = valeur
                else:
                    self.simples.setdefault(m.group(1), valeur)
        self._maj_jetons()

    def _maj_jetons(self):
        # RGBDS applique le charmap par correspondance la PLUS LONGUE d'abord.
        tous = set(self.ngrammes) | set(self.huffman) | set(self.simples)
        self.jetons_defaut = sorted(tous, key=len, reverse=True)
        self.jetons_compr = sorted(
            set(self.huffman) | set(self.simples), key=len, reverse=True
        )

    def code(self, jeton):
        return self.huffman.get(jeton)


def _jeton_a(s, i, jetons):
    for t in jetons:
        if s.startswith(t, i):
            return t
    return s[i]


# Macros qui INTERROMPENT la compression (stop_compressing_text) et
# coûtent leurs propres octets. Les rater fait sous-estimer de 1 à 4 octets
# par occurrence — c'est ce qui a fait tomber la validation à 57,6 % au
# premier essai. Coûts lus dans macros/scripts/text.asm.
COUPURES = {
    "text_start": 1,          # <START>
    "text_ram": 3,            # <RAM> + dw
    "text_promptbutton": 1,   # <WAIT>
    "text_asm": 1,            # <ASM>
    "text_decimal": 4,        # <NUM> + dw + dn
    "text_pause": 1,          # <PAUSE>
    "text_sound": 2,          # <SOUND> + db
    "text_today": 1,          # <DAY>
    "text_far": 4,            # <FAR> + bigdw + db
    "text_farend": 4,
    "text_plural": 1,         # <PLURAL>
    "text_end": 1,            # @
}

PREFIXES = {"text": "", "line": "<LINE>", "cont": "<CONT>", "para": "<PARA>",
            "next": "<NEXT>", "next1": "<LNBRK>"}


def cout_segment(s: str, tab: Tables, terminateur_ajoute: bool) -> int:
    """Octets d'UN segment — une suite de _dtxt non interrompue.

    `terminateur_ajoute` : vrai quand le segment est coupé par une macro,
    auquel cas un « @ » est compté dans le flux comprimé mais PAS dans la
    version brute (cf. `_compression_terminator`).
    """
    prefixe = bruts = bits = 0
    mode = "pre"
    i, n = 0, len(s)
    while i < n:
        jetons = tab.jetons_defaut if mode == "pre" else tab.jetons_compr
        t = _jeton_a(s, i, jetons)
        c = tab.code(t)
        if mode == "pre":
            if c is not None and len(c) < 8:
                mode = "comp"
                continue
            prefixe += 1
            i += len(t)
            continue
        if c is None:
            mode = "pre"
            prefixe += bruts
            bruts = bits = 0
            continue
        bits += len(c)
        bruts += 1
        i += len(t)
    if bruts == 0:
        return prefixe
    comprime = 1 + math.ceil(bits / 8)
    brut = bruts - (1 if terminateur_ajoute else 0)
    return prefixe + (comprime if comprime < brut else brut)


def cout_bloc(items, tab: Tables) -> int:
    """Octets d'un bloc entier, décrit comme une liste d'items :
    ('txt', chaîne) ou ('cut', nom_de_macro)."""
    total = 0
    tampon = []
    for genre, valeur in items:
        if genre == "txt":
            tampon.append(valeur)
            continue
        # coupure : le segment courant se termine, avec terminateur ajouté
        if tampon:
            total += cout_segment("".join(tampon) + "@", tab, True)
            tampon = []
        total += COUPURES.get(valeur, 1)
    if tampon:
        total += cout_segment("".join(tampon), tab, False)
    return total


TERMINATEURS = ("@", "<DONE>", "<PROMPT>")


def octets_du_bloc(s: str, tab: Tables) -> int:
    """Taille en octets d'UN bloc de texte, terminateur compris."""
    prefixe = 0          # octets bruts émis avant l'enclenchement
    bruts = 0            # caractères accumulés pendant la compression
    bits = 0             # longueur du flux comprimé
    mode = "pre"         # pre -> comp -> (abandon)
    i = 0
    n = len(s)
    while i < n:
        jetons = tab.jetons_defaut if mode == "pre" else tab.jetons_compr
        t = _jeton_a(s, i, jetons)

        if mode == "pre":
            c = tab.code(t)
            if c is not None and len(c) < 8:
                mode = "comp"
                continue          # rejouer le jeton, charmap sans n-grammes
            prefixe += 1
            i += len(t)
            continue

        # mode comprimé
        c = tab.code(t)
        if c is None:
            # Abandon : tout ce qui a été accumulé repart en octets bruts,
            # puis le reste du bloc s'écrit brut avec les n-grammes.
            mode = "pre"
            prefixe += bruts
            bruts = 0
            bits = 0
            continue
        bits += len(c)
        bruts += 1
        i += len(t)

    if bruts == 0:
        return prefixe
    comprime = 1 + math.ceil(bits / 8)     # 1 pour l'octet <CTXT>
    return prefixe + min(comprime, bruts)


def blocs_du_fichier(chemin: Path):
    """Rend (label, items). Un item est ('txt', chaîne) ou ('cut', macro).

    ⚠️ Doit connaître TOUTES les macros de texte, pas seulement `text` et
    `line` : voir COUPURES. Un motif partiel sous-estime silencieusement.

    ⚠️ Le motif de chaîne s'arrête au premier guillemet fermant NON échappé.
    Un `"(.*)"` glouton avale les commentaires de fin de ligne : dans
    `data/credits_strings.asm`, il rapatriait le texte japonais d'origine
    dans la chaîne mesurée.
    """
    label, items = None, []
    rx_lab = re.compile(r"^(\w+)::?\s*$")
    rx_txt = re.compile(r'\s*(text|line|cont|para|next|next1)\s+"((?:[^"\\\\]|\\\\.)*)"')
    rx_page = re.compile(r'\s*page\s+"((?:[^"\\\\]|\\\\.)*)"')
    rx_fin = re.compile(r"\s*(done|prompt)\s*$")
    rx_cut = re.compile(r"\s*(" + "|".join(COUPURES) + r")\b")
    for ligne in Path(chemin).read_text(encoding="utf-8", errors="replace").splitlines():
        m = rx_lab.match(ligne)
        if m:
            if label and items:
                yield label, items
            label, items = m.group(1), []
            continue
        m = rx_txt.match(ligne)
        if m:
            items.append(("txt", PREFIXES[m.group(1)] + m.group(2)))
            continue
        m = rx_page.match(ligne)
        if m:
            items.append(("txt", "@"))
            items.append(("txt", m.group(1)))
            continue
        m = rx_fin.match(ligne)
        if m:
            items.append(("txt", "<DONE>" if m.group(1) == "done" else "<PROMPT>"))
            continue
        m = rx_cut.match(ligne)
        if m:
            items.append(("cut", m.group(1)))
    if label and items:
        yield label, items
