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
| 3 | `_AreYouABoyOrAreYouAGirlText` | **Êtes**-vous un gar- / çon ou une fille? | Tu es un garçon / ou une fille? |
| 4 | `NationalParkTeacher1Text` | **Être** maîtresse / d'école donne de / petites manies. | Le métier de / maîtresse donne de / petites manies. |
| 5 | `NationalParkTeacher1Text` | **Être** élève modèle / mérite un petit / quelque chose. | Un élève modèle / mérite un petit / quelque chose. |
| 6 | `YoungsterOwenSeenText` | **Être** honnête, ça / c'est chouette! | Jouer franc-jeu, / ça c'est chouette! |
| 7 | `TeacherColetteAfterBattleText` | **Être** professeur ça / laisse des traces. | Le métier de prof / laisse des traces. |
| 8 | `YoungsterMikeyAfterText` | **Être** un bon / dresseur n'est pas / donné à tout le monde. | **Devenir** un bon / dresseur n'est pas / donné à tout le monde. |
| 9 | `PsychicPhilAfterBattleText` | **Être** sûr de soi, / c'est important. | Il faut avoir / confiance en soi. |

### Notes de traduction

- **#3** passe du vouvoiement au tutoiement. L'anglais de PC est familier
  (*« Are you a boy? Or are you a girl? »*) et le hack modernise partout
  ailleurs — le tutoiement est cohérent avec D3. **À valider.**
- **#8** — « Devenir » se rapproche en réalité **davantage** de l'anglais que
  l'officiel : *« Becoming a good trainer is really tough. »* La contrainte
  technique améliore ici la traduction.
- **#4** perd « d'école » (« maîtresse d'école » → « maîtresse »), sans
  ambiguïté dans le contexte : la scène se passe dans une école.

---

## 2. Ce qui n'est PAS une reformulation

Pour mémoire, ne pas confondre avec :

- la **conversion de casse** (D3), qui est mécanique et systématique ;
- le **report de retouche** du hack sur le texte officiel (phase 3), qui suit
  le hack et non notre goût ;
- l'**espagnol de PILAR** privé de `í` et `ó` (D1), qui relève du charmap.
