# Journal de chantier

Chronologique, du plus récent au plus ancien. Une entrée par séance.
On y écrit **ce qui a été fait, ce qui a été mesuré, et ce qui a raté**.
Les décisions vont dans [`DECISIONS.md`](DECISIONS.md), les pièges dans
[`PIEGES.md`](PIEGES.md) — ici, c'est le fil du temps.

---

## 2026-08-24 — Jour 1, quatrième séance : le français EXISTE dans la ROM

**La ROM se construit avec les 9 accents français, et une première chaîne
traduite en ressort à l'identique.** Détail dans [`CHARMAP.md`](CHARMAP.md) §5.

**Fait**

- 9 caractères installés dans les cases libérées, **codes Huffman conservés** :
  seul le libellé des feuilles change, l'arbre garde sa forme.
- `outils/glyphes_fr.py` : **72 glyphes** dessinés — 9 accents × **8 polices**,
  composés depuis les lettres de chaque police pour rester dans son style.
- Clavier de saisie, `utils/ngram.py`, tables à largeur fixe : mis à jour.
- Décision D1 appliquée au texte de PILAR.
- **Première chaîne traduite** au critère exact : `_FruitBearingTreeText`.

**Trouvé**

- ⚠️ **Les 8 polices affichent toutes du dialogue** : `Options_Typeface` laisse
  le joueur en choisir une. Ce n'était pas une police à alimenter, mais huit.
  → question A3 tranchée.
- ⚠️ **Le clavier de saisie employait les contractions supprimées**
  (`rawchar "é'd'l'm'r's't'v0"`). C'est le piège #7 du cahier — celui qui avait
  le plus coûté sur le chantier jumeau. Attrapé avant la compilation, en
  cherchant systématiquement toutes les références aux jetons retirés.
- ⚠️ **Zéro majuscule accentuée ET zéro ligature** dans le corpus français
  (`À Â Ç È Ê Ë Î Ï Ô Ù Û É Œ Æ` = 0 chacune). Le cahier prévoyait de garder
  `Ç`, `Œ`, `À` et `Ù` ; la Gen 2 n'en fait rien et écrit ` A `, ` LA `,
  `CA `, `OU?`. → [`CONVENTIONS.md`](CONVENTIONS.md) §2 corrigée.

**Raté, et corrigé**

- **PIL réécrivait les polices en 8 bits** là où les originaux sont en 2 bits :
  +50 % de taille et un en-tête PNG différent. J'ai écrit l'encodeur à la main,
  **validé en réécrivant un fichier inchangé** — il doit ressortir identique
  octet pour octet. Quatre témoins passent.
- **Le circonflexe de `î` sortait décalé.** J'isolais l'accent en soustrayant la
  lettre de base ; pour `i`, le point se soustrayait de l'accent et faussait
  l'emprise. L'accent se lit simplement aux lignes 0-1.
- **Deux `assert` ont sauté à la compilation** — `PokemonNames` et
  `WonderTradeOTNames2`. `Farfetch'd`, `Sirfetch'd` et `Li'l D` débordaient
  leur champ à largeur fixe. C'est le contrôle qui a fait son travail.

**Vérifié dans la ROM, pas dans la source**

Glyphes présents, nouvelle rangée de clavier présente, ancienne disparue,
contrôle positif OK. Puis `_FruitBearingTreeText` **redécodé depuis le
binaire** :

```
"C'est " en clair → <CTXT> → "un arbre à<LINE>fruits.<DONE>" comprimé
```

Reconstruit identique à la source. L'accent traverse tout.

**Espace libre** : 17 794 → **14 782** (−3 012). C'est le texte **encore
anglais** qui paie : `'d 'l 'm 'r 't 'v` coûtent 2 octets au lieu d'un, sur
3 251 occurrences. Ce coût s'efface à mesure que le texte devient français.

**Prochaine séance**

1. Lecteur `.asm` générique, `inventaire`, `triage` — le vrai décompte.
2. Phase 2 : appliquer le critère exact en masse.
3. `make huffman` **après** la traduction, pas avant.

