#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Lecteur de texte `.asm` — rend `label -> texte`, pour les trois dépôts.

CE QU'IL GARANTIT
-----------------
1. **Il connaît toutes les macros de texte des trois dépôts.** Vanilla et
   Polished Crystal n'ont pas le même jeu : vanilla a `text_bcd`, `text_scroll`,
   `text_dots`, `sound_*` ; PC a `text_sound`, `text_farend`, `text_plural`,
   `next1`.

2. **Il ÉCHOUE bruyamment sur une macro inconnue** rencontrée dans un bloc de
   texte, au lieu de l'ignorer. C'est la parade au piège le plus fréquent du
   chantier (`PIEGES.md` #2) : un motif d'analyse partiel qui rend un « 0 »
   parfaitement calme et parfaitement faux. Mieux vaut un outil qui refuse de
   tourner qu'un outil qui sous-compte en silence.

3. **Il suit les blocs multi-lignes** et le terminateur `@`.

4. **Il distingue le texte des pointeurs.** `FooText: text_far _FooText` n'est
   pas du texte : c'est un renvoi vers `_FooText`, qui lui en contient.

NORMALISATION
-------------
`texte_normalise()` rend une chaîne comparable d'un dépôt à l'autre :
sauts de ligne unifiés, terminateur retiré, commandes réduites à un jeton
stable. Sans quoi le critère exact échoue sur des écarts de pure notation
(`PIEGES.md` #10).
"""

import re
import sys
from pathlib import Path

# --- macros qui portent du texte affiché ---------------------------------
# valeur = le marqueur inséré AVANT le contenu
TEXTE = {
    "text": "",
    "line": "\n",
    "cont": "\n",
    "next": "\n",
    "next1": "\n",
    "para": "\n\n",
    "page": "\n\n",
}

# --- macros de commande, sans texte propre -------------------------------
# valeur = le jeton stable qui les représente dans la chaîne normalisée
COMMANDES = {
    # communes
    "text_start": "", "text_end": "", "done": "", "prompt": "",
    "text_ram": "{RAM}", "text_decimal": "{NUM}", "text_asm": "{ASM}",
    "text_pause": "{PAUSE}", "text_today": "{JOUR}",
    "text_promptbutton": "{ATTENTE}",
    # vanilla seulement
    "text_bcd": "{BCD}", "text_move": "{CAPACITE}", "text_box": "{BOITE}",
    "text_low": "{BAS}", "text_scroll": "{DEFIL}", "text_dots": "{POINTS}",
    "text_waitbutton": "{ATTENTE}", "text_buffer": "{TAMPON}",
    "sound_dex_fanfare_20_49": "{SON}", "sound_dex_fanfare_50_79": "{SON}",
    "sound_dex_fanfare_80_109": "{SON}", "sound_item": "{SON}",
    "sound_caught_mon": "{SON}", "sound_fanfare": "{SON}",
    "sound_slot_machine_start": "{SON}",
    # Polished Crystal seulement
    "text_sound": "{SON}", "text_plural": "{PLURIEL}",
    # Interrompt la compression sans rien afficher. Sert à laisser un label
    # « tomber » dans le suivant : WildPokemonAppearedText = "A wild " puis
    # chute dans LegendaryAppearedText. Trouvée par le mode strict.
    "stop_compressing_text": "",
}

# renvois : le texte est ailleurs
# Directives d'assembleur qui peuvent apparaître DANS un bloc de texte sans
# rien émettre. `assert EVE_HOUR == 12 + 5` sépare deux paragraphes dans
# RadioTower2F.asm : la macro n'affiche rien, mais l'ignorer sans la
# répertorier reviendrait à désarmer le mode strict.
DIRECTIVES = {
    "assert", "static_assert", "fail", "warn", "println", "print",
    "def", "redef", "purge", "export", "shift", "break",
    "if", "elif", "else", "endc", "rept", "endr", "for",
    # bascules de charmap : `setcharmap no_ngrams` entoure le texte des
    # lettres dans EcruteakPokeCenter1F.asm. N'émet rien.
    "setcharmap", "newcharmap", "pushc", "popc", "pusho", "popo",
    "pushs", "pops", "opt", "align", "ds", "incbin", "include",
    "union", "nextu", "endu", "load", "endl", "macro", "endm",
}

# Directives de DONNÉES. Elles ne ferment pas un bloc, et quand elles portent
# une chaîne littérale, cette chaîne EST du texte affiché.
#
# ⚠️ Chaque entrée du Pokédex commence par `db "Seed@"` (la catégorie de
# l'espèce) avant ses `text`/`next`/`page`. Une première version du lecteur
# traitait `db` en macro inconnue, fermait le bloc, et perdait donc les
# 1 667 lignes du Pokédex — SANS RIEN DIRE. C'est pour ça que
# `controle_couverture()` existe.
DONNEES = {"db", "dw", "dn", "dr", "dba", "dab", "bigdw", "dbw", "dwb",
           "rawchar", "li", "dname", "plural", "landmark"}

RENVOIS = {"text_far", "text_farend"}

# `macros/` contient les DÉFINITIONS des macros (`_dtxt "<LINE>", \#`), pas
# du texte de jeu. Les lire ferait déclencher le mode strict sur les rouages
# internes de l'assembleur.
EXCLUS_TOUJOURS = ("macros/",)

# ferment un bloc de texte : ce qui suit n'en fait plus partie
TERMINATEURS = {"done", "prompt", "text_end"}

# ⚠️ Doit accepter les labels LOCAUX (`.BlancheIntro2Text:`). C'est là que vit
# l'essentiel du texte des cartes de Polished Crystal : sans eux, le lecteur
# perdait 10 918 lignes — soit 28 % du texte du hack — sans rien signaler.
# Un label local est qualifié par son label global parent : `Parent.Enfant`.
RX_LABEL = re.compile(r"^(\.?[A-Za-z_][A-Za-z0-9_]*)::?\s*(?:;.*)?$")
# ⚠️ `\s*` et NON `\s+` : dans PC, les directives conditionnelles sont écrites
# en COLONNE 0 (`if DEF(FAITHFUL)` dans data/text/common.asm). Un motif
# exigeant une indentation les rendait invisibles, et le lecteur concaténait
# silencieusement les deux branches d'un `if`/`else`. Le cahier cite ce piège
# — « un motif exigeant exactement un espace avant = » — et il a frappé ici.
RX_MACRO = re.compile(r"^\s*([a-z_][a-z_0-9]*)\b\s*(.*?)\s*(?:;.*)?$")
RX_CHAINE = re.compile(r'"((?:[^"\\]|\\.)*)"')


class MacroInconnue(RuntimeError):
    """Une macro non répertoriée est apparue dans un bloc de texte."""


class Bloc:
    # `label` n'est pas figé : un bloc peut porter plusieurs noms (alias).
    __slots__ = ("label", "fichier", "ligne", "elements", "conditionnel")

    def __init__(self, label, fichier, ligne):
        self.label = label
        self.fichier = fichier
        self.ligne = ligne
        self.elements = []          # ("t", str) | ("c", jeton) | ("renvoi", cible)
        # ⚠️ Un bloc dont le texte dépend d'un `if` d'assemblage (versions
        # faithful / hgss / monochrome de PC). Le lecteur concatène alors les
        # DEUX branches : sa chaîne n'est comparable à rien. Les outils en
        # aval doivent l'ÉCARTER, pas la comparer. Marquer plutôt que
        # mal comparer en silence.
        self.conditionnel = False

    @property
    def est_renvoi(self):
        return (not any(g in ("t", "d") for g, _ in self.elements)
                and any(g == "renvoi" for g, _ in self.elements))

    @property
    def a_du_texte(self):
        return any(g in ("t", "d") for g, _ in self.elements)

    def texte_brut(self):
        return "".join(v for g, v in self.elements if g in ("t", "d"))

    def texte_normalise(self):
        """Chaîne comparable d'un dépôt à l'autre."""
        out = []
        for genre, valeur in self.elements:
            if genre in ("t", "d"):
                out.append(valeur)
            elif genre == "c" and valeur:
                out.append(valeur)
        s = "".join(out)
        s = s.replace("@", "")                    # terminateur, non affiché
        s = re.sub(r"[ \t]+", " ", s)             # espaces multiples
        s = re.sub(r"\n{3,}", "\n\n", s)
        return s.strip()

    def __repr__(self):
        return f"<Bloc {self.label} {self.fichier}:{self.ligne}>"


def lire_fichier(chemin, strict=True):
    """Rend {label: Bloc} pour un `.asm`.

    strict=True : lève MacroInconnue sur une macro non répertoriée rencontrée
    à l'intérieur d'un bloc de texte. Ne jamais désactiver pour « faire
    passer » un fichier — répertorier la macro à la place.
    """
    chemin = Path(chemin)
    blocs = {}
    courant = None
    ouvert = False      # un bloc de texte est-il commencé et non terminé ?
    global_courant = ""  # pour qualifier les labels locaux
    implicites = 0       # compteur de blocs sans label
    contenu = False      # quelque chose (même non textuel) depuis le label ?
    for n, ligne in enumerate(
        chemin.read_text(encoding="utf-8", errors="replace").splitlines(), 1
    ):
        if not ligne.strip() or ligne.lstrip().startswith(";"):
            continue

        m = RX_LABEL.match(ligne)
        if m:
            brut = m.group(1)
            if brut.startswith("."):
                nom_complet = global_courant + brut
            else:
                global_courant = brut
                nom_complet = brut
            # Labels ALIAS : plusieurs noms d'affilée, sans rien entre eux,
            # désignent le MÊME texte. Vu dans data/moves/descriptions.asm :
            #   StoneEdgeDescription:
            #   if !DEF(FAITHFUL)
            #   XScissorDescription:
            #   endc
            #       text "Has a high criti-"
            # Sans ce cas, le premier label repartait vide et son texte était
            # attribué au seul second.
            # ⚠️ « vide » signifie : RIEN entre les deux labels, pas même une
            # commande de script. Sans le drapeau `contenu`, un label comme
            #   Route11FruitTree:
            #       fruittree FRUITTREE_ROUTE_11
            # paraissait vide (le lecteur n'enregistre pas les commandes de
            # script) et se faisait fusionner avec le label suivant : le texte
            # de la Route 11 se retrouvait sous 12 labels sans rapport.
            if courant is not None and not courant.elements and not contenu:
                blocs[nom_complet] = courant
                courant.label = nom_complet
                ouvert = False
                continue
            courant = Bloc(nom_complet, str(chemin), n)
            blocs[nom_complet] = courant
            ouvert = False
            contenu = False
            continue

        m = RX_MACRO.match(ligne)
        if not m:
            continue
        nom, reste = m.group(1), m.group(2)

        if nom in TEXTE:
            # ⚠️ Un `text` peut survenir SANS label courant, de deux façons :
            #   · texte EN LIGNE dans un script — `writethistext` suivi du
            #     texte, très répandu dans les cartes de Polished Crystal ;
            #   · fichier inclus SANS label — chaque entrée du Pokédex vanilla
            #     (`data/pokemon/dex_entries/abra.asm`) est dans ce cas.
            # Les jeter perdait 5 771 lignes dans PC et 1 263 dans le vanilla.
            # On ouvre donc un bloc IMPLICITE, nommé d'après son contexte.
            # ⚠️ On teste le texte venu de MACROS (genre « t »), pas celui
            # d'un `db` (genre « d »). Sinon la catégorie du Pokédex, écrite
            # en `db` juste avant la description, provoquait une découpe en
            # deux blocs et la description repartait amputée de sa première
            # ligne.
            deja = any(g == "t" for g, _ in courant.elements) if courant else False
            if courant is None or (deja and not ouvert):
                implicites += 1
                base = global_courant or Path(chemin).stem
                nom_implicite = f"{base}#{implicites}"
                courant = Bloc(nom_implicite, str(chemin), n)
                blocs[nom_implicite] = courant
            chaines = RX_CHAINE.findall(reste)
            contenu = "".join(chaines) if chaines else ""
            courant.elements.append(("t", TEXTE[nom] + contenu))
            ouvert = True
            continue

        if nom in COMMANDES:
            if courant is not None:
                courant.elements.append(("c", COMMANDES[nom]))
            if nom in TERMINATEURS:
                ouvert = False
            continue

        if nom in DONNEES:
            chaines = RX_CHAINE.findall(reste)
            if chaines and courant is None:
                # ⚠️ Une entrée du Pokédex vanilla COMMENCE par deux `db` :
                #   db "FIRE MOUSE@"      ; la catégorie de l'espèce
                #   db "The fire that"    ; la première ligne de description
                # avant le moindre `next`. Sans ce cas, ces deux lignes
                # tombaient dans le vide, la description vanilla amputée ne
                # correspondait plus à celle de PC, et les 251 entrées du
                # Pokédex passaient pour du contenu propre au hack.
                implicites += 1
                base = global_courant or Path(chemin).stem
                nom_implicite = f"{base}#{implicites}"
                courant = Bloc(nom_implicite, str(chemin), n)
                blocs[nom_implicite] = courant
            if courant is not None:
                if chaines:
                    # genre « d » : du texte, mais issu d'une directive de
                    # données. Compte pour le contenu, pas pour le contrôle
                    # de couverture qui, lui, dénombre les LIGNES de macro.
                    courant.elements.append(("d", "".join(chaines)))
                    # ⚠️ On N'OUVRE PAS le bloc : `db "..."` apporte du texte
                    # mais n'entre pas en mode texte. Sinon n'importe quelle
                    # table d'octets ouvrirait un bloc, et la première
                    # instruction venue (`popc` dans mobile/) déclencherait
                    # le mode strict à tort.
            continue

        if nom not in DIRECTIVES:
            contenu = True      # une vraie macro : le label n'est plus vide

        if nom in DIRECTIVES:
            if nom in ("if", "elif", "else") and courant is not None and ouvert:
                courant.conditionnel = True
            continue        # n'émet rien, ne clôt pas le bloc

        if nom in RENVOIS:
            if courant is not None:
                cible = reste.split(",")[0].strip()
                courant.elements.append(("renvoi", cible))
            continue

        # Une macro non répertoriée DANS un bloc de texte ENCORE OUVERT :
        # c'est le seul cas dangereux. Une fois le bloc terminé par `done`,
        # `prompt` ou `text_end`, ce qui suit est du code de script — les
        # fichiers de cartes entremêlent texte et scripts, et `checkflag` ou
        # `iftrue_jumptextfaceplayer` y suivent légitimement un texte clos.
        if strict and ouvert and courant is not None:
            raise MacroInconnue(
                f"{chemin}:{n} — macro « {nom} » inconnue dans le bloc "
                f"« {courant.label} ».\n"
                f"    Répertorie-la dans TEXTE, COMMANDES ou RENVOIS de "
                f"lecteur.py. Ne la laisse pas passer : un lecteur qui ignore "
                f"une macro sous-compte en silence."
            )
        # Une macro inconnue hors bloc de texte est du code de script : elle
        # ne clôt rien. Fermer le bloc ici faisait perdre le texte en ligne
        # qui suit `opentext` / `writethistext`.
        ouvert = False
    return blocs


def lire_depot(racine, strict=True):
    """Rend {label: Bloc} pour tous les `.asm` VERSIONNÉS d'un dépôt."""
    import subprocess
    racine = Path(racine)
    fichiers = subprocess.run(
        ["git", "-C", str(racine), "ls-files", "*.asm"],
        capture_output=True, text=True, check=True,
    ).stdout.split()
    fichiers = [f for f in fichiers if not f.startswith(EXCLUS_TOUJOURS)]
    if not fichiers:
        raise RuntimeError(
            f"aucun .asm versionné dans {racine} — ne pas croire un résultat vide"
        )
    tous = {}
    for rel in fichiers:
        for label, bloc in lire_fichier(racine / rel, strict).items():
            tous.setdefault(label, bloc)
    return tous


def controle_couverture(racine):
    """Vérifie que le lecteur voit TOUTES les lignes de texte du dépôt.

    Compte d'un côté les lignes brutes portant une macro de texte, de l'autre
    ce que le lecteur a effectivement retenu. Un écart signale du texte perdu
    en silence — le mode d'échec le plus dangereux du chantier.

    Rend (vues, attendues, manquantes_par_fichier).
    """
    import subprocess
    from collections import Counter
    racine = Path(racine)
    fichiers = subprocess.run(
        ["git", "-C", str(racine), "ls-files", "*.asm"],
        capture_output=True, text=True, check=True,
    ).stdout.split()
    fichiers = [f for f in fichiers if not f.startswith(EXCLUS_TOUJOURS)]
    rx_ligne = re.compile(
        r'^\s*(?:' + "|".join(sorted(TEXTE)) + r')\s+"')
    attendu = Counter()
    for rel in fichiers:
        for ligne in (racine / rel).read_text(encoding="utf-8",
                                              errors="replace").splitlines():
            if rx_ligne.match(ligne):
                attendu[rel] += 1
    vu = Counter()
    for rel in fichiers:
        # ⚠️ dédupliquer par IDENTITÉ : un bloc porté par plusieurs labels
        # alias apparaît sous plusieurs clés et serait compté autant de fois.
        vus_ids = set()
        for bloc in lire_fichier(racine / rel).values():
            if id(bloc) in vus_ids:
                continue
            vus_ids.add(id(bloc))
            vu[rel] += sum(1 for g, v in bloc.elements if g == "t")
    manquants = {f: attendu[f] - vu[f] for f in attendu if vu[f] < attendu[f]}
    return sum(vu.values()), sum(attendu.values()), manquants
