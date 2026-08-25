# Reformulations assumées

Écarts délibérés au texte français officiel. Chacun a un **motif technique**
et non stylistique, et chacun est consigné pour qu'on ne le prenne pas plus
tard pour une erreur.

---

## 1. Éviter `Ê` en tête de phrase — décision D4

**Décidée par l'utilisateur le 2026-08-25.**

La casse mixte (décision D3) transforme « Etre » en « **Ê**tre ». Or le charmap
n'a que **4 cases** pour 5 capitales accentuées ([`CHARMAP.md`](CHARMAP.md)
§5 bis). Plutôt que de sacrifier une 5ᵉ case — `№` coûterait 17 lignes
d'interface —, on **reformule**.

⚠️ **Le compte annoncé d'abord était faux.** J'avais dit « 21 phrases » : ce
chiffre comptait des labels que mon lecteur fusionnait à tort
([`PIEGES.md`](PIEGES.md) #4 bis). Réel : **8 textes, 9 occurrences.**

Toutes les reformulations ci-dessous ont été **mesurées** : aucune ligne ne
dépasse 18 tuiles.

| # | Label | Officiel, en casse mixte | Reformulation |
|---|---|---|---|
| 1 | `ToddSaleText` | **Être** sur le toit, / c'est top. | Sur le toit, c'est / vraiment top. |
| 2 | `VanceNumberDeclinedText` | **Être** pote avec les / fans des oiseaux, / c'est bien… | Avoir un pote fan / des oiseaux, c'est / bien… |
| 3 | `_AreYouABoyOrAreYouAGirlText` | **Êtes**-vous un gar- / çon ou une fille? | **Vous êtes** un gar- / çon ou une fille? *(voir §1 bis)* |
| 4 | `NationalParkTeacher1Text` | **Être** maîtresse / d'école donne de / petites manies. | Le métier de / maîtresse donne de / petites manies. |
| 5 | `NationalParkTeacher1Text` | **Être** élève modèle / mérite un petit / quelque chose. | Un élève modèle / mérite un petit / quelque chose. |
| 6 | `YoungsterOwenSeenText` | **Être** honnête, ça / c'est chouette! | Jouer franc-jeu, / ça c'est chouette! |
| 7 | `TeacherColetteAfterBattleText` | **Être** professeur ça / laisse des traces. | Le métier de prof / laisse des traces. |
| 8 | `YoungsterMikeyAfterText` | **Être** un bon / dresseur n'est pas / donné à tout le monde. | **Devenir** un bon / dresseur n'est pas / donné à tout le monde. |
| 9 | `PsychicPhilAfterBattleText` | **Être** sûr de soi, / c'est important. | Il faut avoir / confiance en soi. |

### Notes de traduction

- **#3** — voir §1 bis : la solution retenue **conserve le texte officiel**.
- **#8** — « Devenir » se rapproche en réalité **davantage** de l'anglais que
  l'officiel : *« Becoming a good trainer is really tough. »* La contrainte
  technique améliore ici la traduction.
- **#4** perd « d'école » (« maîtresse d'école » → « maîtresse »), sans
  ambiguïté dans le contexte : la scène se passe dans une école.

---

## 1 bis. Le cas n°3 — et une anomalie de la VF officielle

**Question posée par l'utilisateur :** le vouvoiement de « Êtes-vous un garçon
ou une fille? » a-t-il une raison ? Peut-on écrire « Vous êtes… » ?

**Réponse : oui, et c'est la meilleure solution.** Inverser suffit à faire
passer le `ê` en **minuscule** — plus aucune capitale accentuée requise — et
les deux lignes tiennent :

```
   17 ✓ │Vous êtes un gar-│
   17 ✓ │çon ou une fille?│
```

Aucun mot n'est changé. Le registre est préservé. La contrainte technique
disparaît par simple inversion.

### Ce que la vérification a révélé

⚠️ **Le vouvoiement est une anomalie isolée du Cristal français.** Compté sur
toute l'introduction du Prof. Chen :

| | occurrences |
|---|---|
| « vous / votre / vos » | **1** — cette phrase, et elle seule |
| « tu / ton / ta / tes / toi » | **25** |

Deux répliques plus loin, le même personnage demande : « Heu... C'est quoi
**ton** nom? »

Ce n'est donc pas un registre voulu, mais un écart du traducteur d'époque — et
ce n'était pas une contrainte de place : « Es-tu un garçon » tient en 15 tuiles.

### Pourquoi on le garde quand même

**Le hack est la source, l'officiel est la référence.** Corriger une incohérence
de la VF officielle n'entre pas dans notre mandat, et les joueurs francophones
vivent avec depuis 2001. On préserve.

L'anomalie est consignée ici pour qu'on ne la reprenne pas plus tard pour une
faute de notre part.

---

## 2. Ce qui n'est PAS une reformulation

Pour mémoire, ne pas confondre avec :

- la **conversion de casse** (D3), qui est mécanique et systématique ;
- le **report de retouche** du hack sur le texte officiel (phase 3), qui suit
  le hack et non notre goût ;
- l'**espagnol de PILAR** privé de `í` et `ó` (D1), qui relève du charmap.
