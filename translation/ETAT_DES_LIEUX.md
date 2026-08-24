# Polished Crystal FR — état des lieux

*Rédigé au premier jour, avant tout outil et toute traduction.*
*Complète — et corrige sur trois points — le cahier de mission `POLISHED_CRYSTAL_FR.md`.*

Ce document consigne **ce qui a été mesuré**, pas ce qui a été supposé. Chaque
chiffre est reproductible depuis les trois dépôts de l'atelier. Quand une
question reste ouverte, elle est écrite comme ouverte.

---

## 1. L'atelier

```
/Users/come/Documents/polishedcrystal-fr/
  ├── POLISHED_CRYSTAL_FR.md   ← le cahier de mission
  ├── polishedcrystal/         ← LE dépôt git (rangi42/polishedcrystal, master)
  │     └── translation/       ← notre travail
  ├── pokecrystal/             ← référence anglaise (pret), NON versionnée par nous
  └── pokecrystal-fr/          ← référence française officielle, NON versionnée par nous
```

La règle structurelle du §2 du cahier est **déjà satisfaite** : `polishedcrystal`
est le seul dépôt git que nous modifions, et les deux décompilations sont ses
**voisines**, pas ses filles. Aucun `git add .` ne peut les aspirer. Ne jamais
les déplacer à l'intérieur.

### Chaîne d'outils

| Outil | État |
|---|---|
| RGBDS | **v1.0.3** installée (Homebrew) — PC exige ≥ 1.0.0 |
| Python | 3.12.7 |
| make, gcc, git, gh | présents |

### Référence validée

`pokecrystal-fr` compile et produit un SHA1 **identique** à celui déclaré dans
son `roms.sha1` :

```
c055992b16b7399c687647725cdd1f4f13a2f75c  pokecrystal.gbc
```

C'est l'étape 3 du §11 du cahier. Elle est **faite**. La référence française
est donc une vraie référence, et non une approximation.

---

## 2. Ce que le cahier annonçait, et qui est vérifié

Rien de ce qui suit n'a été cru sur parole.

| Affirmation | Contrôle |
|---|---|
| 2 463 `.asm` de chaque côté, mêmes labels | ✅ 2463 / 2463 |
| Charmap 371 (EN) vs 391 (FR) | ✅ exactement |
| 26 ajoutés / 6 retirés / 2 déplacés | ✅ à l'identique |
| Appariement par label exact | ✅ `_FruitBearingTreeText::` → `data/text/common_1.asm` des deux côtés |
| Limite de **18 tuiles** par ligne | ✅ **y compris sur Polished Crystal** (voir §4) |

Le cahier est fiable. Les corrections qui suivent portent sur ce qu'il ne
**pouvait pas** savoir : les particularités techniques de Polished Crystal.

---

## 3. CORRECTION MAJEURE — Polished Crystal compresse son texte

C'est le fait qui redéfinit le chantier, et le cahier ne le mentionne nulle part.

`constants/charmap.asm` n'est pas une table plate. C'est **deux mécanismes de
compression superposés** :

### 3.1 Huffman

Chaque caractère compressible porte un **code binaire de longueur variable**,
inscrit en dur via la macro `ctxtmap` :

```asm
	ctxtmap "e",  $a4, 000            ; 3 bits — le plus fréquent en anglais
	ctxtmap "♀",  $bf, 1000011101101000001   ; 19 bits — le plus rare
```

Ces longueurs sont **calibrées sur les fréquences de l'anglais**. En français,
`e` reste très fréquent, mais l'ordre change en dessous : le texte français
compressera moins bien tant que l'arbre n'est pas reconstruit.

### 3.2 N-grammes

Les octets `$0a`–`$4c` (67 cases) codent des **séquences anglaises entières** :

```asm
	charmap "the ",  $3e
	charmap "you",   $3f
	charmap "batt",  $46
	charmap "It's ", $4a
	charmap "I'm ",  $2d
```

Aucune n'a de sens en français. Elles doivent être remplacées par les
n-grammes français (`ent`, `qu'`, `ous`, `tion`, `est `, `Pokémon`, …).

### 3.3 Où vit la compression, exactement

Vérifié dans la source : **il n'y a pas d'outil externe de compression.** Tout
se fait à l'assemblage, par des macros RGBDS.

| Fichier | Rôle |
|---|---|
| `constants/charmap.asm` | Les codes Huffman (`ctxtmap`) **et** la table de n-grammes. C'est la source de vérité. |
| `data/text/compressed_text.asm` | Reconstruit l'arbre de décodage à partir de ces mêmes codes, à la compilation |
| `data/text/ngrams.asm` | Les chaînes que les n-grammes développent à l'exécution |
| `home/text.asm` | Le décodeur, côté jeu |

