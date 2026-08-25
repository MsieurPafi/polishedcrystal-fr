# Pièges, échecs et contournements

Tout ce qui a coûté une erreur — ici, ou sur le chantier jumeau (la traduction
française de *Pokémon Heart & Soul*, dont vient le cahier de mission).

**Format :** ce qui s'est passé → pourquoi c'est arrivé → le contournement.

> *Un contrôle qui ne voit pas est plus dangereux qu'un contrôle qui se trompe
> bruyamment.*

---

## Rencontrés sur CE chantier

### #1 — `rglob` compte les `.asm` générés par la compilation

**2026-08-24.** Le contrôle de santé de `chemins.py` a annoncé
`pokecrystal 2463 ≠ pokecrystal-fr 3017` et refusé de valider l'atelier.

Le contrôle avait raison de sonner ; **le fautif était l'outil**. Je venais de
compiler `pokecrystal-fr`, ce qui y avait généré ~554 `.asm` (les `bitmask.asm`
des animations Pokémon, entre autres). Ils sont gitignorés, donc invisibles à
`git status` — mais bien présents sur le disque, et `rglob` les comptait.

**Contournement :** `git ls-files "*.asm"` au lieu de `rglob`. Seuls les
fichiers versionnés comptent. Repli sur `rglob` si git est indisponible, **avec
un avertissement explicite** que le compte peut être faux.

**La leçon :** le premier réflexe devant un contrôle qui sonne doit être de
douter du contrôle. Ici ça a marché dans le bon sens — mais la même
distraction, avec un contrôle qui aurait annoncé « 0 différence », serait
passée inaperçue.

### #2 bis — J'ai expliqué un écart au lieu de le vérifier

**2026-08-24.** J'ai mesuré les largeurs de ligne de Polished Crystal, vu un
paquet de lignes à 19 et 20 tuiles, regardé **un** exemple qui finissait par `@`,
conclu « ce sont des terminateurs » et écrit dans `CONVENTIONS.md` que PC ne
dépassait jamais 18. Puis je l'ai répété à l'utilisateur.

C'était faux. En dépouillant correctement `@` et `{d:}`, **8 lignes dépassent**,
et elles ne sont pas des accidents : les entrées du Pokédex et les descriptions
de talents tiennent **19 tuiles** parce qu'elles ne passent pas par la boîte de
dialogue. La largeur dépend du **contexte**, pas du jeu.

**Ce qui a raté :** j'ai généralisé depuis un seul échantillon d'une catégorie,
au lieu d'énumérer les cas qui la composaient. C'est le piège #2 dans l'autre
sens — non pas un motif trop strict qui rend « 0 », mais une explication trop
commode qui *fabrique* un « 0 ».

**Contournement :** quand un contrôle range des cas dans une catégorie
d'exceptions, **lister toutes les exceptions et les regarder une par une**.
S'il y en a trop pour ça, c'est que ce ne sont pas des exceptions.

---

---

### #1 bis — Une mesure qui se compare à elle-même

**2026-08-24.** Pour estimer le coût du français, j'ai régénéré des tables de
compression **à partir du corpus français**, puis mesuré ce corpus avec elles.
Résultat : 0,941 × — le français semblait 6 % moins cher que l'anglais.

Sauf que l'anglais, lui, était mesuré avec les tables **de Rangi**, calibrées
sur un texte voisin mais pas identique. Je comparais une table sur mesure à une
table de confection, et j'attribuais l'écart à la langue.

**Contrôle :** régénérer aussi les tables **anglaises** par la même méthode.
Elles donnent 0,975 × — **2,5 points du « gain du français » venaient de ma
méthode.** Le gain réel est 0,965 ×.

**La leçon :** quand on compare deux choses, vérifier qu'on ne leur applique
pas deux traitements différents. Un gain mesuré doit survivre au contrôle où
l'on donne au témoin le même avantage qu'au sujet.

---

### #12 bis — J'ai remplacé un terme officiel par un mot inventé

