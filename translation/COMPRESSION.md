# La compression de texte — mécanisme et coût du français

Réponse à la question qui commandait la faisabilité du projet :
**le texte français tient-il dans la ROM ?**

**Oui — à une condition, et l'erreur inverse coûterait 59 Ko.**

---

## 1. Le mécanisme réel

Il n'y a **aucun outil externe** de compression. Tout se joue à l'assemblage,
dans la machine à états de `macros/scripts/text.asm`. Elle est plus subtile
qu'un « Huffman » :

1. Un bloc commence en mode **BRUT**, charmap `default` : **n-grammes actifs**,
   1 octet par jeton.
2. Dès qu'un jeton porte un code Huffman de **moins de 8 bits**, le mode
   **COMPRIMÉ** s'enclenche : un octet `<CTXT>`, puis un flux de bits. Le
   charmap bascule sur `compressing`, **qui n'a pas de n-grammes**.
   → n-grammes et Huffman **s'excluent mutuellement**.
3. Si, en mode comprimé, un caractère **sans code Huffman** survient, la
   compression est **abandonnée pour tout le bloc**, qui repart en octets bruts.
4. En fin de bloc, les deux tailles sont comparées et **la plus petite gagne**.

Huit macros (`text_ram`, `text_decimal`, `text_far`…) **interrompent** la
compression et coûtent 1 à 4 octets chacune.

### Ce qui porte réellement la compression

Mesuré sur 1 823 blocs : **97 % des blocs se compriment**, et

| | octets | part |
|---|---|---|
| bruts (n-grammes) | 2 846 | **6 %** |
| comprimés (Huffman) | 47 975 | **94 %** |

⚠️ **Le levier est le Huffman, pas les n-grammes.** Contre-intuitif : les
n-grammes occupent 67 cases de charmap mais ne couvrent que le début de chaque
bloc, avant que la compression ne s'enclenche — environ 1,6 octet par bloc.

---

## 2. Le simulateur, et sa validation

`outils/encodage.py` reproduit cette machine à états.

⚠️ **Il n'a rien valu jusqu'à ce qu'il soit validé.** Première version :
**57,6 %** de prédictions exactes, écarts systématiquement négatifs de −3.
Cause : le lecteur de blocs ignorait les huit macros de coupure. C'est le
piège #2 de [`PIEGES.md`](PIEGES.md) — un motif d'analyse partiel qui
sous-estime en silence.

Après correction, confronté aux tailles **réellement mesurées dans la ROM
compilée** (533 blocs de la banque `7e`, tailles déduites des adresses du
`.sym`) :

| | |
|---|---|
| prédictions exactes | **84,8 %** |
| écart moyen par bloc | **−0,20 octet** |
| **écart agrégé** | **−16 o sur 10 013 — soit −0,16 %** |

Trois **contrôles positifs** sur cas fabriqués passent également :

| cas | attendu | pourquoi |
|---|---|---|
| `"eee"` | 3 o | 9 bits → 3 o comprimé, 3 o brut, égalité → brut |
| `"eeeeeeee"` | 4 o | 24 bits → 4 o < 8 o brut → comprimé |
| `"★★★"` | 3 o | aucun code Huffman → jamais comprimé |

---

## 3. Le coût du français

### Méthode

Corpus **apparié par label** entre `pokecrystal` (EN) et `pokecrystal-fr`
(FR) : **5 524 blocs**, même contenu, deux langues. 453 343 caractères EN
contre 434 719 FR — rapport **0,959**.

C'est du texte réel, traduit par des professionnels sous contrainte de place.
Le meilleur substitut disponible pour notre propre traduction.

### Résultats

| Scénario | octets | rapport |
|---|---|---|
| **0.** EN, tables anglaises *(la ROM actuelle)* | 236 432 | 1,000 |
| **A.** FR, accents **sans** code Huffman | 274 916 | **1,163** |
| **B.** FR, Huffman refait, n-grammes anglais gardés | 223 109 | 0,944 |
| **C.** FR, tout refait | 222 475 | **0,941** |

### Le contrôle du biais de méthode

⚠️ Mes tables françaises sont calculées **sur le corpus qu'elles encodent**,
alors que les tables de PC sont appliquées à du texte vanilla légèrement
différent. Ce biais joue en faveur du français. Mesuré :