Modifier la compression, c'est donc modifier **`charmap.asm` et `ngrams.asm`
ensemble**. Ils ne peuvent pas diverger : `compressed_text.asm` échoue
bruyamment (`fail "invalid leaf node character…"`) si l'arbre est incohérent —
c'est un des rares endroits du chantier où l'erreur se signale toute seule.

### 3.4 Les générateurs existent

Bonne nouvelle : **ces tables ne s'écrivent pas à la main.** Le dépôt amont
fournit les deux outils qui les calculent :

- `utils/huffman.py` — mode d'emploi dans son propre en-tête :
  `make huffman > chars.txt`, puis `./utils/huffman.py chars.txt`, puis reporter
  la sortie dans `constants/charmap.asm`.
- `utils/ngram.py` — même principe pour la table de n-grammes.

⚠️ Ils sont à **rejouer après chaque lot conséquent de traduction**, et pas
seulement à la fin : une ROM qui ne tient plus en banque s'en aperçoit tard.

⚠️ `utils/ngram.py` embarque **sa propre copie de la liste des jetons** du
charmap, en dur dans le fichier. Toute modification du charmap doit être
répercutée dedans, sinon l'outil retokenise faussement — et, fidèle au ⚠️ du §7
du cahier, il ne s'en plaindra pas.

---

## 4. La limite de largeur — 18, mais pas partout

Le 18 est **structurel** : `TEXTBOX_INNERW = SCREEN_WIDTH(20) − BORDER_WIDTH(2)`
dans `constants/text_constants.asm`. Il vaut pour la boîte de dialogue, qui est
l'écrasante majorité du texte.

⚠️ **Mais trois contextes en sortent**, mesurés sur les 38 759 lignes de PC :

| Contexte | Max |
|---|---|
| Dialogue, objets, capacités, Pokématos | 18 |
| **Entrées du Pokédex** (1 667 lignes) | **19** |
| **Descriptions de talents** (311 lignes) | **19** |
| Générique, quelques messages de combat | **20** |

Détail et méthode de comptage dans [`CONVENTIONS.md`](CONVENTIONS.md) §1.
`verif_longueurs` devra porter une **table de budgets par contexte**, pas une
constante unique.

La police reste à **chasse fixe** pour le dialogue. Le VWF présent dans le dépôt
(`tools/vwf.c`) ne sert qu'à `gfx/font/space.vwf.1bpp` — pas au texte.

---

## 5. CORRECTION — l'espace du charmap est PLEIN

Mesuré : **256 octets sur 256 sont attribués. Zéro case libre.**

Il n'y a donc pas « de la place à trouver » : chaque caractère français ajouté
doit en **remplacer** un existant. C'est la contrainte dure du chantier.

### 5.1 Ce dont le français a besoin

Fréquences relevées sur les 24 119 lignes du Cristal français officiel :

| Accentuées | occurrences | | Élisions (1 tuile) | occurrences |
|---|---|---|---|---|
| `é` | 3 253 *(déjà dans PC)* | | `l'` | 560 |
| `à` | 899 | | `d'` | 505 |
| `ê` | 484 | | `n'` | 305 |
| `è` | 451 | | `c'` | 267 |
| `ç` | 342 | | `u'` | 262 |
| `î` | 209 | | `t'` | 234 |
| `ô` | 167 | | `j'` | 216 |
| `û` | 89 | | `m'` | 189 |
| `â` | 88 | | `s'` | 175 |
| `ù` | 73 | | `'s` | 66 *(déjà dans PC)* |
| `ï` | **6** | | `p'` | **30** |
| `ë` | **0** | | `y'` | **6** |
| `É` | **0** | | | |
| `ß` | **0** | | | |

Deux enseignements immédiats :

- `ë`, `É` et `ß` sont déclarés au charmap français mais **jamais employés** —
  illustration directe du ⚠️ du §4 du cahier (« un label déclaré n'est pas un
  texte affiché »). Ne pas leur réserver de case.
- `É` à zéro **confirme** la règle du §5.4 : les jeux Pokémon français
  n'accentuent pas les capitales.

**Besoin réel : 10 accentuées + 9 élisions significatives = 19 cases.**
(`ï` à 6 et `y'` à 6 sont marginales ; `p'` à 30 est discutable.)

### 5.2 Ce qu'on peut libérer

| Caractère | occurrences dans PC | Verdict |
|---|---|---|
| `'d` `'l` `'m` `'r` `'t` `'v` | 123 / 492 / 708 / 525 / 1137 / 291 | **6 cases** — contractions anglaises, disparaissent avec la traduction |
| `É` | **0** | **1 case** — libre immédiatement |
| `á` `í` `ó` `¿` `¡` | 2 / 1 / 1 / 1 / 2 | **5 cases** — mais voir ci-dessous |

**Total franc : 7 cases. Avec l'espagnol : 12.**

