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
| A1 | **Quelles cases de charmap sacrifier ?** Il en faut 19, il n'y en a que 7 de libérables sans arbitrage. | Le coût réel en tuiles de chaque élision, mesuré **sur notre texte traduit**, pas sur le français officiel. Non calculable aujourd'hui. Pistes déjà chiffrées : renoncer à `y'` coûte 6 tuiles sur tout le jeu, `p'` 30 — quasi gratuit. Les 9 élisions principales économisent 2 713 tuiles : elles valent leur case. |
| A2 | **Le PNJ hispanophone de `maps/ShamoutiCoast.asm`** — seul utilisateur de `á í ó ¿ ¡`. Le franciser libérerait **5 cases**, exactement ce qui manque. | **Décision éditoriale de l'utilisateur.** C'est un effet de langue voulu par l'auteur du hack. On ne l'efface pas pour de la place sans son accord. |
| A3 | **Lesquelles des 8 polices affichent du dialogue ?** | Mesure non faite. Détermine combien de fois chaque glyphe français doit être dessiné. |
| A4 | **Le français tient-il dans la ROM ?** | L'estimation du §7 bis de l'état des lieux. **C'est le premier chiffre de la phase 2.** |
| A5 | **À quelle cadence refusionner l'amont ?** | Rangi produit ~105 commits par quinzaine et **consomme la place** : la marge est passée de 1,29 % à 0,85 % en 16 jours. Trop rare, la fusion devient ingérable ; trop fréquente, elle coûte à chaque fois. Non tranché. |

### Bloquent la rédaction

| # | Question | Ce qui manque pour trancher |
|---|---|---|
| B1 | **Le générique.** | Décision utilisateur. Sur le chantier jumeau : laissé en anglais, parce que la VF officielle laisse le sien tel quel et que traduire seulement la part du hack ferait changer de langue au milieu du rouleau. |
| B2 | **Les noms propres ajoutés par le hack** — lieux, personnages, fonctionnalités sans aucune source officielle. | Décision utilisateur, au cas par cas. §8.6 : **jamais de mémoire.** Vérifier sur Poképédia ou demander. |
| B3 | **Vocabulaire moderne ou d'époque ?** PC contient du contenu postérieur à la Gen 2. | Mesurer d'abord si le hack modernise déjà de lui-même. S'il le fait systématiquement, le suivre. |
| B4 | **Que faire des bugs trouvés en traduisant ?** | Règle posée par le cahier : **signalés, jamais corrigés d'office.** Reste à décider où on les consigne — un `BUGS.md` ici, ou des issues sur le fork. |

### Bloquent l'organisation

| # | Question | État |
|---|---|---|
| C1 | ~~Fork GitHub ?~~ | ✅ **Tranchée** : `MsieurPafi/polishedcrystal-fr`, branche `fr`. Voir P9 et P10. |
| C2 | **Où consigner les bugs du hack trouvés en traduisant ?** | Un `BUGS.md` ici, ou des issues sur le fork. Non tranché. |