| | rapport |
|---|---|
| EN, tables de PC | 1,000 |
| EN, tables régénérées **par ma méthode** | **0,975** |
| FR, tables régénérées par ma méthode | 0,941 |

**2,5 points du gain venaient de la méthode, pas de la langue.** Le gain propre
au français est donc de **0,965 ×** — le français coûte ~3,5 % d'octets de
moins que l'anglais, ce qui suit le rapport de caractères (0,959).

---

## 4. Projection sur Polished Crystal

Texte de PC, tables actuelles : **360 942 octets**.
Espace libre dans la ROM : **17 794 octets** → croissance tolérable **+4,9 %**.

| Scénario | projection | écart | verdict |
|---|---|---|---|
| **C** optimiste | 339 646 o | **−21 296 o** | ✅ tient, et **libère 21 Ko** |
| **C'** conservateur | 348 309 o | **−12 633 o** | ✅ tient, libère 12,6 Ko |
| **A** accents sans Huffman | 419 776 o | **+58 834 o** | ❌ **dépasse de 41 Ko** |

### Point de bascule

De combien notre français peut-il être plus bavard que la VF officielle avant
de ne plus tenir ?

| hypothèse | marge |
|---|---|
| optimiste | **+11,5 %** de texte |
| conservatrice | **+8,7 %** de texte |

C'est confortable, mais **ce n'est pas illimité**. La VF officielle est
condensée parce que ses traducteurs manquaient de place ; si notre français
s'autorise 10 % de plus, la marge disparaît.

---

## 5. Ce qu'il faut en retenir

### ✅ Le projet tient dans la ROM

Et il **libère** de la place, entre 12 et 21 Ko — davantage que les 17,8 Ko
actuellement libres.

### ❌ L'erreur à ne pas commettre

**Déclarer les caractères accentués avec `charmap` au lieu de `ctxtmap`.**
Sans code Huffman, chaque accent **fait échouer la compression de tout le bloc
qui le contient**. Avec `é` 3 253 fois et `à` 899 fois dans le corpus français,
c'est la quasi-totalité du texte : **+58 834 octets**, soit plus du triple de
l'espace disponible. La ROM ne se construirait pas.

**Tout caractère français ajouté doit recevoir un `ctxtmap` avec un code
Huffman.**

### Les n-grammes sont secondaires

B et C ne diffèrent que de 634 octets sur le corpus apparié. Refaire la table
de n-grammes est utile, **pas urgent**. Refaire l'arbre de Huffman l'est.

### Le plafond de 125 feuilles

`FIRST_LEAF_NODE_ID $7f` → `$eb` (109 caractères) plus `$4d`–`$5c`
(16 caractères) = **125 jetons compressibles au maximum**, et les 125 sont
occupés. Chaque caractère français ajouté doit en **remplacer** un.

Dans le scénario C, un seul caractère est resté sans code : **`ï`**, le plus
rare (6 occurrences dans tout le Cristal français). Conclusion pratique :
**renoncer à `ï`**.

### Les élisions ne valent pas leur case

Mesuré, contre toute attente :

| cases accordées | octets (corpus apparié) | écart |
|---|---|---|
| 9 accents + 9 élisions (18) | 222 475 | référence |
| 9 accents + 4 élisions (13) | 222 646 | +171 o |
| **9 accents seuls (9)** | **222 539** | **+64 o** |

**Renoncer à TOUTES les élisions coûte 64 octets** sur 222 Ko. Huffman se
rééquilibre : privé du jeton `l'`, il donne des codes plus courts à `l` et à
`'`, qui deviennent plus fréquents.

Côté largeur d'affichage, même verdict : sans cases d'élision, **10 lignes de
plus** dépassent 18 tuiles sur 24 113 (38 contre 28).

**Le besoin réel n'est donc pas de 18 cases, mais de 9** — les seuls accents
`à ê è ç î ô û â ù`.

---

## 6. Comment rejouer la mesure

```bash
python3 translation/outils/estimer_cout.py
```

Le module ne dit **rien** sur les cases de charmap disponibles — voir
[`DECISIONS.md`](DECISIONS.md) A1. Il suppose ce problème résolu pour isoler
la seule question de la compression.
