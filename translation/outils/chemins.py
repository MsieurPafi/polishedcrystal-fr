#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Résolution des chemins de l'atelier Polished Crystal FR.

RÈGLE : aucun chemin absolu n'est écrit dans ce fichier ni ailleurs.
Tout se déduit de la position de CE fichier, en remontant jusqu'à trouver
l'atelier — c'est-à-dire le dossier qui contient les trois dépôts côte à côte.

    <atelier>/
      ├── polishedcrystal/    ← le hack, versionné, contient translation/
      ├── pokecrystal/        ← référence anglaise, JAMAIS versionnée par nous
      └── pokecrystal-fr/     ← référence française, JAMAIS versionnée par nous

Ce module ÉCHOUE BRUYAMMENT si l'atelier est introuvable. Il ne rend jamais
un chemin faux ni une liste vide : sur le chantier jumeau, un outil qui
déduisait mal sa racine annonçait sereinement « 0 résultat » au lieu de
signaler l'erreur, et l'erreur a vécu des semaines.

Usage :
    from chemins import EN, FR, HACK, ATELIER, asm_de, verifier
"""

from pathlib import Path
import sys

# Les trois dépôts, par leur nom de dossier attendu.
DEPOT_HACK = "polishedcrystal"
DEPOT_EN = "pokecrystal"
DEPOT_FR = "pokecrystal-fr"

# Un fichier témoin par dépôt : sa présence prouve qu'on a bien le bon dépôt
# et pas un dossier qui porte le même nom par hasard.
TEMOINS = {
    DEPOT_HACK: "constants/charmap.asm",
    DEPOT_EN: "constants/charmap.asm",
    DEPOT_FR: "constants/charmap.asm",
}

_AIDE = f"""
L'atelier est introuvable.

Attendu — les trois dépôts DANS UN MÊME dossier parent :

    <atelier>/
      ├── {DEPOT_HACK}/
      ├── {DEPOT_EN}/
      └── {DEPOT_FR}/

Les deux décompilations de référence ne sont volontairement PAS versionnées :
elles contiennent du texte officiel Nintendo et vivent à CÔTÉ du dépôt, jamais
dedans, pour qu'aucun « git add . » ne puisse se tromper.

Si elles manquent, les cloner dans le dossier parent de {DEPOT_HACK}/ :

    git clone https://github.com/pret/pokecrystal.git
    git clone <dépôt du Cristal français> {DEPOT_FR}

Recherche effectuée en remontant depuis :
"""


class AtelierIntrouvable(RuntimeError):
    """Levée quand la racine de l'atelier ne peut pas être déterminée."""


def _est_atelier(dossier: Path) -> bool:
    """Vrai si `dossier` contient les trois dépôts, témoins compris."""
    for depot, temoin in TEMOINS.items():
        if not (dossier / depot / temoin).is_file():
            return False
    return True


def _trouver_atelier() -> Path:
    """Remonte depuis ce fichier jusqu'à l'atelier. Échoue bruyamment sinon."""
    depart = Path(__file__).resolve()
    essais = []
    for dossier in depart.parents:
        essais.append(str(dossier))
        if _est_atelier(dossier):
            return dossier
    raise AtelierIntrouvable(
        _AIDE + "\n".join("    " + e for e in essais) + "\n"
    )


ATELIER: Path = _trouver_atelier()

HACK: Path = ATELIER / DEPOT_HACK
EN: Path = ATELIER / DEPOT_EN
FR: Path = ATELIER / DEPOT_FR

TRAVAIL: Path = HACK / "translation"
OUTILS: Path = TRAVAIL / "outils"
DONNEES: Path = TRAVAIL / "donnees"


def asm_de(depot: Path):
    """Tous les .asm VERSIONNÉS d'un dépôt, triés.

    ⚠️ Passe par « git ls-files », pas par rglob. Compiler un dépôt y GÉNÈRE
    des .asm (les bitmask.asm des animations Pokémon, entre autres) qui sont
    gitignorés mais bien présents sur le disque. Un rglob naïf les compte :
    le premier jour, il a fait passer pokecrystal-fr de 2 463 à 3 017 fichiers
    juste parce que le dépôt venait d'être compilé — et le contrôle de santé
    a accusé les dépôts alors que le fautif était l'outil.

    Repli sur rglob si git est indisponible, en signalant que le compte peut
    inclure des fichiers générés.
    """
    import subprocess
    try:
        sortie = subprocess.run(
            ["git", "-C", str(depot), "ls-files", "*.asm"],
            capture_output=True, text=True, check=True,
        ).stdout
        return sorted(depot / ligne for ligne in sortie.splitlines() if ligne)
    except (subprocess.CalledProcessError, FileNotFoundError):
        print(
            f"  ⚠️  git indisponible sur {depot.name} : repli sur un balayage "
            f"disque, qui peut inclure des .asm générés par la compilation.",
            file=sys.stderr,
        )
        return sorted(p for p in depot.rglob("*.asm") if ".git" not in p.parts)


def relatif(chemin: Path) -> str:
    """Chemin affichable, relatif à l'atelier. Aucun chemin absolu ne doit
    apparaître dans une sortie d'outil : ça la rend incomparable d'une
    machine à l'autre."""
    try:
        return str(Path(chemin).resolve().relative_to(ATELIER))
    except ValueError:
        return str(chemin)


def verifier(bruyant: bool = True) -> bool:
    """Contrôle de santé de l'atelier.

    Vérifie aussi que EN et FR ont le MÊME nombre de .asm : c'est
    l'hypothèse sur laquelle repose tout l'appariement par label. Si elle
    tombe, mieux vaut le savoir ici que trois outils plus loin.
    """
    ok = True
    n_en, n_fr, n_hack = (len(asm_de(d)) for d in (EN, FR, HACK))
    lignes = [
        f"atelier   {ATELIER}",
        f"{DEPOT_HACK:16s} {n_hack:5d} .asm",
        f"{DEPOT_EN:16s} {n_en:5d} .asm",
        f"{DEPOT_FR:16s} {n_fr:5d} .asm",
    ]
    if n_en != n_fr:
        ok = False
        lignes.append(
            f"\n  ⚠️  {DEPOT_EN} et {DEPOT_FR} n'ont pas le même nombre de .asm "
            f"({n_en} ≠ {n_fr}).\n"
            f"      L'appariement par label suppose une arborescence identique.\n"
            f"      Vérifier que les deux dépôts sont sur des révisions comparables."
        )
    if bruyant:
        print("\n".join(lignes))
    return ok


if __name__ == "__main__":
    sys.exit(0 if verifier() else 1)