**2026-08-25.** Butant sur un `ï` sans case de charmap, j'ai rendu « CAID » par
« **Cadre** » — en le présentant comme « mot français courant pour ce rang »,
et en demandant confirmation. L'utilisateur a répondu que **« Caïd » est le
terme officiel** d'Or/Argent/Cristal : « Caïd Rocket ».

C'est le piège #12 dans sa forme la plus exacte : *ne jamais inscrire un nom
propre de mémoire*. J'avais même écrit « à confirmer sur Poképédia » — mais
j'ai livré le mot inventé en attendant, au lieu de m'arrêter.

⚠️ **Et je n'avais pas mesuré son importance** : `CAID` n'est pas un mot de
dialogue isolé, c'est le **nom du dresseur** dans `data/trainers/parties.asm`,
affiché à chaque combat contre un cadre Rocket.

**Contournement :** trouver la case. `<SHARP>` ne servait qu'au lecteur de
musique ; ses dièses sont devenus des `+`. → [`CHARMAP.md`](CHARMAP.md) §5 ter.

**La leçon :** quand une contrainte technique force à s'écarter d'un terme
officiel, **le bon réflexe est de rouvrir la contrainte**, pas d'inventer un
substitut. Il restait une case ; je ne l'avais pas cherchée parce que j'avais
classé `ï` comme abandonné trois jours plus tôt.

### #7 bis — Les mots coupés en fin de ligne, convertis en deux moitiés

**2026-08-25.** L'utilisateur a relu la liste des formes à accentuer et signalé
des mots qui n'existent pas : `EME`, `ARE`, `CHAM`, `DREE`, `CLABLE`,
`CARNIVOREA`. Il avait raison de tiquer.

Le Cristal français **coupe ses mots en fin de ligne** :

```asm
	text "CHAMPION de l'ARE-"
	line "NE de JADIELLE."
```

Mon convertisseur traitait chaque ligne isolément : `ARE-` et `NE` devenaient
deux mots distincts, chacun recevant une capitale initiale. Le texte appliqué
disait **« cette Tour Cen- / Dree... »** au lieu de « Cen- / drée... » —
capitale fautive ET accent perdu, puisque le corpus ne connaît « cendrée »
que sous sa forme entière.

**Contournement :** avant de convertir, **recoller** le mot à travers le saut
de ligne, convertir le mot entier, puis le recouper au même endroit. Sûr
parce que la conversion préserve le nombre de caractères — restituer un accent
ou changer une casse ne change pas la longueur. Si elle change quand même, le
bloc est refusé plutôt qu'écrit faux.

Le recollage franchit aussi un `para`, car la coupure peut enjamber un
changement de paragraphe (`Piste Cy-` / … / `clable`).

**La leçon :** une relecture humaine a vu en quelques minutes ce qu'aucun de
mes contrôles ne cherchait. Mes garde-fous vérifiaient la largeur et
l'encodabilité — pas la **vraisemblance des mots produits**.

### #7 ter — Le `db` de catégorie collé à la description

Même relecture, mêmes symptômes, autre cause : `Champignonl`, `Gazi`,
`Minoiseaui`, `LEZARDS'`. Chaque entrée du Pokédex commence par sa catégorie
d'espèce en `db`, immédiatement suivie de la description :

```asm
	db "LEZARD@"
	text "S'il est en bonne"
```

Le lecteur concatène sans séparateur et le `@` disparaît : `LEZARD` + `S'il`
donne `LEZARDS'il`. Purement cosmétique — cela ne pollue que la liste des mots
à vérifier, jamais le texte écrit, qui est traité ligne par ligne. Mais ça
fabriquait de faux mots dans un fichier soumis à un humain, ce qui lui a coûté
du temps.

### #1 ter — Un script lancé du mauvais dossier, qui rend « 0 » en silence

**2026-08-24.** Un décompte de caractères manquants a répondu
**« 0 caractère à créer »**. Le script tournait depuis `polishedcrystal/`, donc
`git -C pokecrystal-fr ls-files` échouait — et `subprocess` rendait une chaîne
vide sans que rien ne proteste. Zéro fichier, zéro caractère, zéro alerte.

