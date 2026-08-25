#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Conversion de casse : du français officiel (CAPITALES) vers la casse mixte
de Polished Crystal — décision D3.

LE PROBLÈME
-----------
Le Cristal français écrit les noms propres en capitales : `ECORCIA`,
`TEAM ROCKET`, `ARENE`. Polished Crystal a modernisé : `Lucky Number Show!`,
`Prof.Elm`, `#mon`. On doit suivre.

⚠️ **Et la casse mixte RESTITUE les accents** que les capitales avaient perdus
(`CONVENTIONS.md` §2) : `ECORCIA` → `Écorcia`, `ARENE` → `Arène`.

LA MÉTHODE — trois sources, par ordre d'autorité
------------------------------------------------
1. **Le corpus lui-même.** Si le mot existe en minuscules ailleurs dans le
   Cristal français, sa forme accentuée est là, écrite par les traducteurs :
   `ARENE` → on trouve `arène`. 394 formes résolues ainsi, plus 37 tranchées
   par fréquence quand plusieurs formes existent (`DE` → `de`, pas `dé`).

2. **Le glossaire officiel** (`donnees/glossaire_officiel.tsv`) pour les noms
   de Pokémon, objets, capacités et lieux.

3. **La table vérifiée** ci-dessous, pour les noms propres qu'aucune des deux
   premières ne couvre. ⚠️ **Vérifiés sur Poképédia par l'utilisateur, jamais
   écrits de mémoire** (`PIEGES.md` #12).

Ce que la conversion NE fait PAS toute seule est **signalé**, pas deviné.
"""

import csv
import re
import sys
import unicodedata
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from chemins import FR, DONNEES                      # noqa: E402
from lecteur import lire_depot                       # noqa: E402

# --- Noms propres vérifiés par l'utilisateur ------------------------------
VERIFIES = {
    "ECORCIA": "Écorcia",
    "EBENELLE": "Ébènelle",       # accent GRAVE, pas aigu
    "ECUME": "Écume",
    "ECOLIER": "Écolier",
    "ECREMEUH": "Écrémeuh",
    "AEROMITE": "Aéromite",
    "ARGENTEE": "Argentée",
    "CENDREE": "Cendrée",
    "ILES": "Îles",
    "ILE": "Île",
}

# --- Mots que Polished Crystal met en MINUSCULES, pas en Capitale ---------
# Dérivé de son propre traitement de l'anglais : #MON -> #mon, #DEX -> #dex.
MINUSCULES = {"#MON", "#DEX", "#GEAR", "#COM", "#MUSIC"}

# --- Sigles : restent en CAPITALES ---------------------------------------
# Ni des mots ni des noms propres. `capitalize()` en ferait « Ok », « Pv ».
ACRONYMES = {"OK", "PV", "PC", "PP", "PKMN", "CT", "CS", "DJ", "SARL",
             "TV", "ADN", "QG", "SS", "MT", "MS", "ID", "NO", "AZ"}

# --- Titres : toujours en Capitale, comme PC le fait (« Prof.Elm ») -------
TITRES = {"PROF", "DR", "MLLE", "MME", "MR", "PR"}

# --- Noms propres composés dont le second mot reste en Capitale ----------
# « BADGE AME » est le nom d'un badge, pas une amulette quelconque.
TETES_DE_NOM = {"BADGE", "TOUR", "MONT", "LAC", "ROUTE", "GROTTE", "ANTRE",
                "PARC", "ILE", "ILES", "BOIS", "PHARE", "CAVE", "CAVERNE"}

# --- Mots de liaison : minuscules même à l'intérieur d'un nom propre ------
# « TOUR DE COMBAT » -> « Tour de Combat », pas « Tour De Combat ».
LIAISONS = {"DE", "DU", "DES", "LA", "LE", "LES", "L'", "D'", "UN", "UNE",
            "ET", "À", "A", "AU", "AUX", "EN", "SUR", "SOUS", "PAR", "POUR"}

# --- Jetons à ne jamais toucher ------------------------------------------
RX_JETON = re.compile(r"<[^>]*>|\{[^}]*\}")

# --- Portage vanilla -> Polished Crystal ---------------------------------
# Le Cristal français emploie des jetons que PC ne connaît pas. Les laisser
# passer ferait échouer l'assemblage — ou pire, produirait un octet faux.
PORTAGE = [
    ("<PLAY_G>", "<PLAYER>"),   # renommé par PC (217 occurrences)
    ("<……>", "……"),            # vanilla : UNE tuile valant « …… » ; PC en met deux
    # `ï` a été abandonné faute de case de charmap (décision P13). Ses 5
    # occurrences sont toutes l'interjection « Aïe! », dont le français a un
    # équivalent exact sans tréma. Voir REFORMULATIONS.md §4.
    # « CAID » traduit l'anglais « EXECUTIVE », un rang de la Team Rocket.
    # En capitales l'officiel l'écrit sans tréma ; en casse mixte il faudrait
    # « Caïd », et `ï` n'a pas de case. « Cadre » dit le même rang.
    # ⚠️ À CONFIRMER par l'utilisateur sur Poképédia (PIEGES.md #12).
    ("CAID", "CADRE"),
    ("Caïd", "Cadre"),
    ("caïd", "cadre"),
    ("Aïeuuuuuuu", "Ouilleuuuuu"),
    ("Aïeuuu", "Ouilleuu"),
    ("Aïe", "Ouille"),
    ("aïe", "ouille"),
]


def sans_accents(s):
    return "".join(c for c in unicodedata.normalize("NFD", s)
                   if not unicodedata.combining(c))


class Convertisseur:
    def __init__(self):
        self.table = {}          # CAPITALES -> forme en casse mixte
        self.inconnus = Counter()
        self._depuis_corpus()
        self._depuis_glossaire()
        self.table.update(VERIFIES)
        self._depuis_verifications()

    def _depuis_corpus(self):
        """Source 1 : les formes minuscules écrites par les traducteurs."""
        fr = lire_depot(FR)
        minus = Counter()
        for b in fr.values():
            if not b.a_du_texte:
                continue
            t = RX_JETON.sub("", b.texte_normalise())
            for m in re.findall(r"\b[a-zàâçèêîôùûéï']{2,}\b", t):
                minus[m] += 1
        index = {}
        for m, n in minus.items():
            index.setdefault(sans_accents(m), Counter())[m] = n
        for forme, cands in index.items():
            # ⚠️ Plusieurs formes possibles (DE -> « de » ou « dé ») : on
            # retient la PLUS FRÉQUENTE. « de » l'emporte 1936 à 16.
            self.table[forme.upper()] = cands.most_common(1)[0][0]

    def _depuis_glossaire(self):
        """Source 2 : les noms officiels de Pokémon, objets, lieux…"""
        chemin = DONNEES / "glossaire_officiel.tsv"
        if not chemin.is_file():
            return
        for r in csv.DictReader(chemin.open(encoding="utf-8"), delimiter="\t"):
            f = r["francais"]
            if f.isupper() and len(f) > 2:
                self.table.setdefault(f, f.capitalize())

    def _depuis_verifications(self):
        """Source 0 — les formes VÉRIFIÉES par l'utilisateur.

        ⚠️ **Autorité maximale.** Elles écrasent tout le reste : ni le corpus
        ni le glossaire ne peuvent fournir l'accent d'un nom propre qui
        n'apparaît jamais en minuscules (`ARENE` -> `Arène`, `LEO` -> `Léo`,
        `JEROME` -> `Jérôme`). Elles ont été relevées sur Poképédia, jamais
        écrites de mémoire (`PIEGES.md` #12).
        """
        chemin = DONNEES / "casse_verifie.tsv"
        if not chemin.is_file():
            return
        n = 0
        for r in csv.DictReader(chemin.open(encoding="utf-8"), delimiter="\t"):
            forme = (r.get("proposition") or "").strip()
            if forme:
                self.table[r["capitales"]] = forme
                n += 1
        self.verifiees = n

    def mot(self, M):
        """Convertit UN mot en capitales.

        ⚠️ Deux questions DISTINCTES, que la première version confondait :

        · l'ORTHOGRAPHE — le corpus dit que `ARENE` s'écrit `arène` ;
        · la CASSE — Polished Crystal met 78 % des mots en Capitale initiale
          et 21 % en minuscules (essentiellement `#mon`, `#dex`).

        On prend l'orthographe au corpus, puis on décide la casse à part.
        """
        if M in MINUSCULES:
            return M.lower()
        if M in ACRONYMES:
            return M
        if M in TITRES:
            return M.capitalize()
        if M in LIAISONS:
            return self.table.get(M, M.lower()).lower()
        forme = self.table.get(M)
        if forme is not None and forme[:1].isupper():
            # forme vérifiée par l'utilisateur : casse déjà décidée
            return forme
        if forme is not None:
            # ⚠️ Le mot existe EN MINUSCULES dans le Cristal français : c'est
            # donc un mot COURANT, pas un nom propre. La VF le mettait en
            # capitales par convention d'époque ; en casse mixte il redevient
            # minuscule. « la partie sera SAUVEE » -> « sera sauvée », pas
            # « sera Sauvée ».
            return forme
        forme = self._par_morphologie(M)
        if forme is not None:
            return forme
        # Absent du corpus en minuscules : nom propre selon toute
        # vraisemblance (JOHTO, DOUBLONVILLE, CHEN). Capitale initiale.
        self.inconnus[M] += 1
        return M.capitalize()

    def titre(self, M):
        """Restitue l'accent d'un mot déjà en Capitale initiale.

        ⚠️ Le français officiel écrit `Ca va?`, `Etre poli`, `Ile` — sans
        accent, parce que **les capitales ne s'accentuent pas** en Gen 2.
        En casse mixte cette règle tombe : `Ça`, `Être`, `Île`.

        On ne touche qu'aux mots dont le corpus connaît une forme accentuée
        DIFFÉRENTE. `Peter` ou `Chen`, absents du corpus, restent intacts.
        """
        forme = self.table.get(M.upper())
        if not forme or sans_accents(forme) == forme:
            return M
        if sans_accents(forme).lower() != M.lower():
            return M
        return forme[0].upper() + forme[1:]

    # Terminaisons françaises courantes : (suffixe du mot cherché, suffixe de
    # la racine à tester). « SAUVEE » -> racine « SAUVE » -> le corpus donne
    # « sauvé » -> on rend « sauvée ».
    FLEXIONS = [("EES", "E", "ées"), ("EE", "E", "ée"), ("ES", "E", "es"),
                ("S", "", "s")]

    def _par_morphologie(self, M):
        """Retrouve l'accent d'une forme fléchie via sa racine.

        ⚠️ Beaucoup de mots n'apparaissent en minuscules dans le corpus que
        sous UNE forme : « sauvé » existe, « sauvée » non. Sans ce repli,
        « SAUVEE » ressortait « Sauvee », sans accent.
        """
        for fin, fin_racine, remplacement in self.FLEXIONS:
            if not M.endswith(fin):
                continue
            racine = M[:len(M) - len(fin)] + fin_racine
            forme = self.table.get(racine)
            if forme and sans_accents(forme) != forme:
                # la racine porte un accent : on la refléchit
                base = forme[:len(forme) - len(fin_racine)] if fin_racine else forme
                return base + remplacement
        return None

    def texte(self, s):
        """Convertit une chaîne entière, en préservant les jetons.

        ⚠️ **Aucune recapitalisation après un saut de ligne.** Un `line` ou un
        `cont` est un retour à la ligne, PAS une nouvelle phrase : la première
        version rendait « ont un truc / secret » en « Ont un truc / Secret ».
        Le texte officiel porte déjà sa casse de phrase ; on n'y touche pas.
        """
        for vieux, neuf in PORTAGE:
            s = s.replace(vieux, neuf)
        morceaux = []
        for part in re.split(r"(<[^>]*>|\{[^}]*\})", s):
            if part.startswith(("<", "{")):
                morceaux.append(part)
                continue
            # ⚠️ L'apostrophe SÉPARE deux mots : « L'ARENE » est « L' » puis
            # « ARENE ». La première version la prenait pour une lettre et
            # rendait « L'arene » — sans accent et sans capitale.
            # Le point aussi : « PROF.ORME » est « PROF. » puis « ORME ».
            # ⚠️ Un nom propre composé se traite d'un bloc : « BADGE AME »
            # devient « Badge Âme », pas « Badge âme ». Sans ce passage, la
            # règle « mot connu en minuscules => minuscule » décapitalisait
            # le second terme.
            def _groupe(m):
                """« TOUR DE COMBAT » -> « Tour de Combat ».

                La TÊTE prend une capitale même si le corpus la connaît en
                minuscules (« tour ») : elle ouvre un nom propre. Les mots de
                LIAISON restent minuscules. Le reste prend une capitale.
                """
                out = []
                for i, w in enumerate(m.group(0).split()):
                    v = self.mot(w)
                    if w in LIAISONS and i:
                        out.append(v.lower())
                    else:
                        out.append(v[0].upper() + v[1:])
                return " ".join(out)
            part = re.sub(
                r"\b(?:" + "|".join(sorted(TETES_DE_NOM, key=len, reverse=True)) +
                r")(?: [A-ZÀÂÇÈÊÎÔÙÛÉ]{2,})+\b", _groupe, part)
            part = re.sub(
                r"#[A-Z]+|[A-ZÀÂÇÈÊÎÔÙÛÉ]{2,}'?|[A-ZÀÂÇÈÊÎÔÙÛÉ]'",
                lambda m: self.mot(m.group(0)), part)
            part = re.sub(r"\b[A-Z][a-zàâçèêîôùûéï]+\b",
                          lambda m: self.titre(m.group(0)), part)
            morceaux.append(part)
        out = "".join(morceaux)
        # espaces de fin : invisibles, mais ils comptent une tuile et font
        # déborder « Salut c'est Buena! » à 19.
        return re.sub(r"[ \t]+$", "", out)
