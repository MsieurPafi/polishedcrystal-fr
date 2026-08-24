# Le budget de charmap — registre

Sujet le plus contesté du chantier : **je m'y suis trompé trois fois.** Ce
document existe pour qu'on n'ait plus à refaire le raisonnement, et pour
qu'une décision réversible puisse être rouverte sans tout recalculer.

---

## 1. Les deux ressources, à ne jamais confondre

⚠️ **C'est l'erreur qui m'a coûté le plus de temps.** Un caractère réclame
**deux** ressources indépendantes :

| Ressource | Plage d'octets | Ce qu'elle donne | Total |
|---|---|---|---|
| **tuile de police** | `$7f`–`$f0` | le glyphe s'affiche | 114 |
| **feuille Huffman** | `$7f`–`$eb` **et** `$4d`–`$5c` | le caractère se comprime | 125 |

Une lettre accentuée a besoin des **deux**. Elle doit donc vivre dans
`$7f`–`$eb`, l'intersection — et cette plage est **pleine**.

Les 4 feuilles libres `$fc`–`$ff` desservent les octets `$4b`–`$5c`, qui sont
des n-grammes et des caractères de contrôle **sans glyphe**. Elles ne peuvent
pas loger un `à`. Voir [`PIEGES.md`](PIEGES.md) #1 quater.

⚠️ **Et un caractère sans feuille Huffman ne se contente pas d'être moins bien
comprimé : il fait ÉCHOUER la compression de tout bloc qui le contient**
(+58 834 octets si on le fait pour les accents — voir
[`COMPRESSION.md`](COMPRESSION.md)). Il n'y a donc pas d'option « tuile
seulement » pour une lettre.

---

## 2. Le besoin — 9 caractères