**Contournement :** tout appel qui doit rendre des fichiers **vérifie son
propre résultat** et sort en erreur s'il est vide. Et chaque décompte affiche
un **contrôle d'ordre de grandeur** (« lignes lues : 24 119 — doit être
~24 000 ») pour qu'un effondrement se voie.

**La leçon, encore :** un « 0 » n'est jamais une bonne nouvelle tant qu'il
n'est pas prouvé. Celui-ci a été repéré parce qu'il contredisait une mesure
antérieure — pas parce que l'outil s'en est plaint.

### #9 bis — Du japonais bien vivant dans la source, bien mort dans le jeu

**2026-08-24.** Un relevé des caractères non-ASCII du Cristal français a sorti
**116 caractères à créer**, dont des dizaines de kana. Ils sont réellement dans
des macros `text`, pas dans des commentaires.

Ils viennent du **Mobile Adapter GB** (`mobile/`, 2 208 caractères) — la
fonctionnalité japonaise jamais localisée, morte dans les ROM occidentales.
**Et Polished Crystal a supprimé ce dossier entièrement.**

C'est le piège #9 en grandeur nature : une chaîne présente dans la VF n'est ni
affichée, ni pertinente. Le décompte réel, corpus vivant, est de **12**
caractères — dont 9 seulement comptent.

**Contournement :** tout corpus de mesure exclut `mobile/`, `engine/debug/` et
le mystery gift. → décision P14.

---

### #1 quater — Deux ressources distinctes, prises pour une seule

**2026-08-24.** J'ai annoncé à l'utilisateur qu'il restait de la place « à
récupérer » pour les accents français : 4 feuilles Huffman `$fc`–`$ff` sont
inutilisées, et abaisser `FIRST_SHIFTED_LEAF_CHAR_ID` les rend accessibles.
L'arithmétique était juste, les `assert` passaient, le décodeur est bien
paramétré. **Et l'idée était sans objet.**

Un caractère de Polished Crystal a besoin de **deux** ressources indépendantes :

| Ressource | Plage | Ce qu'elle donne |
|---|---|---|
| une **tuile de police** | octets `$7f`–`$f0` | le glyphe s'affiche |
| une **feuille Huffman** | octets `$7f`–`$eb` et `$4d`–`$5c` | le caractère se comprime |

Les feuilles que je voulais récupérer desservent `$4b`–`$5c` : des octets de
n-grammes et de contrôle, **qui n'ont aucune tuile**. Elles ne peuvent donc pas
loger un `à`. J'avais raisonné sur la ressource abondante en croyant traiter la
ressource rare.

**La leçon :** quand une contrainte se lève trop facilement, vérifier qu'on
parle bien de la même contrainte. J'ai passé le contrôle arithmétique, celui
des `assert` et celui du décodeur — trois contrôles justes sur la mauvaise
question.

---

### #2 quater — Le lecteur perdait 28 % du texte, sans rien dire

**2026-08-24.** Le premier lecteur `.asm` semblait fonctionner : il tournait,
sortait des milliers de blocs, et le mode strict ne protestait pas. Il perdait
**10 918 lignes sur 39 166**.

Quatre causes, toutes de la même famille — un motif d'analyse trop étroit :

| Ce qui échappait | Pourquoi | Ampleur |
|---|---|---|
| labels **locaux** `.BlancheIntro2Text:` | le motif exigeait une lettre en tête | 10 918 lignes |
| texte **en ligne** après `writethistext` | aucun label pour le porter | (inclus) |
| entrées du **Pokédex** | commencent par `db "Seed@"`, pris pour une macro inconnue qui fermait le bloc | 1 667 |
| `if DEF(FAITHFUL)` en **colonne 0** | le motif exigeait une indentation | 22 blocs |

Ce dernier est **littéralement** l'exemple du cahier : « un motif exigeant
exactement un espace avant `=` → 285 chaînes invisibles ».

**Le contournement, et il est structurel :** un **contrôle de couverture**.
`lecteur.controle_couverture()` compte d'un côté les lignes brutes portant une
macro de texte, de l'autre ce que le lecteur a retenu, et signale l'écart
fichier par fichier. C'est lui qui a trouvé les quatre causes, l'une après
l'autre. Sans lui, l'inventaire aurait annoncé un chiffre faux d'un tiers avec
le même aplomb.

