# Conventions d'écriture

**Tout ce qui suit est mesuré sur le Cristal français officiel** (24 113 lignes,
`pokecrystal-fr`), pas déduit d'une règle de typographie générale. Les jeux
Pokémon français ont leurs habitudes, et elles ne sont pas celles de l'imprimerie.

Quand une convention de PC entre en conflit avec celle de la VF officielle,
c'est signalé et arbitré explicitement.

---

## 1. La limite de largeur dépend du CONTEXTE

⚠️ **Ce n'est pas 18 partout.** Le cahier de mission annonce une limite unique
de 18 tuiles ; c'est vrai de la boîte de dialogue, et faux ailleurs.

### D'où vient le 18

Il est **structurel**, dans `constants/text_constants.asm` :

```asm
DEF BORDER_WIDTH   EQU 2
DEF TEXTBOX_WIDTH  EQU SCREEN_WIDTH        ; 20
DEF TEXTBOX_INNERW EQU TEXTBOX_WIDTH - BORDER_WIDTH   ; = 18
```

### Les autres contextes

Maxima **mesurés** sur les 38 759 lignes de Polished Crystal :

| Contexte | Fichier | Max |
|---|---|---|
| Dialogue, descriptions d'objets et de capacités, Pokématos | `maps/`, `data/items/`, `data/moves/`, `data/phone/` | **18** |
| **Entrées du Pokédex** | `data/pokemon/dex_entries.asm` (1 667 lignes) | **19** |
| **Descriptions de talents** | `data/abilities/descriptions.asm` (311 lignes) | **19** |
| Générique | `data/credits_strings.asm` | **20** |
| Quelques messages de combat | `engine/battle/core.asm` | **20** |

**Ne jamais supposer la largeur : la relever pour le fichier qu'on traduit.**
`verif_longueurs` devra porter une table de budgets par contexte, pas une
constante unique.

### Une tuile n'est pas un caractère

Un `len()` naïf sur-compte et signale de faux débordements.

- Les **élisions** `c' d' j' l' m' n' p' s' t' u' y'` occupent **une seule
  tuile** (quand elles ont une case de charmap — voir `DECISIONS.md` A1).
- Les **jetons** `<PLAYER>`, `<RIVAL>`, `#mon`, `<PK>`, `<MN>` s'écrivent long
  et s'affichent court — longueur variable pour les trois premiers.
- Les macros `{d:CONSTANTE}` sont développées à la compilation et **ne comptent
  pas** pour leur longueur écrite.
- Le terminateur `@` **n'est pas affiché**.

> « Les dresseurs d'ici » — 19 caractères, **18 tuiles**. Tient exactement.

**Compter en tuiles : dépouiller `@`, développer les macros, réduire les
digrammes, puis mesurer.** Et mesurer *avant* d'écrire — composer puis
découvrir un dépassement oblige à tout reformuler.

⚠️ **Cette section a d'abord été écrite fausse** (« 0 ligne > 18 dans PC »),
faute d'avoir dépouillé `@` et `{d:}`. Voir [`PIEGES.md`](PIEGES.md) #2 bis.

## 2. Aucune capitale accentuée — et aucune exception

**Mesuré : 0 capitale accentuée sur 44 945** dans le Cristal français. Zéro.

⚠️ **Le cahier de mission prévoit des exceptions ; la Gen 2 n'en fait aucune.**
Il annonce que gardent leur signe la cédille `Ç`, la ligature `Œ`, et `À`/`Ù`
là où l'accent est le seul écart avec un autre mot. Décompte exhaustif sur le
corpus vivant :

| | occurrences |
|---|---|
| `À` `Â` `Ç` `È` `Ê` `Ë` `Î` `Ï` `Ô` `Ù` `Û` `É` | **0 chacune** |
| `Œ` `Æ` | **0** |

L'officiel écrit ` A `, ` LA `, `CA `, `OU?` — sans accent, sans cédille.

Écrire donc **`ARENE`**, **`ECORCIA`**, **`MAITRE`**, **`EBENELLE`**, **`CA`**,
**`OU`**, **`LA`**.

**Conséquence technique :** aucun glyphe de capitale accentuée n'a été dessiné,
et le budget de charmap n'en réserve aucun ([`CHARMAP.md`](CHARMAP.md)).

## 2 bis. Casse : on MODERNISE — décision D3

**Décidée par l'utilisateur le 2026-08-24.**

Polished Crystal a converti **systématiquement** la casse ALL-CAPS du Cristal
vanilla en casse mixte. Ce n'est pas une retouche ponctuelle : **1 311 blocs**
de texte ne diffèrent du vanilla que par ça.

| vanilla | Polished Crystal |
|---|---|
| `LUCKY NUMBER SHOW!` | `Lucky Number Show!` |
| `PROF.ELM` | `Prof.Elm` |
| `#MON` | `#mon` |
| `FARFETCH'D` | `Farfetch'd` |

Le cahier disait : « mesure d'abord ce que le hack fait déjà ; s'il modernise
systématiquement, suis-le. » **La mesure est faite, il modernise. On suit.**

Précédent relevé par l'utilisateur : *Pokémon Version Violette*, romhack de
Rouge/Bleu de même esprit, a appliqué la même modernisation.

### Ce que ça implique concrètement

