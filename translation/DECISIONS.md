# Décisions

Deux tables : **prises** (avec le motif — le `git diff` dit déjà *quoi*) et
**à prendre** (avec ce qui bloque et ce qu'il faudrait mesurer pour trancher).

Une décision prise ne se re-débat pas sans écrire pourquoi on la rouvre.

---

## Prises

| # | Date | Décision | Motif |
|---|---|---|---|
| P1 | 2026-08-24 | **RGBDS 1.0.3** via Homebrew | PC exige ≥ 1.0.0. Sans compilation, la discipline « compile après chaque lot » est inapplicable et on traduirait à l'aveugle. |
| P2 | 2026-08-24 | **`pokecrystal-fr` retenu comme référence** | Son build reproduit `c055992b…`, le SHA1 déclaré. Une référence non vérifiée n'est pas une référence. |
| P3 | 2026-08-24 | **Ligne de base compilée avant toute modification** | Seul moyen de savoir plus tard ce que *nous* avons cassé. `9df8776ca`, 0,85 % libre. |
| P4 | 2026-08-24 | **Aucun chiffre de travail annoncé** avant le tri de la phase 1 | Le plafond brut (38 746 lignes) ment d'un facteur qui peut dépasser dix. |
| P5 | 2026-08-24 | **La retune Huffman/n-grammes passe en priorité 1** | 0,85 % de ROM libre, **et en baisse** : 1,29 % cent-cinq commits plus tôt. Ce n'est plus du polissage, c'est une condition de build. |
| P6 | 2026-08-24 | **Appariement par position autorisé *uniquement* pour les tables indexées** (noms de Pokémon, capacités, objets…) | Ces tables sont indexées par une constante : le rang **est** l'identifiant. Partout ailleurs — et pour toute ligne de texte — l'appariement se fait par label. Garde-fou : table refusée en bloc si les deux côtés n'ont pas le même nombre d'entrées. |
| P7 | 2026-08-24 | **`git ls-files` plutôt que `rglob`** pour lister les `.asm` | Compiler un dépôt y génère des `.asm` gitignorés. Voir [`PIEGES.md`](PIEGES.md) #1. |
| P14 | 2026-08-24 | **Exclure `mobile/`, `engine/debug/` et le mystery gift des corpus de mesure** | 2 208 caractères japonais y subsistent — le Mobile Adapter GB, jamais localisé. **Polished Crystal a supprimé ce dossier.** Les compter fausse tout décompte de caractères. |
| ~~P15~~ | 2026-08-24 | ~~Convertir 2 n-grammes en feuilles Huffman~~ **RÉTRACTÉE le jour même** | ❌ **L'idée était fausse.** Abaisser `FIRST_SHIFTED_LEAF_CHAR_ID` donne bien des **feuilles Huffman** supplémentaires, mais elles desservent les octets `$4b`–`$5c` — des octets de n-grammes et de contrôle, **qui n'ont pas de tuile de police**. Une lettre accentuée a besoin d'un octet AFFICHABLE, donc dans `$7f`–`$f0`. J'avais confondu « place dans l'arbre de compression » et « place dans la police ». Voir [`PIEGES.md`](PIEGES.md) #1 quater. |
| **D1** | 2026-08-24 | **PILAR garde son espagnol ; `í` et `ó` sont retirés** pour compléter les 9 cases | Décision **de l'utilisateur**, explicitement **réversible**. Coût : 2 mots d'espagnol perdent leur accent (`montón`→`monton`, `duraría`→`duraria`). `¡` `¿` `á` `é` préservés — l'espagnol reste immédiatement identifiable. Registre complet, options écartées et chemins de retour dans **[`CHARMAP.md`](CHARMAP.md) §4**. |
| **D2** | 2026-08-24 | **Normaliser l'accent de `é` sur celui de `á`** dans les 4 polices où PC les dessinait différemment | Décision **de l'utilisateur**. Pas cosmétique : mesuré, `è` et `ê` deviennent alors **identiques au pixel près** au Cristal français officiel, et `normal` passe de 4 à 6 glyphes sur 9 conformes à l'officiel. Seul glyphe préexistant du hack que l'on modifie. Détail : [`CHARMAP.md`](CHARMAP.md) §5. |
| **D4** | 2026-08-25 | **Reformuler les 9 phrases qui exigeraient `Ê`, plutôt que prendre une 5ᵉ case** | Décision **de l'utilisateur**. Une 5ᵉ case coûterait `№` (17 lignes d'interface à réécrire) ou l'espagnol de PILAR. Reformuler coûte 8 textes. Les 9 reformulations sont écrites et **mesurées** (aucune ligne > 18 tuiles) dans [`REFORMULATIONS.md`](REFORMULATIONS.md). ⚠️ J'avais annoncé « 21 phrases » : chiffre gonflé par un bug d'alias de mon lecteur. |
| **D3** | 2026-08-24 | **On MODERNISE : casse mixte, comme le hack** | Décision **de l'utilisateur**. La mesure demandée par le cahier est faite : PC modernise systématiquement (1 311 blocs ne diffèrent que par la casse). Précédent cité par l'utilisateur : *Pokémon Version Violette*, romhack de Rouge/Bleu de même esprit, a fait de même. ⚠️ **Conséquence ouverte** : la casse mixte exige des **capitales accentuées** (`Î` 60 occ., `Â` 11, `Ç` 1, plus les noms propres à vérifier) alors que le charmap est à marge zéro. → [`CONVENTIONS.md`](CONVENTIONS.md) §2 bis. |
| P19 | 2026-08-24 | **Normaliser la CASSE pour comparer, jamais pour écrire** | PC a converti l'ALL-CAPS vanilla en casse mixte. Sans normalisation, 1 311 blocs identiques passaient pour retouchés. Mais le français repris devra **suivre la casse de PC**, ce qui reste à construire. |
| P20 | 2026-08-24 | **Tout lecteur porte un contrôle de couverture** | Le premier perdait 28 % du texte sans rien signaler. Le contrôle a trouvé les quatre causes l'une après l'autre. |
| P17 | 2026-08-24 | **Conserver les codes Huffman existants en renommant les feuilles** | Régénérer l'arbre maintenant l'accorderait à un texte encore anglais. `make huffman` viendra après la traduction. |
| P18 | 2026-08-24 | **Composer les glyphes plutôt que les recopier du Cristal français** | PC a 8 polices de styles distincts ; un `è` vanilla dans `italic` ou `chicago` jurerait. Chaque glyphe naît des lettres de sa propre police. |
| P16 | 2026-08-24 | **Le budget de charmap a son propre registre** | Sujet le plus contesté du chantier, trois erreurs de ma part. [`CHARMAP.md`](CHARMAP.md) tient le compte case par case pour qu'on ne refasse jamais le raisonnement. |
| P11 | 2026-08-24 | **Tout caractère français ajouté recevra un `ctxtmap`, jamais un `charmap` simple** | Sans code Huffman, un accent fait échouer la compression de TOUT bloc le contenant : **+58 834 octets**, plus du triple de l'espace libre. Mesuré, pas supposé. |
| P12 | 2026-08-24 | **Refaire l'arbre de Huffman est urgent ; refaire les n-grammes ne l'est pas** | 94 % des octets passent par Huffman, 6 % par les n-grammes. Les scénarios B et C ne diffèrent que de 634 o sur 5 524 blocs. |
| P13 | 2026-08-24 | **Renoncer à `ï`** | 6 occurrences dans tout le Cristal français, et c'est le seul caractère que le plafond de 125 feuilles laisse sans code. Ramène le besoin de 19 à 18 cases. |
| P9 | 2026-08-24 | **Branche `fr` sur le `master` amont**, pas sur le tag `v3.2.3` ; `master` reste un miroir pur qu'on ne commite jamais | `v3.2.3` date du 11 déc. 2025 et 631 commits l'ont suivie, dont 211 touchant du texte. Une base figée ne supprime pas la fusion, elle la reporte en pire. Refusions fréquentes et petites. |
| P10 | 2026-08-24 | **`origin` = notre fork, `upstream` = Rangi** | Convention usuelle ; évite de pousser par mégarde vers l'amont. |
| P8 | 2026-08-24 | **Écrire `…` et non `...`**, en s'écartant sciemment de la VF officielle | PC emploie `…` exclusivement (2 304 contre 0) là où la VF officielle préfère `...` (1 356 contre 281). Deux motifs : la cohérence interne du jeu, et la place — `…` coûte 1 tuile, `...` en coûte 3, soit ~4 600 tuiles sur l'ensemble. Avec 1,29 % de ROM libre, ce n'est pas discutable. |