---

## 2026-08-24 — Jour 1, troisième séance : le budget de charmap

**Décision D1 de l'utilisateur : PILAR garde son espagnol**, au prix de `í` et
`ó`. Explicitement réversible → [`CHARMAP.md`](CHARMAP.md) §4.

**Fait** — [`CHARMAP.md`](CHARMAP.md), registre case par case du budget.

**Le besoin recompté, deux fois**

| | |
|---|---|
| annoncé d'abord | 18 cases (9 accents + 9 élisions) |
| après mesure des élisions (**+64 o**, 10 débordements sur 24 113) | **9 cases** |
| libérables sans arbitrage | 7 (6 contractions + `É`) |
| **déficit** | **2** → comblé par D1 |
| **marge restante** | **zéro** |

**Raté, et rétracté le jour même**

- **J'ai annoncé 2 cases gratuites, il n'y en avait aucune.** J'avais confondu
  **feuille Huffman** et **tuile de police** : les 4 feuilles libres `$fc`–`$ff`
  desservent des octets sans glyphe. L'arithmétique était juste, les `assert`
  passaient, le décodeur est bien paramétré — trois contrôles corrects sur la
  mauvaise question. → [`PIEGES.md`](PIEGES.md) #1 quater, décision P15 rétractée.
- **`'s` n'est pas une contraction anglaise résiduelle** : le français l'emploie
  66 fois, pour « J'suis ». Il ne fallait pas le libérer.

**Prochaine séance**

1. Quelles polices affichent du dialogue (A3), avant de dessiner 9 glyphes ×N.
2. Appliquer le nouveau charmap, régénérer Huffman, **compiler**.
3. Lecteur `.asm` générique, `inventaire`, `triage`.

---

## 2026-08-24 — Jour 1, seconde séance : le coût du français

**La question tranchée : le texte français tient-il dans la ROM ? → OUI.**
Rapport complet dans [`COMPRESSION.md`](COMPRESSION.md).

**Fait**

- `outils/encodage.py` : simulateur de la machine à états de
  `macros/scripts/text.asm`, **validé contre la ROM compilée** — 84,8 % de
  prédictions exactes, **écart agrégé −0,16 %** sur 10 013 octets, plus trois
  contrôles positifs sur cas fabriqués.
- `outils/estimer_cout.py` : quatre scénarios sur un corpus **apparié par
  label** de 5 524 blocs EN/FR.

**Mesuré**

| | |
|---|---|
| Part des octets passant par Huffman | **94 %** (n-grammes : 6 %) |
| Blocs qui se compriment | 97 % |
| Texte de PC, tables actuelles | 360 942 o |
| FR, tout refait (scénario C) | **−21 296 o** ✅ |
| FR, Huffman refait seul (B) | −20 339 o ✅ |
| FR, **accents sans code Huffman** (A) | **+58 834 o** ❌ dépasse de 41 Ko |
| Marge de verbosité avant débordement | **+8,7 % à +11,5 %** |
| Plafond de jetons compressibles | **125**, tous occupés |

**Trouvé**

1. **Le levier est le Huffman, pas les n-grammes.** Contre-intuitif : les
   n-grammes occupent 67 cases mais ne servent qu'au début de chaque bloc,
   avant l'enclenchement de la compression (~1,6 o par bloc).
2. **n-grammes et Huffman s'excluent** — dès que la compression démarre, le
   charmap bascule sur `compressing`, qui n'a pas de n-grammes.
3. **Le piège à 59 Ko** : un accent déclaré en `charmap` au lieu de `ctxtmap`
   fait échouer la compression de **tout bloc le contenant**. → décision P11.
4. **Précédent officiel pour PILAR** : la VF de Cristal traite le grouillot
   hispanisant de la Route 24 en **français cassé**, pas en langue étrangère.
   → [`GLOSSAIRE.md`](GLOSSAIRE.md) §5, trois options soumises à l'utilisateur.

**Raté, et corrigé**