⚠️ **Et le contrôle lui-même était faux au premier essai** : il marquait le
bloc entier « venu d'un `db` » au lieu de l'élément, et inventait 2 001 lignes
manquantes qui n'existaient pas. Un contrôle se contrôle aussi.

### #2 quinquies — Le contrôle de couverture avait un angle mort

**2026-08-24.** Après huit corrections, le lecteur affichait 39 168 lignes vues
sur 39 166 attendues. J'ai cru la couverture complète. Elle ne l'était pas.

Le contrôle dénombre les lignes portant une **macro de texte** (`text`, `line`,
`next`…). Il ne compte **pas** les `db "..."`. Or chaque entrée du Pokédex
vanilla commence par deux `db` avant son premier `next` :

```asm
	db "FIRE MOUSE@"      ; la catégorie de l'espèce
	db "The fire that"    ; la 1re ligne de description
	next "spouts from its"
```

Le lecteur laissait tomber les deux, la description ressortait amputée, et les
251 entrées vanilla ne correspondaient plus à celles de PC. J'en ai conclu que
le hack avait « réécrit le Pokédex » — et je l'ai annoncé à l'utilisateur.

C'est **sa demande d'un exemple concret** (Héricendre) qui a révélé l'erreur :
les deux textes étaient identiques à la casse près.

**La leçon :** un contrôle vert ne prouve que ce qu'il mesure. Celui-ci
mesurait les lignes de macros et rien d'autre ; il ne pouvait pas voir un
manque situé hors de son périmètre. **Quand un résultat surprend — « le hack a
réécrit tout le Pokédex » —, c'est un signal, pas une conclusion.**

### #10 bis — La casse : 1 311 chaînes cachées par une notation

**2026-08-24.** Le critère exact appliqué brut classait **1 849 blocs**
« retouchés par le hack ». Or **1 311 d'entre eux ne différaient que par la
casse** : Polished Crystal a converti systématiquement l'ALL-CAPS du vanilla
en casse mixte.

```
LUCKY NUMBER SHOW!  ->  Lucky Number Show!
PROF.ELM            ->  Prof.Elm
#MON                ->  #mon
FARFETCH'D          ->  Farfetch'd
```

Ce n'est pas une retouche de contenu. Deux autres notations relevées :
`<PLAY_G>` ↔ `<PLAYER>` (205 occurrences) et `<……>`, une tuile vanilla valant
« …… », écrite `……` par PC.

**Normaliser avant de comparer a doublé le décompte des applicables.**

⚠️ **Mais la casse n'est ignorée que pour COMPARER.** Pour écrire, le français
devra suivre la convention de PC — c'est une transformation à construire, pas
un détail.

### #4 bis — Mon fusionneur d'alias inventait des jumeaux

**2026-08-25.** Le lecteur fusionne deux labels consécutifs quand rien ne les
sépare — cas réel de `data/moves/descriptions.asm`, où `StoneEdgeDescription`
et `XScissorDescription` partagent un texte.

Mais « rien ne les sépare » était mal défini : le lecteur n'enregistre pas les
**commandes de script**, donc un label comme

```asm
Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11
```

paraissait vide et se faisait fusionner avec le suivant. Résultat : le texte
d'un dresseur de la Route 11 se retrouvait attribué à **douze labels** sans
rapport — un panneau, un arbre à fruits, un objet caché.

**Repéré par surprise** : en listant les phrases contenant « Etre », j'ai vu la
même phrase revenir douze fois. Un doublon inexplicable est un symptôme.

**Contournement :** un drapeau `contenu`, levé par toute macro qui n'est pas
une directive d'assemblage. Un label n'est « vide » que si **rien** ne le suit,
pas même une commande de script.

**Ce que ça a coûté :** des chiffres faux, annoncés à l'utilisateur. Le total
retenu passait de 14 200 à **9 466** — les 4 734 excédentaires étaient des
blocs fantômes. Le décompte des phrases à reformuler tombait de 21 à 9.