Le français officiel écrit les noms propres en capitales : `ECORCIA`,
`TEAM ROCKET`, `ARENE`. Il faudra les convertir : `Écorcia`, `Team Rocket`,
`Arène`.

Ampleur mesurée sur le corpus français officiel :

| | |
|---|---|
| formes en capitales distinctes | **1 483** |
| occurrences | **15 997** |
| déjà couvertes par `donnees/glossaire_officiel.tsv` | 228 formes, 27 % des occurrences |

⚠️ **La conversion sera OUTILLÉE, pas manuelle.** Un dictionnaire
`CAPITALES -> Casse Mixte` de 1 483 entrées, dont la plupart se déduisent
mécaniquement. Les autres se tranchent une fois et servent partout.

### ⚠️ La conséquence que la casse mixte entraîne : des CAPITALES ACCENTUÉES

En capitales, le français ne s'accentue pas — c'est la règle du §2, mesurée à
zéro sur 44 945. **En casse mixte, la règle ne s'applique plus** : `ECORCIA`
devient `Écorcia`, `ILES ECUME` devient `Îles Écume`.

Déduit du corpus (mots présents à la fois en capitales et en minuscules
accentuées) :

| Capitale | occurrences | exemples |
|---|---|---|
| `Î` | 60 | `ILE` → `Île`, `ILES` → `Îles` |
| `Â` | 11 | `AME` → `Âme` |
| `Ç` | 1 | `CA` → `Ça` |

⚠️ **Cette méthode ne voit pas les noms propres**, qui n'apparaissent jamais en
minuscules. `ECORCIA`, `EBENELLE`, `ECUME`, `ECOLIER` sont des candidats — à
**vérifier sur Poképédia, jamais de mémoire** ([`PIEGES.md`](PIEGES.md) #12).

⚠️ **Et le charmap est à marge ZÉRO** ([`CHARMAP.md`](CHARMAP.md)). Chaque
capitale accentuée ajoutée devra en remplacer une autre. Les réserves connues :
les 3 caractères espagnols restants (`á` `¿` `¡`, ce qui rouvrirait D1) et
`<SHARP>` (au prix du lecteur de musique). **Décision à prendre quand le
nombre exact sera connu.**

---

## 3. Ponctuation : pas d'espace avant les signes doubles

Contre-intuitif pour du français, mais **c'est la règle des jeux Pokémon**, et
elle est nette :

| Signe | Occurrences | dont précédées d'une espace |
|---|---|---|
| `!` | 3 818 | **0** |
| `?` | 1 787 | **0** *(2 faux positifs : « Mon nom est ???. »)* |
| `:` | 464 | **0** *(1 faux positif : un `:` isolé)* |

Écrire **`Salut!`**, **`Vraiment?`**, **`ATTENTION:`** — jamais `Salut !`.

Raison technique évidente : chaque espace coûte une tuile sur les 18.

---

## 4. Guillemets : aucun

**Mesuré : 0 occurrence de `«` `»` `“` `”`** dans le Cristal français. Le
discours rapporté se passe de guillemets. Ne pas en introduire.

---

## 5. Points de suspension : `…`, pas `...`

⚠️ **Ici la VF officielle et Polished Crystal divergent, et on suit PC.**

| | `…` | `...` |
|---|---|---|
| Cristal français officiel | 281 | **1 356** |
| `pokecrystal` (EN) | 1 498 | 1 |
| **Polished Crystal** | **2 304** | **0** |

PC emploie le glyphe unique **exclusivement**. Deux raisons de le suivre :

1. **Cohérence** — mélanger les deux notations dans le même jeu se voit.
2. **La place.** `…` coûte **1 tuile**, `...` en coûte **3**. Sur 2 304
   occurrences, suivre la VF officielle coûterait ~4 600 tuiles — et il ne reste
   que 1,29 % de ROM libre.

**Écrire `…`.** C'est un des rares cas où l'on s'écarte sciemment de la VF
officielle ; le motif est consigné pour qu'il ne soit pas rouvert par erreur.

---

## 6. Les macros de texte

```asm
	text "…"                  ; commence un bloc
	line "…"                  ; ligne suivante
	cont "…"                  ; suite après un saut
	para "…"                  ; nouveau paragraphe
	text_ram wStringBuffer3   ; insère une variable
	done / prompt             ; termine
```

Le `@` termine une chaîne **à l'intérieur** d'un bloc — il n'est pas affiché et
ne compte pas dans les 18 tuiles.

---

## 7. Ce qui ne se traduit pas

`FR == EN` est une **confirmation**, pas une lacune. **195 des 994 entrées** du
glossaire officiel sont identiques en français : `BLIZZARD`, `EXPLOSION`,
`SURF`, `ENCORE`, `GUILLOTINE`, `FRUSTRATION`, `AEROBLAST`…

Voir [`PIEGES.md`](PIEGES.md) #8. Les traduire serait une erreur ; les compter
comme du travail restant en serait une autre.

---

## 8. Ne jamais écrire un nom propre de mémoire

Vérifier dans `donnees/glossaire_officiel.tsv` d'abord. S'il n'y est pas :
Poképédia, ou demander. **Jamais de mémoire** — voir [`PIEGES.md`](PIEGES.md) #12.