- **Le simulateur a d'abord annoncé 57,6 % d'exactitude**, avec des écarts
  systématiquement négatifs de −3 octets. Cause : mon lecteur de blocs ignorait
  les **huit macros de coupure** (`text_ram`, `text_decimal`, `text_far`…).
  Piège #2 dans sa forme la plus classique. Corrigé → 84,8 %.
- **J'ai failli publier un gain surestimé.** Mes tables françaises sont
  calculées sur le corpus qu'elles encodent, pas celles de PC : biais en faveur
  du français. Contrôlé en régénérant aussi les tables **anglaises** par la
  même méthode — **2,5 points du gain venaient de la méthode**, pas de la
  langue. Le gain propre au français est 0,965 ×, pas 0,941 ×.
- **Arithmétique du charmap fausse, donnée à l'utilisateur.** J'avais dit que
  libérer les 5 cases espagnoles comblerait le manque. Faux : il faut 18 cases,
  on en libère 12 au mieux. **Il en manque 6.** → décision A1 corrigée.

**Sur `polisheddex.app`**

Fan-made (par « Cammy »), explicitement non affilié à Rangi42. Ses données sont
**dérivées de la source qu'on possède déjà**, donc sans autorité supplémentaire
pour la traduction. Utilité réelle et non redondante : le **contexte de jeu** —
quelles cartes le joueur atteint, quel PNJ se trouve où — c'est-à-dire l'outil
`accessibilité` du cahier, pénible à dériver de la source seule.

**Prochaine séance**

1. Résoudre le déficit de 6 cases de charmap (A1) — piste : déplacer des
   caractères compressibles rares vers la zone non compressible `$ec-$ff`.
2. Lecteur `.asm` générique, `inventaire`, `triage`.
3. **Aucun chiffre de travail annoncé avant le tri.**

---

## 2026-08-24 — Jour 1 : reconnaissance

**Fait**

- Cahier de mission lu en entier, et **ses chiffres recontrôlés** plutôt que
  crus : 2463/2463 `.asm`, charmap 371 EN / 391 FR, 26 ajoutés / 6 retirés /
  2 déplacés, appariement par label exact. Tout tient.
- RGBDS **1.0.3** installée (Homebrew). PC exige ≥ 1.0.0.
- `pokecrystal-fr` compilé → SHA1 `c055992b16b7399c687647725cdd1f4f13a2f75c`,
  **identique** à son `roms.sha1`. La référence française est prouvée.
  *(§11 étape 3 du cahier — faite.)*
- Fork `MsieurPafi/polishedcrystal-fr` configuré : `origin` = le fork,
  `upstream` = Rangi. Branche de travail **`fr`**, basée sur le `master` amont
  réel (`9df8776ca`, 23 août) — notre clone initial avait **105 commits de
  retard**, dont 67 touchant du texte.
- `polishedcrystal` compilé tel quel sur cette base : ligne de base établie.
- `outils/chemins.py` écrit et testé.
- `outils/extraire_glossaire.py` écrit : **994 entrées** officielles EN→FR.
- Dossier `translation/` monté : `README`, `ETAT_DES_LIEUX`, `JOURNAL`,
  `DECISIONS`, `GLOSSAIRE`, `PIEGES`, `CONVENTIONS`, plus `outils/` et
  `donnees/`.

**Mesuré**

