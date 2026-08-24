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
