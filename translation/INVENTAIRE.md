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
  applicable               3235          1       3234
  renommé                  1317          0       1317
  retouché                  436          0        436
  ambigu                    140          0        140
  propre au hack           4404         65       4339
  ----------------------------------------------------
  TOTAL                    9532         66       9466
```

| | blocs | ce que ça veut dire |
|---|---|---|
| **Travail mécanique** | **5 127** | le français officiel se reprend, avec plus ou moins d'adaptation |
| **Travail de rédaction** | **4 339** | contenu propre au hack, aucune source |
| Écartés (orphelins) | 66 | déclarés, cités par rien |

### Le détail des catégories

| Catégorie | Blocs | Critère |
|---|---|---|
| **applicable** | 3 234 | `PC == EN` et `FR != EN` — le français officiel se reprend **tel quel** |
| **renommé** | 1 317 | le hack a changé le nom du label, pas le texte — l'officiel s'applique |
| **retouché** | 436 | le hack a modifié le texte — reprendre l'officiel et **reporter la retouche** |
| **ambigu** | 140 | le texte existe en vanilla mais plusieurs labels le portent — récupérable **au cas par cas** |
| **confirmé** | 103 | `FR == EN` — le terme ne se traduit pas. **Ce n'est pas du travail.** |
| **propre au hack** | 4 339 | aucun équivalent vanilla — à rédiger |

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

⚠️ **Correction du 2026-08-24.** J'avais annoncé le Pokédex « presque
intégralement à rédiger, 666 contre 2 ». **C'était mon lecteur, pas le hack.**

Chaque entrée du Pokédex vanilla commence par deux `db` — la catégorie de
l'espèce puis la première ligne de description — avant le moindre `next`. Le
lecteur les laissait tomber, la description vanilla ressortait amputée, et ne
correspondait donc plus à celle de PC.

Réel : **215 des 334 entrées** du Pokédex de PC reprennent le texte vanilla à
la casse près ; **119** sont propres au hack — les espèces qu'il ajoute
(289 contre 251) et quelques réécritures.

Exemple, Héricendre : PC est **identique** au vanilla, à la casse (`FIRE MOUSE`
→ `Fire Mouse`) et à la macro (`db` → `text`) près.

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

## 5 bis. ⚠️ Chiffres corrigés le 2026-08-25

Les totaux publiés le 24 août étaient **gonflés de moitié** par un bug d'alias :
mon lecteur fusionnait des labels qu'une commande de script séparait pourtant,
et le même texte se retrouvait attribué jusqu'à douze fois
([`PIEGES.md`](PIEGES.md) #4 bis).

| | annoncé le 24 | réel |
|---|---|---|
| travail mécanique | 8 087 | **5 127** |
| travail de rédaction | 6 113 | **4 339** |
| orphelins | 612 | **66** |

Le contrôle de couverture ne pouvait pas le détecter : aucune ligne n'était
perdue, elles étaient seulement comptées plusieurs fois. **Un contrôle qui
vérifie qu'on ne perd rien ne vérifie pas qu'on ne duplique pas.**

---

## 6. Sur les 66 orphelins

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
