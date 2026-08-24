# Inventaire et triage — le décompte du travail

Premier chiffrage du chantier, obtenu **au critère exact**, jamais par
heuristique. Il a fallu trois outils et huit corrections avant d'y croire.

> ⚠️ **Ce document donne un MAJORANT, pas une liste de tâches.**
> L'accessibilité en jeu n'est pas mesurée (§5).

---

## 1. Le résultat

```
  catégorie              plafond   orphelins   RETENU
  ----------------------------------------------------
  applicable               3774          2       3772
  renommé                  1473        104       1369
  retouché                 1910          0       1910
  ambigu                    827        113        714
  propre au hack           7116        393       6723
  ----------------------------------------------------
  TOTAL                   15100        612      14488
```

| | blocs | ce que ça veut dire |
|---|---|---|
| **Travail mécanique** | **7 765** | le français officiel se reprend, avec plus ou moins d'adaptation |
| **Travail de rédaction** | **6 723** | contenu propre au hack, aucune source |
| Écartés (orphelins) | 612 | déclarés, cités par rien |

### Le détail des catégories

| Catégorie | Blocs | Critère |
|---|---|---|
| **applicable** | 3 772 | `PC == EN` et `FR != EN` — le français officiel se reprend **tel quel** |
| **renommé** | 1 369 | le hack a changé le nom du label, pas le texte — l'officiel s'applique |
| **retouché** | 1 910 | le hack a modifié le texte — reprendre l'officiel et **reporter la retouche** |
| **ambigu** | 714 | le texte existe en vanilla mais plusieurs labels le portent — récupérable **au cas par cas** |
| **confirmé** | 158 | `FR == EN` — le terme ne se traduit pas. **Ce n'est pas du travail.** |
| **propre au hack** | 6 723 | aucun équivalent vanilla — à rédiger |

### Où le travail se trouve

| Domaine | à rédiger | mécanique |
|---|---|---|
| cartes | 4 094 | 4 738 |
| moteur | 934 | 1 066 |
| **Pokédex** | **666** | 2 |
| textes communs | 281 | 747 |
| Pokématos | 66 | 730 |
| objets | 178 | 135 |
| talents | 160 | — |
| capacités | 81 | 176 |

⚠️ Le **Pokédex** est presque intégralement à rédiger (666 contre 2) : Polished
Crystal porte 289 espèces contre 251, et a réécrit les descriptions.

---

## 2. Les trois outils

| Outil | Ce qu'il garantit |
|---|---|
| `outils/lecteur.py` | `label -> texte` pour les trois dépôts. **Échoue bruyamment** sur une macro inconnue. Contrôle de couverture intégré. |
| `outils/inventaire.py` | Le décompte au critère exact, périmètre annoncé. |
| `outils/triage.py` | Sépare orphelins et travail réel, ventile par domaine. |

```bash
python3 translation/outils/inventaire.py
python3 translation/outils/triage.py
```

---

## 3. Le critère, et pourquoi il ne suffit pas seul

```
applicable  ⟺  PolishedCrystal == pokecrystal (EN)  ET  pokecrystal-fr != EN
```

Appariement **par label**, jamais par numéro de ligne.

⚠️ **Mais appliqué brut, ce critère sous-compte massivement.** Première
exécution : 1 447 applicables et 1 849 « retouchés par le hack ». Or **1 311 de
ces 1 849 ne différaient que par la CASSE** — Polished Crystal a converti
systématiquement l'ALL-CAPS du vanilla en casse mixte :

| vanilla | Polished Crystal |
|---|---|
| `LUCKY NUMBER SHOW!` | `Lucky Number Show!` |
| `PROF.ELM` | `Prof.Elm` |
| `#MON` | `#mon` |
| `FARFETCH'D` | `Farfetch'd` |

C'est le piège #10 du cahier — les différences de **notation** — à grande
échelle. Deux autres relevées : `<PLAY_G>` (vanilla) ↔ `<PLAYER>` (PC), 205
occurrences ; et `<……>`, une tuile vanilla valant « …… », écrite `……` par PC.

**Normaliser avant de comparer a fait passer les applicables de 1 447 à 2 950**,
puis à 3 772 une fois le lecteur complet.

⚠️ **La casse est ignorée pour COMPARER. Elle ne l'est pas pour ÉCRIRE :** le
français repris devra suivre la convention de casse mixte de PC. → décision B3.

---

## 4. Le lecteur — huit corrections avant d'y croire

Le lecteur porte un **contrôle de couverture** (`controle_couverture`) qui
compare les lignes de texte brutes du dépôt à ce qu'il a effectivement retenu.
Sans lui, rien de ce qui suit n'aurait été vu.

| # | Ce qui était perdu | Ampleur |
|---|---|---|
| 1 | **Labels locaux** `.BlancheIntro2Text:` — le motif exigeait une lettre en tête | **10 918 lignes** (28 % du hack) |
| 2 | **Texte en ligne** après `writethistext`, sans label | inclus dans le #1 |
| 3 | **Entrées du Pokédex** — chacune commence par `db "Seed@"`, pris pour une macro inconnue qui fermait le bloc | **1 667 lignes** |
| 4 | **Fichiers sans label** — chaque entrée du dex vanilla est incluse depuis un parent | 1 263 lignes |
| 5 | **`if DEF(FAITHFUL)` en COLONNE 0** — motif exigeant une indentation ; les deux branches se concaténaient en silence | 22 blocs |
| 6 | **Labels alias** — `StoneEdgeDescription` / `XScissorDescription` partagent un texte | 2 blocs |
| 7 | `setcharmap`, `assert`, `stop_compressing_text` — macros non répertoriées | 3 arrêts |
| 8 | Le **contrôle lui-même** était faux : il marquait le bloc entier « venu d'un `db` » au lieu de l'élément | −2 001 fantômes |

**Résultat final : 39 168 lignes vues sur 39 166 attendues** (+2, tracés :
des lignes portant deux littéraux, dans le générique et le débogage).

Le mode strict a servi trois fois. **Chaque « 0 » de ce chantier a été faux
jusqu'à preuve du contraire.**

---

## 5. Ce qui N'EST PAS mesuré

### L'accessibilité en jeu

⚠️ Le cahier demande de retirer le texte des **cartes que le joueur n'atteint
jamais**. Cette analyse de connectivité n'est pas faite. Les 14 488 blocs
retenus incluent donc peut-être du texte jamais affiché.

C'est ici que `polisheddex.app` serait utile — non pas pour ses données, qui
dérivent de la source qu'on possède, mais pour le **contexte de jeu**.

### La détection des symboles réappropriés

⚠️ Le critère exact protège du cas simple (le hack a changé le texte → on ne
remplace pas). Il ne protège **pas** du cas où le hack garde le texte anglais
mais change le **contexte** — un label de tuteur de capacités dont le texte a
glissé vers un voisin. → `PIEGES.md` #4.

---

## 6. Sur les 612 orphelins

Un label cité par aucun autre fichier. ⚠️ Deux pièges dans leur détection,
tous deux résolus :

- Les **blocs implicites** (texte en ligne) n'ont pas de nom : rien ne peut
  les citer. Les compter orphelins en ajoutait ~2 400 à tort.
- Les **labels locaux** sont cités par leur forme courte `.Enfant`, pas par
  leur nom qualifié `Parent.Enfant`. Sans un second index par fichier,
  **3 622 labels parfaitement référencés** passaient pour orphelins — 86 % du
  total annoncé.

`triage.py` porte un **contrôle du détecteur** sur cas fabriqué : un label
inventé doit compter 0, un label témoin doit compter plus de 1.
