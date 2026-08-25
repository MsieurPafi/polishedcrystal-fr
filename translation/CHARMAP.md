# Le budget de charmap — registre

Sujet le plus contesté du chantier : **je m'y suis trompé trois fois.** Ce
document existe pour qu'on n'ait plus à refaire le raisonnement, et pour
qu'une décision réversible puisse être rouverte sans tout recalculer.

---

## 1. Les deux ressources, à ne jamais confondre

⚠️ **C'est l'erreur qui m'a coûté le plus de temps.** Un caractère réclame
**deux** ressources indépendantes :

| Ressource | Plage d'octets | Ce qu'elle donne | Total |
|---|---|---|---|
| **tuile de police** | `$7f`–`$f0` | le glyphe s'affiche | 114 |
| **feuille Huffman** | `$7f`–`$eb` **et** `$4d`–`$5c` | le caractère se comprime | 125 |

Une lettre accentuée a besoin des **deux**. Elle doit donc vivre dans
`$7f`–`$eb`, l'intersection — et cette plage est **pleine**.

Les 4 feuilles libres `$fc`–`$ff` desservent les octets `$4b`–`$5c`, qui sont
des n-grammes et des caractères de contrôle **sans glyphe**. Elles ne peuvent
pas loger un `à`. Voir [`PIEGES.md`](PIEGES.md) #1 quater.

⚠️ **Et un caractère sans feuille Huffman ne se contente pas d'être moins bien
comprimé : il fait ÉCHOUER la compression de tout bloc qui le contient**
(+58 834 octets si on le fait pour les accents — voir
[`COMPRESSION.md`](COMPRESSION.md)). Il n'y a donc pas d'option « tuile
seulement » pour une lettre.

---

## 2. Le besoin — 9 caractères