⚠️ Les cinq caractères espagnols ne sont employés **que dans un seul fichier**,
`maps/ShamoutiCoast.asm` : un PNJ hispanophone des îles Orange. Les libérer
suppose de décider ce que devient ce personnage en français — **c'est une
décision d'utilisateur, pas une décision technique** (§10 du cahier).

### 5.3 Le déficit

**19 cases nécessaires, 12 disponibles au mieux : il en manque 7.**

Pistes à évaluer *par la mesure*, jamais à l'intuition :

1. **Renoncer aux élisions les moins rentables.** Une élision non dotée d'une
   case coûte 1 tuile de plus par occurrence. `y'` coûterait 6 tuiles sur tout
   le jeu, `p'` 30. Sacrifice quasi gratuit. Les 9 principales représentent
   2 713 tuiles économisées — celles-là valent leur case.
2. **Reprendre des cases de symboles peu employés** : `′` (1), `″` (1), `↑` (2),
   `↓` (2), `№` (11). Vérifier d'abord qu'aucun **code** ne les émet en dur.
3. **Arbitrer entre `<BOLDH>` / `<BOLDP>` / les cadres** — à examiner, non
   mesuré à ce jour.

⚠️ Aucune de ces pistes ne doit être appliquée avant d'avoir mesuré son coût
réel **sur le texte français traduit**, pas sur l'anglais. La bonne décision
n'est pas prenable aujourd'hui.

---

## 6. CORRECTION — il y a huit polices, pas une

`gfx/font.asm` déclare **8 polices de 114 tuiles** chacune :

```
normal · narrow · bold · italic · serif · micr · chicago · unown
```

Le ⚠️ du §5.2 du cahier — « une entrée de charmap ne garantit pas un glyphe » —
se multiplie donc **par huit**. Chaque caractère français ajouté doit être
dessiné dans chaque police qui affiche du dialogue, et **les pixels vérifiés**,
pas seulement la déclaration.

Reste à établir : lesquelles de ces 8 polices servent réellement au dialogue.
Non mesuré à ce jour.

---

## 7. Le volume brut — et pourquoi il ne dit rien

| Dépôt | lignes de texte |
|---|---|
| `pokecrystal` (EN vanilla) | 24 370 |
| `pokecrystal-fr` (FR officiel) | 24 119 |
| **`polishedcrystal`** | **38 759** |

⚠️ **Le cahier se trompe sur ce point.** Son §1 annonce « un volume de texte à
écrire bien plus faible ». Polished Crystal a **+59 % de lignes** que le Cristal
vanilla. Il a aussi 607 fichiers de cartes contre 388, et ~2 800 `.asm` contre
2 463.

⚠️ **Ce chiffre n'est pas une charge de travail.** C'est un plafond brut, et le
§6 du cahier explique précisément pourquoi il ment : orphelins, `FR == EN`
confirmés, cartes hors d'atteinte. Sur le chantier jumeau, un plafond de 659 est
tombé à 7 réels. **Aucun chiffre de travail ne sera annoncé avant le tri de la
phase 1.**

---

## 7 bis. LA CONTRAINTE DURE — il reste 0,85 % de ROM libre, et ça baisse

Polished Crystal compile (RGBDS 1.0.3, sans erreur ni avertissement bloquant)
et `tools/bankends` annonce :

```
Free space: 17794/2097152 (0.85%)
```

**17,4 Ko libres sur 2 Mo.** C'est la contrainte la plus serrée du chantier, et
elle commande tout le reste.

### Pourquoi c'est le vrai risque

Le texte français passé dans des tables calibrées pour l'anglais compresse
**moins bien**. Les n-grammes `"the "`, `"you"`, `"batt"`, `"I'm "` ne se
déclencheront quasiment jamais ; les codes Huffman courts sont attribués aux
fréquences anglaises. Le texte gonfle sans qu'une seule phrase ait été
rallongée.

Avec 0,85 % de marge, **il n'y a pas de coussin**. Retuner Huffman et les
n-grammes n'est donc pas une optimisation de fin de chantier : c'est une
condition pour que la ROM se construise.

⚠️ **Et la marge se réduit.** Sur le commit de notre premier clone
(`20a367242`, 8 août) il restait 26 989 octets. Cent cinq commits plus tard
(`9df8776ca`, 23 août), il en reste **17 794**. Rangi consomme la place plus
vite que nous ne l'économiserons en restant passifs. Chaque fusion depuis
l'amont peut donc **réduire** notre budget : à surveiller à chaque `merge`.

### Ce que la mesure dit du volume, elle

| | lignes | caractères |
|---|---|---|
| `pokecrystal` (EN) | 24 364 | 331 449 |
| `pokecrystal-fr` (FR) | 24 113 | 311 032 |
| `polishedcrystal` | 38 759 | 530 527 |