⚠️ **Le contrôle de couverture ne pouvait pas le voir** : aucune ligne de texte
n'était perdue, elles étaient seulement attribuées plusieurs fois. Un contrôle
qui vérifie qu'on ne perd rien ne vérifie pas qu'on ne duplique pas.

### #9 ter — 86 % des « orphelins » n'en étaient pas

**2026-08-24.** Le triage annonçait **4 220 symboles orphelins**. Deux erreurs
de détection :

- les **blocs implicites** — du texte en ligne, sans nom : rien ne peut les
  citer, donc tous « orphelins » ;
- les **labels locaux**, cités dans la source par leur forme courte `.Enfant`
  et non par leur nom qualifié `Parent.Enfant` : **3 622 labels parfaitement
  référencés** comptés comme morts.

Total réel : **612**. Le détecteur porte désormais un contrôle sur cas
fabriqué — un label inventé doit compter 0, un témoin plus de 1.

---

## Hérités du chantier jumeau — tous rencontrés pour de vrai

### #2 — Le motif d'analyse trop strict, qui annonce sereinement « 0 »

Il a frappé **quatre fois**, et chaque fois l'outil se déclarait complet :

| Le motif exigeait | Chaînes devenues invisibles |
|---|---|
| exactement un espace avant `=` | 285 |
| pas de préfixe `ALIGNED(4)` | **337** |
| un seul littéral par chaîne (le C concatène) | 32 |
| « au moins trois lettres » | tous les mots courts : `OR`, `IS`, `BE` |

**Aggravé ici par la compression.** Un lecteur `.asm` qui ignore `ctxtmap`,
`rawchar` ou les charmaps alternatifs (`no_ngrams`, `compressing`, `default`)
rendra un zéro parfaitement calme et parfaitement faux.

**Contournement :** **tester chaque contrôle sur un cas fabriqué dont on connaît
la réponse, avant de croire son résultat.** `extraire_glossaire.py` le fait :
il vérifie que `BULBASAUR → BULBIZARRE` et `POUND → ECRAS'FACE` avant de rendre
la main, et sort en erreur sinon.

### #3 — La détection d'anglais est aveugle aux panneaux

Un détecteur d'anglais se déclenche sur les **mots outils** — *the*, *is*,
*you*. Un texte fait uniquement de noms capitalisés lui est **invisible** :

```
CELADON POKéMON GYM
LEADER: ERIKA
WINNING TRAINERS:
```

L'inventaire annonçait « 0 » sur les cartes pendant que **six statues d'arène,
neuf panneaux de route et un répertoire de grand magasin** étaient en anglais —
c'est-à-dire le texte le plus lu du jeu.

**Contournement : inverser la question.** Ne pas chercher de l'anglais ; balayer
avec les **valeurs anglaises connues** du glossaire et signaler chaque
occurrence. Deux garde-fous obligatoires, sans quoi l'outil hurle sur son propre
travail :

- ne jamais signaler un mot employé **côté français** (`SAFARI` dans « PARC
  SAFARI ») ;
- comparer **sans accents**.

⚠️ **Jamais de score de similarité, jamais d'heuristique** pour décider d'un
remplacement. Trois détecteurs successifs ont échoué dans les deux sens.

### #4 — Les symboles réappropriés par le hack

Un hack réutilise volontiers un label vanilla pour un autre texte. Appliquer le
français officiel à l'aveugle met alors **la bonne phrase au mauvais endroit**.

Vu deux fois : un tuteur de capacités dont le texte avait glissé vers un label
voisin ; des appels du Pokématos où le hack avait réattribué les créneaux de
personnages de Hoenn à des personnages de Johto.

**Aggravé ici :** PC a 2 791 `.asm` contre 2 463, dont 607 cartes contre 388.
La surface de réappropriation est bien plus large.

**Contournement :** le critère exact (`PC == EN`) protège déjà — si le hack a
changé le texte, le critère échoue et on ne remplace pas. Le danger est ailleurs :
quand le hack garde le texte anglais **mais change le contexte**.

### #5 — Les homographes entre les deux langues

**`LANCE` est le nom français de Proton**, cadre de la Team Rocket, autant que
le nom anglais de Peter, le Maître dragon. Un remplacement en bloc renommait
Proton.