| Grandeur | Valeur |
|---|---|
| Espace libre dans la ROM (`9df8776ca`) | **17 794 / 2 097 152 octets — 0,85 %** |
| …au commit précédent (`20a367242`, 105 commits plus tôt) | 26 989 — **la marge se réduit** |
| Lignes de texte PC / EN vanilla / FR officiel | 38 759 / 24 364 / 24 113 |
| Caractères de texte, idem | 530 527 / 331 449 / 311 032 |
| Ratio FR/EN en caractères | **0,938** — le français officiel est plus *court* |
| Cases de charmap libres dans PC | **0 sur 256** |
| Cases nécessaires au français | 19 (10 accentuées + 9 élisions utiles) |
| Cases libérables sans arbitrage éditorial | 7 |
| Polices à alimenter en glyphes | **8**, 114 tuiles chacune |
| Capitales accentuées dans la VF officielle | **0 sur 44 945** |
| Espace avant `!` dans la VF officielle | **0 sur 3 818** |
| Guillemets `«` `»` dans la VF officielle | **0** |
| Ellipse : `…` / `...` dans PC | **2 305 / 0** — contre 281 / 1 356 côté VF |
| Largeur max : dialogue / Pokédex / talents / générique | **18 / 19 / 19 / 20** |
| Entrées de glossaire officiel extraites | **994**, dont 195 identiques |

**Trouvé, et absent du cahier**

1. **PC compresse son texte** — arbre de Huffman + 67 n-grammes anglais, le tout
   dans `constants/charmap.asm`, appliqué par des macros RGBDS à l'assemblage.
   Aucun outil externe. Les générateurs `utils/huffman.py` et `utils/ngram.py`
   calculent les tables ; c'est tout ce qu'ils font.
2. **0,85 % de ROM libre, et en baisse** (1,29 % cent-cinq commits plus tôt).
   Retuner la compression n'est pas une optimisation : c'est une condition de
   build. → priorité 1.
3. **Le charmap est plein** — zéro case libre sur 256.
4. **Huit polices**, pas une.
5. **La largeur de ligne dépend du contexte** — 18 dans la boîte de dialogue
   (structurel : `TEXTBOX_INNERW`), mais **19** pour le Pokédex et les talents,
   **20** pour le générique. Le cahier annonce 18 partout.

**Raté, et corrigé**

- **J'ai écrit une fausse conclusion et je l'ai répétée.** J'avais annoncé
  « 0 ligne > 18 dans PC » après avoir expliqué les lignes à 19-20 comme des
  terminateurs `@`, sur la foi d'**un seul** exemple. En dépouillant
  correctement, 8 lignes dépassent — et ce ne sont pas des accidents, mais un
  contexte d'affichage différent. → [`PIEGES.md`](PIEGES.md) #2 bis.
- `chemins.py` a d'abord annoncé `pokecrystal 2463 ≠ pokecrystal-fr 3017`.
  Le contrôle avait raison de sonner, mais **le fautif était l'outil** : son
  `rglob` comptait les `.asm` générés par la compilation que je venais de
  lancer. Corrigé en passant par `git ls-files`. → [`PIEGES.md`](PIEGES.md) #1.

**Corrige le cahier sur**

- §1 « volume de texte bien plus faible » → **faux**, PC a +59 % de lignes que
  le vanilla (38 759 contre 24 364).
- §5.1 « la limite est de 18 tuiles, dure, sans une seule exception » → vrai
  pour le dialogue, **faux pour le Pokédex, les talents et le générique**.

**Conventions mesurées, pas supposées** → [`CONVENTIONS.md`](CONVENTIONS.md)

- Aucune capitale accentuée : **0 sur 44 945**. La règle du §5.4 est absolue.
- **Pas d'espace avant `!` `?` `:`** — contre-intuitif en français, mais c'est
  l'usage des jeux Pokémon, et il est net. Les 3 « exceptions » relevées sont
  des faux positifs (`Mon nom est ???.`, un `:` isolé).
- **Aucun guillemet** `«` `»` `“` `”` dans toute la VF officielle.
- **Conflit arbitré** : l'ellipse. PC écrit `…` exclusivement, la VF officielle
  préfère `...`. On suit PC — cohérence, et surtout 1 tuile contre 3 avec
  1,29 % de ROM libre. → décision P8.

**Prochaine séance**

1. Estimer le coût en octets du français sous les tables anglaises (§7 bis de
   l'état des lieux). C'est le chiffre qui décide de la faisabilité.
2. Lecteur `.asm` — `label -> texte`, testé sur un fichier compté à la main.
3. `inventaire` puis `triage`. **Aucun chiffre de travail annoncé avant.**