**Ratio FR/EN : 0,938 en caractères.** Contre-intuitif, mais mesuré : le
Cristal français officiel est **6 % plus court** que l'anglais, pas plus long.
La traduction officielle était déjà contrainte par la place et a condensé.

⚠️ **Ce ratio ne se transpose pas mécaniquement.** Il vient d'un texte écrit
sous contrainte de place par des traducteurs professionnels. Rien ne garantit
que notre propre texte s'y tiendra, et 6 % de gain brut ne compense pas
forcément la perte en compression. **Le premier travail chiffré de la phase 1
sera d'estimer le coût en octets du français sous les tables anglaises,** avant
d'écrire une seule ligne de traduction.

---

## 8. Décisions en attente de l'utilisateur

Reprend le §10 du cahier, augmenté de ce que la reconnaissance a fait remonter.

| # | Décision | Pourquoi elle ne peut pas être prise seul |
|---|---|---|
| 1 | **Le PNJ hispanophone de `ShamoutiCoast.asm`** | Libère 5 cases de charmap, mais efface un effet de langue voulu par l'auteur. Arbitrage éditorial. |
| 2 | **Quelles élisions méritent une case** | Compromis entre place et lisibilité. À trancher sur mesure du texte traduit. |
| 3 | **Le générique** | Traduire seulement la part du hack ferait changer de langue au milieu du rouleau. Sur le chantier jumeau : laissé en anglais. |
| 4 | **Les noms propres du hack** | Lieux, personnages, fonctionnalités sans aucune source officielle. §8.6 : jamais de mémoire. |
| 5 | **Vocabulaire moderne ou d'époque** | Mesurer d'abord si le hack modernise déjà de lui-même, et le suivre. |
| 6 | **Les bugs trouvés en route** | Signalés, jamais corrigés d'office (§10). |

---

## 9. Les pièges, réévalués pour Polished Crystal

Les huit pièges du §8 du cahier restent valables. Trois se durcissent ici :

- **§8.2 — symboles réappropriés.** PC a 2 791 `.asm` contre 2 463, dont
  607 cartes contre 388. La surface de réappropriation est **plus large** que
  sur le chantier jumeau. L'appariement par label reste exact, mais un label
  identique ne garantit **pas** un contenu correspondant.
- **§8.5 — le texte sans son code.** À contrôler en priorité sur les tables
  déjà repérées : `data/text/input_chars.asm` (le clavier — le précédent le plus
  coûteux du chantier jumeau), `data/text/plural_table.asm` (le pluriel anglais
  n'a pas la même mécanique qu'en français) et `data/text/ngrams.asm`.
- **§7 — le motif trop strict.** Aggravé par la compression : un lecteur `.asm`
  qui ignore `ctxtmap`, `rawchar` ou les charmaps alternatifs
  (`no_ngrams`, `compressing`, `default`) rendra un « 0 » serein et faux.
  **Chaque contrôle sera testé sur un cas fabriqué avant d'être cru.**

---

## 10. Ordre de marche

1. ~~Valider `pokecrystal-fr` par son SHA1~~ ✅ **fait**
2. ~~Installer RGBDS~~ ✅ **fait (v1.0.3)**
3. ~~Compiler Polished Crystal tel quel~~ ✅ **fait** — `9df8776ca`, 0,85 % de ROM libre
4. `chemins.py` — résolution depuis sa propre position, **échec bruyant**
5. Lecteur `.asm` — `label -> texte`, testé sur un fichier compté à la main
6. `inventaire` au critère exact, puis `triage`
7. **Estimer le coût en octets du français sous les tables anglaises** (§7 bis)
8. **Alors seulement**, annoncer un chiffre

---

## 11. Journal des décisions

| Date | Décision | Motif |
|---|---|---|
| 2026-08-24 | RGBDS 1.0.3 via Homebrew | PC exige ≥ 1.0.0 ; sans compilation, la discipline du §9 est inapplicable |
| 2026-08-24 | `pokecrystal-fr` retenu comme référence | SHA1 reproduit à l'identique |
| 2026-08-24 | Aucun chiffre de travail annoncé | Le plafond brut (38 747) n'est pas trié |
| 2026-08-24 | Ligne de base compilée avant toute modification | Un build de référence est le seul moyen de savoir plus tard ce que *nous* avons cassé |
| 2026-08-24 | La retune Huffman/n-grammes passe en tête de priorité | 0,85 % de ROM libre, et en baisse : ce n'est plus une optimisation, c'est une condition de build |
| 2026-08-24 | Base de traduction : `master` amont (`9df8776ca`), pas le tag `v3.2.3` | La dernière release date du 11 déc. 2025 ; 631 commits l'ont suivie dont 211 touchant du texte. Traduire une base figée reviendrait à différer la fusion, pas à l'éviter. |