**Règle générale : un terme signalé par un balayage n'est pas un défaut tant
qu'on n'a pas identifié le personnage ou l'objet visé.**

### #6 — Identifier un personnage : le sprite, jamais le nom

Deux concurrents d'un concours portaient des noms inexistants dans toute version
officielle. Trois pistes, trois réponses :

| Piste | Verdict |
|---|---|
| la position dans la liste | 3 écarts faux sur 5 |
| la réplique prononcée | désigne le **mauvais** personnage |
| le **sprite** et la **classe** | juste |

La réplique trompait parce que le hack l'avait **empruntée** faute d'avoir la
bonne. **Le nom écrit dans une réplique est le dernier indice à croire.**

### #7 — Reprendre le texte sans le code qui va avec

Le français inverse parfois l'ordre des mots, ce qui exige un **changement de
code** :

- `'s BASE` (nom concaténé **avant**) → `BASE DE {nom}` (nom inséré **dedans**) ;
- `{nom} BERRY` → `BAIE {nom}`.

**Déjà observé ici** : `#MON PROF.` → `PROF.#MON`, et `<PKMN> TRAINER` →
`DRES. <PKMN>` dans `data/trainers/class_names.asm`.

Le pire précédent : **un clavier repris sans ses trois tables associées**
affichait neuf touches quand le code en connaissait huit — la touche `I` tapait
`G`. **Ça ne casse pas la compilation.**

**À contrôler en priorité ici :** `data/text/input_chars.asm` (le clavier),
`data/text/plural_table.asm` (le pluriel anglais n'a pas la mécanique du
français), `data/text/ngrams.asm`.

`pokeemeraude` marquait ces cas d'un commentaire `French Difference`. **Chercher
l'équivalent dans `pokecrystal-fr`** avant de conclure qu'une chaîne est
simplement applicable.

### #8 — `FR == EN` est une CONFIRMATION, pas une lacune

Si l'officiel emploie la même chaîne que l'anglais, c'est que **le mot ne se
traduit pas**. Sur le chantier jumeau, **161 chaînes** ont été reclassées ainsi
et le reste à faire est tombé de 169 à 7.

**Déjà visible ici :** 195 des 994 entrées du glossaire officiel sont
identiques en français — `BLIZZARD`, `EXPLOSION`, `SURF`, `ENCORE`. Les compter
comme restantes, c'est promettre une traduction qui n'a pas lieu d'être.

### #9 — Une chaîne anglaise dans la VF n'est pas forcément à traduire

Vérifier d'abord qu'elle est **vivante** — citée par un autre fichier. Sur le
chantier jumeau, **34 chaînes anglaises** de la VF officielle n'étaient
référencées nulle part : mortes dans le jeu original, héritées mortes par le
hack, jamais affichées.

**Un label déclaré n'est pas un texte affiché.**

**Déjà confirmé ici :** `ë`, `É` et `ß` sont déclarés au charmap français et
employés **zéro fois** en 24 113 lignes.

Outil utile côté PC : `utils/unreferenced.py`, qui prend le `.sym` du build.

### #10 — Les différences de NOTATION, pas de contenu

Le critère exact échoue sur des écarts purement typographiques, et chacun cache
des dizaines de chaînes applicables :

- `{PAUSE 0x0F}` contre `{PAUSE 15}` — la même valeur → **70 chaînes** masquées ;
- `{STRING 5}` contre `{KUN}` — le même octet sous deux noms.

**Normaliser avant de comparer.**

### #11 — Une entrée de charmap ne garantit pas un glyphe

Des caractères déclarés au charmap avaient une case **vide** dans la police :
le jeu affichait un blanc. **Après toute modification du charmap, vérifier les
pixels**, pas seulement la déclaration.

**Multiplié par 8 ici** — PC a huit polices de 114 tuiles.

### #12 — Ne jamais inscrire un nom propre de mémoire

J'allais écrire « Ciel Gris » et « Régime Strict » pour *Air Lock* et
*Hyper Cutter*. **Les deux sont inchangés en français.**

**Demander coûte toujours moins cher qu'une correction.**