---

## À prendre

Rangées par ce qu'elles bloquent. **Ne rien trancher seul sur les décisions
éditoriales** (§10 du cahier de mission).

### Bloquent la technique

| # | Question | Ce qui manque pour trancher |
|---|---|---|
| A1 | ~~Combien de cases faut-il ?~~ | ✅ **Tranchée** : 9 nécessaires, 9 trouvées (7 sans arbitrage + `í` `ó` par D1). **Marge zéro.** Registre : [`CHARMAP.md`](CHARMAP.md). |
| A2 | ~~Le PNJ hispanophone PILAR~~ | ✅ **Tranchée par l'utilisateur** — voir D1. Réversible. |
| A3 | ~~Lesquelles des 8 polices affichent du dialogue ?~~ | ✅ **Tranchée : les 8.** `Options_Typeface` laisse le joueur en choisir une. 72 glyphes dessinés. |
| A4 | ~~**Le français tient-il dans la ROM ?**~~ | ✅ **Tranchée par la mesure** : oui, et il libère 12 à 21 Ko. Voir [`COMPRESSION.md`](COMPRESSION.md). |
| A6 | ~~D'où viennent les cases des 5 capitales accentuées ?~~ | ✅ **Tranchée** : 4 cases (`<SHARP>` + `♥` + `♪` + `'s`) pour `É Ç Î Â`, et `Ê` évité par reformulation (D4). PILAR intacte, aucune interface touchée. ✅ **Besoin établi** : `É Ç Î Â Ê` (noms propres vérifiés par l'utilisateur + 666/60/21/11 occurrences mesurées). ✅ **Solution trouvée sans toucher à PILAR** : `<SHARP>` + `♥` + `♪` + `'s` = 4 cases, couvrant `É Ç Î Â`. Reste `Ê` : une 5ᵉ case (`№`) ou reformuler 21 phrases. ⚠️ `'s` ne se libère qu'**après** la traduction. Détail : [`CHARMAP.md`](CHARMAP.md) §5 bis. **Choix final à l'utilisateur.** |
| A5 | **À quelle cadence refusionner l'amont ?** | Rangi produit ~105 commits par quinzaine et **consomme la place** : la marge est passée de 1,29 % à 0,85 % en 16 jours. Trop rare, la fusion devient ingérable ; trop fréquente, elle coûte à chaque fois. Non tranché. |

### Bloquent la rédaction

| # | Question | Ce qui manque pour trancher |
|---|---|---|
| B1 | **Le générique.** | Décision utilisateur. Sur le chantier jumeau : laissé en anglais, parce que la VF officielle laisse le sien tel quel et que traduire seulement la part du hack ferait changer de langue au milieu du rouleau. |
| B2 | **Les noms propres ajoutés par le hack** — lieux, personnages, fonctionnalités sans aucune source officielle. | Décision utilisateur, au cas par cas. §8.6 : **jamais de mémoire.** Vérifier sur Poképédia ou demander. |
| B3 | ~~Vocabulaire moderne ou d'époque ?~~ | ✅ **Tranchée — voir D3.** |
| ~~B3~~ | *(ancien libellé)* | ⚠️ **Mesure faite : le hack modernise systématiquement.** Il a converti tout l'ALL-CAPS vanilla en casse mixte (1 311 blocs). Le français devra suivre — donc `ECORCIA` devient `Écorcia`… mais la Gen 2 française n'accentue pas les capitales ([`CONVENTIONS.md`](CONVENTIONS.md) §2), et en casse mixte la question ne se pose plus pareil. **À trancher avec l'utilisateur.** |
| B4 | **Que faire des bugs trouvés en traduisant ?** | Règle posée par le cahier : **signalés, jamais corrigés d'office.** Reste à décider où on les consigne — un `BUGS.md` ici, ou des issues sur le fork. |

### Bloquent l'organisation

| # | Question | État |
|---|---|---|
| C1 | ~~Fork GitHub ?~~ | ✅ **Tranchée** : `MsieurPafi/polishedcrystal-fr`, branche `fr`. Voir P9 et P10. |
| C2 | **Où consigner les bugs du hack trouvés en traduisant ?** | Un `BUGS.md` ici, ou des issues sur le fork. Non tranché. |
