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

---

## 5. Le précédent officiel pour un personnage en langue étrangère

**Question posée le 2026-08-24 :** que faire de `SIGHTSEERF PILAR`
(`maps/ShamoutiCoast.asm`), touriste qui parle **espagnol correct** dans
Polished Crystal ?

⚠️ Elle est la **seule** locutrice non anglophone de tout le hack, et la seule
utilisatrice de `á í ó ¿ ¡`.

### Ce que la VF officielle de Cristal fait dans un cas voisin

Le grouillot de la Team Rocket de la **Route 24** parle un anglais cassé et
inversé. La VF officielle ne l'a pas laissé en anglais : elle a écrit du
**français cassé à consonance hispanisante**.

| `pokecrystal` (EN) | `pokecrystal-fr` (VF officielle) |
|---|---|
| `Beat you for sure / will TEAM ROCKET.` | `TEAM ROCKET te / battre!` |
| `You say what? TEAM / ROCKET bye-bye a go-go?` | `Qué dit? TEAM / ROCKET cassé? / Par toi en plous?` |
| `Oh, no! Should I / do what now on from, me?` | `Oh, non! Qué yé / dois faire moi?` |
| `But you forget me / not!` | `Ma toi tu oublies / pas moi!` |

**La technique officielle : rendre l'accent EN FRANÇAIS, ne pas conserver la
langue étrangère.**

### Mais les deux cas ne sont pas identiques

| | Grouillot Route 24 | PILAR |
|---|---|---|
| Ce qu'il parle | de l'**anglais** mal parlé | de l'**espagnol** correct |
| Le joueur anglophone… | comprend, avec un accent | **ne comprend pas** |
| L'effet voulu | comique, accent | dépaysement, altérité |

Appliquer la recette de la Route 24 à PILAR la rendrait **compréhensible**, ce
qu'elle n'est pas pour un joueur anglophone. C'est un changement de fond.

### Les trois options, telles qu'elles se présentent

| | Ce que ça donne | Cases de charmap |
|---|---|---|
| **1. Garder l'espagnol** | Fidèle à l'intention : une étrangère dont on ne partage pas la langue. | coûte **5 cases** |
| **2. Français cassé hispanisant** | Suit le précédent officiel de la Route 24. Mais elle devient compréhensible. | libère 5 cases |
| **3. Lui faire parler anglais** | Conserve l'effet « je ne la comprends pas » pour un joueur francophone, l'anglais étant la langue étrangère de référence. Aucun caractère spécial requis. | libère 5 cases |

⚠️ **Libérer ces 5 cases ne suffit pas** à combler le manque de charmap
(il en manquerait encore 6 — voir [`DECISIONS.md`](DECISIONS.md) A1).
**L'arbitrage se joue donc sur le fond, pas sur la place.**

**En attente de décision de l'utilisateur.**