Décompte **exhaustif** des caractères non-ASCII du corpus français **vivant**
(`mobile/`, `engine/debug/` et le mystery gift exclus — voir
[`PIEGES.md`](PIEGES.md) #9 bis) :

| À créer | occurrences | | Déjà dans PC | occurrences |
|---|---|---|---|---|
| `à` | 899 | | `é` | 3 250 |
| `ê` | 484 | | `…` | 281 |
| `è` | 450 | | `¥` | 20 |
| `ç` | 342 | | `№` | 2 |
| `î` | 209 | | `♂` `♀` | 1 chacun |
| `ô` | 167 | | | |
| `û` | 89 | | | |
| `â` | 88 | | | |
| `ù` | 73 | | | |

**Écartés :**

- **`ï`** — 6 occurrences. Reformuler les rares mots concernés.
- **`←` `→`** — 1 occurrence chacun ; se rabattent sur `◀` `▶`, que PC possède.
- **Les 11 élisions** (`l'` `d'` `n'` `c'` `u'` `t'` `j'` `m'` `s'` `p'` `y'`) —
  mesurées à **+64 octets** et 10 débordements de ligne sur 24 113. Elles ne
  valent pas leur case. Voir [`COMPRESSION.md`](COMPRESSION.md) §5.

⚠️ `'s` **reste** : il est employé 66 fois en français, pour « J'suis »
(`J` + `'s` + `uis`). Ce n'est pas une contraction anglaise résiduelle.

---

## 3. Le registre des cases

### Libérées sans arbitrage — 7

| Octet | Jeton | Motif |
|---|---|---|
| `$c1` | `'d` | contraction anglaise, disparaît en français |
| `$c2` | `'l` | idem |
| `$c3` | `'m` | idem |
| `$c4` | `'r` | idem |
| `$c6` | `'t` | idem |
| `$c7` | `'v` | idem |
| `$c9` | `É` | **0 occurrence** en texte, **0 référence** en code. Et le français n'accentue pas les capitales ([`CONVENTIONS.md`](CONVENTIONS.md) §2). |

### Libérées par décision D1 — 2

| Octet | Jeton | Occurrences |
|---|---|---|
| `$cc` | `í` | **1** |
| `$cd` | `ó` | **1** |

### Total : 9 cases pour 9 caractères

⚠️ **Marge : zéro.** Le budget est équilibré au caractère près. Tout besoin
supplémentaire découvert plus tard exigera un nouvel arbitrage.

---

## 4. Décision D1 — retirer `í` et `ó`, garder l'espagnol de PILAR

**Décidée le 2026-08-24 par l'utilisateur. Explicitement réversible.**

### Ce qui est décidé

`SIGHTSEERF PILAR` (`maps/ShamoutiCoast.asm`), touriste hispanophone et seule
locutrice non anglophone du hack, **garde son espagnol**. Elle perd seulement
les accents `í` et `ó`, dont les cases sont réaffectées au français.

### Les deux mots touchés

| Fichier | Ligne | Avant | Après |
|---|---|---|---|
| `maps/ShamoutiCoast.asm` | **111** | `viajado un mont**ó**n` | `viajado un monton` |
| `maps/ShamoutiCoast.asm` | **127** | `Pensé que durar**í**a` | `Pensé que duraria` |

### Ce qui est préservé

`¡` `¿` `á` et `é` restent. Les marques que l'œil attrape — `¡Hola!`,
`¿Qué tal si combatimos?` — sont intactes. L'espagnol demeure immédiatement
identifiable.

### Le coût assumé

C'est de l'**espagnol mal orthographié** sur deux mots. Un hispanophone le
remarquera. Assumé sciemment contre la préservation intégrale de l'effet voulu
par l'auteur du hack : une étrangère dont le joueur ne partage pas la langue.

### Ce qui a été écarté, et pourquoi

| Option | Verdict |
|---|---|
| **Franciser PILAR** (français cassé hispanisant) | Un précédent officiel existe — la VF de Cristal traite ainsi le grouillot Rocket de la Route 24 ([`GLOSSAIRE.md`](GLOSSAIRE.md) §5). Mais ce personnage-là était **compréhensible en anglais** ; PILAR ne l'est pas. La franciser lui retire son opacité, qui est le propos. |
| **Lui faire parler anglais** | Préserverait l'opacité pour un joueur francophone. Écarté : s'éloigne davantage de l'intention de l'auteur. |
| **Sacrifier `<SHARP>`** (`$df`) | Ne sert qu'au **lecteur de musique** (`data/music_player/notes.asm` : Do♯, Ré♯, Fa♯). Fonctionnalité bonus mais visible, et non liée à la traduction. Gardé en réserve. |
| **Sacrifier `♥`** (10 usages) ou **`№`** (6) | Présents dans du texte réel. Plus coûteux que 2 accents espagnols. |
| **Sacrifier `<BOLDH>`, `<PO>`, `<KE>`** | Non. Vraie interface : résumé, Pokédex, écran CT/CS, « Pokégear » du menu de départ. |

### Pour rouvrir la décision

Tout est réversible tant que la police n'est pas redessinée. Dans l'ordre :

1. **Rendre ses accents à PILAR** — il faut 2 cases ailleurs. La réserve la
   moins chère est `<SHARP>` (`$df`), au prix du lecteur de musique.
2. **Franciser ou angliciser PILAR** — libère `¡` `¿` `á` en plus, soit
   **3 cases de marge**, et rend `ï` ou une élision envisageable.
3. **Si un 10ᵉ caractère devient nécessaire** — la marge étant nulle, ce
   registre est le point de départ : reprendre le tableau des sacrifices
   ci-dessus, pas le raisonnement.

---

## 5. Ce qui reste à faire

- [ ] Redessiner `à ê è ç î ô û â ù` dans **chaque police servant au dialogue**
      — PC en a 8 de 114 tuiles. Lesquelles affichent du dialogue : **non
      mesuré** ([`DECISIONS.md`](DECISIONS.md) A3).
- [ ] Régénérer l'arbre Huffman (`utils/huffman.py`) après réaffectation.
- [ ] Répercuter le charmap dans `utils/ngram.py`, qui embarque **sa propre
      copie** de la liste des jetons.
- [ ] **Vérifier les pixels**, pas seulement la déclaration
      ([`PIEGES.md`](PIEGES.md) #11).
