# Glossaire anglais → français

Deux moitiés, et il ne faut pas les confondre :

| | Où | Autorité |
|---|---|---|
| **Le glossaire officiel** | `donnees/glossaire_officiel.tsv` | **Extrait**, jamais écrit à la main. Fait foi. |
| **Les termes sans source** | ce fichier, §3 | Décidés avec l'utilisateur, un par un. |

---

## 1. Le glossaire officiel — 994 entrées

Extrait automatiquement des tables **indexées** du Cristal officiel, en
appariant `pokecrystal` et `pokecrystal-fr`.

```bash
python3 translation/outils/extraire_glossaire.py
```

| Catégorie | Entrées | Source |
|---|---|---|
| Pokémon | 256 | `data/pokemon/names.asm` |
| Objet | 256 | `data/items/names.asm` |
| Capacité | 251 | `data/moves/names.asm` |
| Lieu | 102 | `data/maps/landmarks.asm` |
| Classe de dresseur | 67 | `data/trainers/class_names.asm` |
| Décoration | 26 | `data/decorations/names.asm` |
| Type | 18 | `data/types/names.asm` |
| Statistique | 8 | `data/battle/stat_names.asm` |
| Contact Pokématos | 6 | `data/phone/non_trainer_names.asm` |
| Poche | 4 | `data/items/pocket_names.asm` |

**195 entrées sont identiques en français.** Ce sont des **confirmations** que
le terme ne se traduit pas, pas des lacunes ([`PIEGES.md`](PIEGES.md) #8).

### Comment il est apparié, et pourquoi c'est sûr

Ces tables sont **indexées par une constante** (`MOVE_*`, `ITEM_*`, le dex
national) : le rang **est** l'identifiant. C'est le seul endroit du chantier où
l'appariement par position est légitime — partout ailleurs, il se fait par label
(`DECISIONS.md` P6).

Garde-fous dans l'outil :

- table **refusée en bloc** si les deux côtés n'ont pas le même nombre d'entrées ;
- deux **témoins vérifiés** avant de rendre la main — `BULBASAUR → BULBIZARRE`
  et `POUND → ECRAS'FACE`. Si l'un tombe, l'outil sort en erreur plutôt que de
  livrer un glossaire décalé d'un rang.

### Consulter

```bash
grep -iP "\tSURF\t" translation/donnees/glossaire_officiel.tsv
awk -F'\t' '$1=="Lieu"' translation/donnees/glossaire_officiel.tsv
awk -F'\t' '$4=="identique"' translation/donnees/glossaire_officiel.tsv
```

---

## 2. Les jetons du charmap dans le glossaire

Certaines entrées contiennent des jetons, pas des lettres. **Les préserver tels
quels** — ils ne se traduisent pas et se comptent pour une tuile :

| Jeton | Ce que c'est |
|---|---|
| `#` | le préfixe `POKé` |
| `#mon` | `POKéMON` en un octet |
| `<PK>` `<MN>` | les tuiles `PK` et `MN` |
| `<BSP>` | un saut dans les noms de lieux |
| `<PLAYER>` `<RIVAL>` | insertions depuis la WRAM |
| `<LV>` `<ID>` `<PO>` `<KE>` | tuiles composées |

---

## 3. Les termes sans source officielle

Tout ce que **Polished Crystal ajoute** et que la Gen 2 n'avait pas : lieux,
personnages, objets, fonctionnalités, mécaniques postérieures.

⚠️ **Rien n'entre dans cette table sans vérification.** §8.6 du cahier : jamais
de mémoire. J'allais écrire « Ciel Gris » et « Régime Strict » pour *Air Lock*
et *Hyper Cutter* — **les deux sont inchangés en français.**

Sources acceptables, dans l'ordre : corpus HG/SS français → Poképédia →
l'utilisateur. **Jamais la mémoire seule.**

| Anglais | Français | Statut | Source | Note |
|---|---|---|---|---|
| *(vide — se remplit à partir de la phase 4)* | | | | |

**Statuts :** `validé` (source citée) · `proposé` (en attente de l'utilisateur) ·
`provisoire` (posé pour avancer, à revoir) · `inchangé` (identique en français,
confirmé).

---

## 4. Les pièges de vocabulaire déjà identifiés

### Homographes entre les deux langues

**`LANCE`** est le nom français de **Proton** (Team Rocket) autant que le nom
anglais de **Peter** (Maître dragon). Un remplacement en bloc renomme Proton.

**Règle : un terme signalé par un balayage n'est pas un défaut tant qu'on n'a
pas identifié le personnage ou l'objet visé.** ([`PIEGES.md`](PIEGES.md) #5)

### Inversions d'ordre — le texte ne suffit pas

Déjà relevées dans `data/trainers/class_names.asm` :

| Anglais | Français | Ce que ça implique |
|---|---|---|
| `#MON PROF.` | `PROF.#MON` | ordre inversé |
| `<PKMN> TRAINER` | `DRES. <PKMN>` | ordre inversé |

Sur le chantier jumeau : `'s BASE` → `BASE DE {nom}` et `{nom} BERRY` →
`BAIE {nom}` ont exigé un **changement de code**, pas seulement de texte.

⚠️ **Ne jamais reprendre un texte sans vérifier le code qui l'assemble.**
([`PIEGES.md`](PIEGES.md) #7)

### Balayer par les valeurs anglaises, jamais par détection

`verif_glossaire` devra balayer avec les **valeurs anglaises connues** de ce
glossaire et signaler chaque occurrence — **pas** chercher « de l'anglais ».
Deux garde-fous obligatoires :

- ne jamais signaler un mot employé **côté français** (`SAFARI` dans « PARC
  SAFARI ») ;
- comparer **sans accents**.

Motif : un détecteur d'anglais est aveugle aux panneaux et aux statues d'arène,
c'est-à-dire au texte le plus lu du jeu ([`PIEGES.md`](PIEGES.md) #3).