Décompte **exhaustif** des caractères non-ASCII du corpus français **vivant**
(`mobile/`, `engine/debug/` et le mystery gift exclus — voir
[`PIEGES.md`](PIEGES.md) #9 bis) :

| À créer | occurrences | | Déjà dans PC | occurrences |
|---|---|---|---|---|
| `à` | 899 | | `é` | 3 250 |
| `ê` | 484 | | `…` | 281 |
| `è` | 450 | | `¥` | 20 |
| `ç` | 342 | | `№` | 2 |
| `î` | 209 | | `♂` `♀` | 1 chacun |
| `ô` | 167 | | | |
| `û` | 89 | | | |
| `â` | 88 | | | |
| `ù` | 73 | | | |

**Écartés :**

- **`ï`** — 6 occurrences. Reformuler les rares mots concernés.
- **`←` `→`** — 1 occurrence chacun ; se rabattent sur `◀` `▶`, que PC possède.
- **Les 11 élisions** (`l'` `d'` `n'` `c'` `u'` `t'` `j'` `m'` `s'` `p'` `y'`) —
  mesurées à **+64 octets** et 10 débordements de ligne sur 24 113. Elles ne
  valent pas leur case. Voir [`COMPRESSION.md`](COMPRESSION.md) §5.

⚠️ `'s` **reste** : il est employé 66 fois en français, pour « J'suis »
(`J` + `'s` + `uis`). Ce n'est pas une contraction anglaise résiduelle.

---

## 3. Le registre des cases

### Libérées sans arbitrage — 7

| Octet | Jeton | Motif |
|---|---|---|
| `$c1` | `'d` | contraction anglaise, disparaît en français |
| `$c2` | `'l` | idem |
| `$c3` | `'m` | idem |
| `$c4` | `'r` | idem |
| `$c6` | `'t` | idem |
| `$c7` | `'v` | idem |
| `$c9` | `É` | **0 occurrence** en texte, **0 référence** en code. Et le français n'accentue pas les capitales ([`CONVENTIONS.md`](CONVENTIONS.md) §2). |

### Libérées par décision D1 — 2

| Octet | Jeton | Occurrences |
|---|---|---|
| `$cc` | `í` | **1** |
| `$cd` | `ó` | **1** |

### Total : 9 cases pour 9 caractères

⚠️ **Marge : zéro.** Le budget est équilibré au caractère près. Tout besoin
supplémentaire découvert plus tard exigera un nouvel arbitrage.

---

## 4. Décision D1 — retirer `í` et `ó`, garder l'espagnol de PILAR

**Décidée le 2026-08-24 par l'utilisateur. Explicitement réversible.**

### Ce qui est décidé

`SIGHTSEERF PILAR` (`maps/ShamoutiCoast.asm`), touriste hispanophone et seule
locutrice non anglophone du hack, **garde son espagnol**. Elle perd seulement
les accents `í` et `ó`, dont les cases sont réaffectées au français.

### Les deux mots touchés

| Fichier | Ligne | Avant | Après |
|---|---|---|---|
| `maps/ShamoutiCoast.asm` | **111** | `viajado un mont**ó**n` | `viajado un monton` |
| `maps/ShamoutiCoast.asm` | **127** | `Pensé que durar**í**a` | `Pensé que duraria` |

### Ce qui est préservé

`¡` `¿` `á` et `é` restent. Les marques que l'œil attrape — `¡Hola!`,
`¿Qué tal si combatimos?` — sont intactes. L'espagnol demeure immédiatement
identifiable.

### Le coût assumé

C'est de l'**espagnol mal orthographié** sur deux mots. Un hispanophone le
remarquera. Assumé sciemment contre la préservation intégrale de l'effet voulu
par l'auteur du hack : une étrangère dont le joueur ne partage pas la langue.

### Ce qui a été écarté, et pourquoi

| Option | Verdict |
|---|---|
| **Franciser PILAR** (français cassé hispanisant) | Un précédent officiel existe — la VF de Cristal traite ainsi le grouillot Rocket de la Route 24 ([`GLOSSAIRE.md`](GLOSSAIRE.md) §5). Mais ce personnage-là était **compréhensible en anglais** ; PILAR ne l'est pas. La franciser lui retire son opacité, qui est le propos. |
| **Lui faire parler anglais** | Préserverait l'opacité pour un joueur francophone. Écarté : s'éloigne davantage de l'intention de l'auteur. |
| **Sacrifier `<SHARP>`** (`$df`) | Ne sert qu'au **lecteur de musique** (`data/music_player/notes.asm` : Do♯, Ré♯, Fa♯). Fonctionnalité bonus mais visible, et non liée à la traduction. Gardé en réserve. |
| **Sacrifier `♥`** (10 usages) ou **`№`** (6) | Présents dans du texte réel. Plus coûteux que 2 accents espagnols. |
| **Sacrifier `<BOLDH>`, `<PO>`, `<KE>`** | Non. Vraie interface : résumé, Pokédex, écran CT/CS, « Pokégear » du menu de départ. |

### Pour rouvrir la décision

Tout est réversible tant que la police n'est pas redessinée. Dans l'ordre :

1. **Rendre ses accents à PILAR** — il faut 2 cases ailleurs. La réserve la
   moins chère est `<SHARP>` (`$df`), au prix du lecteur de musique.
2. **Franciser ou angliciser PILAR** — libère `¡` `¿` `á` en plus, soit
   **3 cases de marge**, et rend `ï` ou une élision envisageable.
3. **Si un 10ᵉ caractère devient nécessaire** — la marge étant nulle, ce
   registre est le point de départ : reprendre le tableau des sacrifices
   ci-dessus, pas le raisonnement.

---

## 5. Application — faite le 2026-08-24

### Le charmap

Les 9 caractères ont pris les cases libérées, **en conservant les codes
Huffman de leurs prédécesseurs** : seul le libellé des feuilles change,
l'arbre garde exactement sa forme.

| Octet | Était | Devient |
|---|---|---|
| `$c1` | `'d` | **`à`** |
| `$c2` | `'l` | **`â`** |
| `$c3` | `'m` | **`ç`** |
| `$c4` | `'r` | **`è`** |
| `$c6` | `'t` | **`ê`** |
| `$c7` | `'v` | **`î`** |
| `$c9` | `É` | **`ô`** |
| `$cc` | `í` | **`ù`** |
| `$cd` | `ó` | **`û`** |

⚠️ Les codes sont donc **provisoirement mal calibrés** — `à` porte l'ancien
code de `'d`, long de 12 bits. Ils seront réoptimisés par `make huffman` une
fois le texte traduit, pas avant : le regénérer maintenant l'accorderait à un
texte encore anglais.

### Les polices — les 8, pas une

⚠️ `Options_Typeface` (`engine/menus/options_menu.asm`) laisse le joueur
cycler de `NORMAL_FONT` à `UNOWN_FONT`. **Chaque police affiche du dialogue**,
donc chacune a reçu les 9 glyphes : 72 tuiles.

`outils/glyphes_fr.py` les **compose** au lieu de les recopier depuis le
Cristal français, pour que chaque glyphe reste dans le style de sa police :
le corps vient de la lettre de base, l'accent est dérivé de l'aigu que cette
police possède déjà (`á é í ó`). `unown`, dont les runes ignorent les
diacritiques, rend la lettre telle quelle — exactement comme PC le fait pour
son propre `á`.

### Décision D2 — normaliser l'accent de `é`

Dans `normal`, `bold`, `serif` et `chicago`, PC dessinait l'accent de `é`
décalé à gauche et plus épais que celui de `á` — une incohérence **interne au
hack**. Comme `è` et `ê` héritent de l'accent de `é`, elle se serait propagée
à toute la famille `e`, soit 4 187 occurrences prévues.

⚠️ **Ce n'était pas qu'une question de goût.** Mesuré : une fois `é` aligné sur
`á`, les `è` et `ê` composés deviennent **identiques au pixel près** à ceux du
Cristal français officiel. La normalisation ramène donc la famille entière sur
la typographie que les joueurs francophones connaissent.

**Décidée par l'utilisateur le 2026-08-24.** C'est le seul endroit où l'on
modifie un glyphe **préexistant** de Polished Crystal.

Résultat : **6 des 9 glyphes de `normal` sont identiques au Cristal français**
(contre 4 avant) — `è â ô û ê î`. Les 3 restants diffèrent à raison :

| | pourquoi |
|---|---|
| `à` `ù` | accent un pixel à droite, aligné sur le `á` de PC. L'officiel n'est pas cohérent avec lui-même là-dessus (son `à` et son `è` ne s'alignent pas pareil). |
| `ç` | le `c` de PC est **carré**, celui du Cristal VF est **rond**. Recopier aurait mis un `c` rond au milieu des `c` carrés. |

⚠️ **Piège évité de justesse** : la première version du test de normalisation
comparait les lignes 0-1 de `á` et `é`. Dans `unown`, dont les runes n'ont
aucun diacritique, ce sont deux runes **différentes** — le test les jugeait
incohérentes et écrasait le `é` d'unown par un mélange des deux. Corrigé en
testant d'abord si la police a des accents du tout (`á == a`).

### Le clavier de saisie

⚠️ `data/text/input_chars.asm` **employait les contractions supprimées** —
`rawchar "é'd'l'm'r's't'v0"`. C'est le piège #7 du cahier, celui qui avait
coûté le plus cher sur le chantier jumeau. Les quatre rangées concernées sont
devenues `"éàêèçîôû0"` / `"éàêèçîôû()"`, à nombre de touches constant.

**Limite connue :** `â` et `ù` ne sont pas saisissables dans un surnom — il
n'y avait que 7 cases pour 9 accents, et ce sont les deux moins fréquents
(88 et 73 occurrences).

### Les tables à largeur fixe

⚠️ Deux `assert` ont sauté à la compilation, et c'est ce qu'on leur demande :

```
PokemonNames: expected 2920 total; but got 2922
WonderTradeOTNames2: expected 1792 total; but got 1793
```

`Farfetch'd`, `Sirfetch'd` et `Li'l D` payaient 1 octet pour `'d` / `'l` et en
paient 2. Ils remplissent désormais leur champ en entier, donc le terminateur
`@` devient superflu — 22 noms de Pokémon et 103 noms de DO sont **déjà**
écrits ainsi dans PC.

### Vérifié dans la ROM, pas seulement dans la source

| Contrôle | Résultat |
|---|---|
| glyphes `à` `ç` `û` présents dans le binaire | ✓ |
| nouvelle rangée de clavier `c8 c1 c6 c4 c3 c7 c9 cd e0` | ✓ 2 occurrences |
| ancienne rangée anglaise | ✓ disparue |
| contrôle positif (glyphe `a` inchangé) | ✓ |

Puis une chaîne réelle traduite au critère exact — `_FruitBearingTreeText` —
et **redécodée depuis le binaire** :

```
en clair : "C'est "        ← C, ', n-gramme « es », n-gramme « t »
<CTXT>                     ← la compression s'enclenche
comprimé : "un arbre à<LINE>fruits.<DONE>"
```

Reconstruit : `"C'est un arbre à<LINE>fruits.<DONE>"` — **identique à la
source.** L'accent traverse le charmap, l'arbre de Huffman et le build.

### Coût actuel en espace

| | octets libres |
|---|---|
| avant | 17 794 (0,85 %) |
| après | **14 782 (0,70 %)** |

Les **3 012 octets** consommés sont le prix payé par le texte **encore
anglais** : `'d 'l 'm 'r 't 'v` coûtent maintenant 2 octets au lieu d'un, sur
3 251 occurrences. Ce coût **disparaîtra** à mesure que le texte devient
français — et la mesure de [`COMPRESSION.md`](COMPRESSION.md) prévoit un solde
final de −12 à −21 Ko.

---

## 5 bis. Le second budget — les CAPITALES accentuées (décision D3)

La décision **D3** (casse mixte) ouvre un besoin que la casse ALL-CAPS
n'avait pas : `ECORCIA` devient `Écorcia`. Il faut des **capitales
accentuées**, que le §2 de [`CONVENTIONS.md`](CONVENTIONS.md) excluait.

### Le besoin — 5 capitales, mesurées

| | Pourquoi | Occurrences |
|---|---|---|
| **`Ç`** | « Ca » → « **Ça** » en début de phrase | **666** |
| **`Î`** | « ILES » → « **Î**les » | 60 |
| **`Ê`** | « Etre » → « **Ê**tre », « Etes » → « **Ê**tes » | 21 |
| **`Â`** | « BADGE AME » → « Badge **Â**me », « MAISON DES AMES » | 11 |
| **`É`** | noms propres — Écorcia, Ébènelle, Écume, Écolier, Écrémeuh | vérifiés par l'utilisateur |

⚠️ `É` n'est pas mesurable par fréquence : les noms propres n'apparaissent
jamais en minuscules, donc la méthode statistique les rate. Les formes ont été
**vérifiées une par une sur Poképédia** → [`GLOSSAIRE.md`](GLOSSAIRE.md) §3 bis.

⚠️ Seuls les noms dont la **première** lettre porte un accent comptent.
`Aéromite`, `Argentée`, `Cendrée` n'exigent rien : leur accent tombe en
minuscule.

### Les réserves, par coût croissant

| Case | Ce qu'on perd | Coût réel |
|---|---|---|
| **`<SHARP>`** | les dièses du **lecteur de musique** (Do♯, Ré♯…) | 5 lignes. Absent du charmap français officiel. |
| **`♥`** | un symbole du **clavier de surnom** | aucun texte du jeu ne l'emploie |
| **`♪`** | un symbole du **clavier de surnom** | idem |
| **`'s`** | la ligature « 's » | ⚠️ **1 970 fois en anglais**, 66 en français (« J'suis »). À libérer **après** la traduction, pas avant : d'ici là chaque occurrence coûterait une tuile de plus. |
| `№` | « ID№. » — interface réelle (échange, Pokédex) | 17 lignes de code à réécrire en « No. » |
| `á` `¿` `¡` | l'espagnol de PILAR | **rouvrirait D1** |

### Le compte

**`<SHARP>` + `♥` + `♪` + `'s` = 4 cases**, ce qui couvre **`É` `Ç` `Î` `Â`**
sans toucher à PILAR ni à aucune interface.

Reste **`Ê`** (21 occurrences). Deux issues :
- une 5ᵉ case — `№` ou l'un des trois caractères espagnols ;
- **reformuler** les 21 phrases pour éviter « Être » / « Êtes » en tête.

⚠️ **`'s` ne se libère qu'une fois le texte français.** Tant que l'anglais
occupe le jeu, les trois autres cases (`<SHARP>`, `♥`, `♪`) sont seules
disponibles : il faudra donc **échelonner** l'ajout des capitales, ou accepter
une croissance temporaire de la ROM.

**Décision A6 en attente.**

---

## 6. Ce qui reste à faire

- [ ] Réoptimiser l'arbre Huffman (`make huffman` puis `utils/huffman.py`)
      **après** la traduction du texte, pas avant.
- [ ] Trancher la question cosmétique de l'accent de `é` (§5).
- [ ] Trancher A6 : quelles cases pour les 5 capitales accentuées (§5 bis).
- [ ] Traduire `Farfetch'd` / `Sirfetch'd` (→ `Canarticho` / `Palarticho`,
      **à vérifier**, jamais de mémoire — [`PIEGES.md`](PIEGES.md) #12).
