# Journal de chantier

Chronologique, du plus récent au plus ancien. Une entrée par séance.
On y écrit **ce qui a été fait, ce qui a été mesuré, et ce qui a raté**.
Les décisions vont dans [`DECISIONS.md`](DECISIONS.md), les pièges dans
[`PIEGES.md`](PIEGES.md) — ici, c'est le fil du temps.

---

## 2026-08-24 — Jour 1 : reconnaissance

**Fait**

- Cahier de mission lu en entier, et **ses chiffres recontrôlés** plutôt que
  crus : 2463/2463 `.asm`, charmap 371 EN / 391 FR, 26 ajoutés / 6 retirés /
  2 déplacés, appariement par label exact. Tout tient.
- RGBDS **1.0.3** installée (Homebrew). PC exige ≥ 1.0.0.
- `pokecrystal-fr` compilé → SHA1 `c055992b16b7399c687647725cdd1f4f13a2f75c`,
  **identique** à son `roms.sha1`. La référence française est prouvée.
  *(§11 étape 3 du cahier — faite.)*
- Fork `MsieurPafi/polishedcrystal-fr` configuré : `origin` = le fork,
  `upstream` = Rangi. Branche de travail **`fr`**, basée sur le `master` amont
  réel (`9df8776ca`, 23 août) — notre clone initial avait **105 commits de
  retard**, dont 67 touchant du texte.
- `polishedcrystal` compilé tel quel sur cette base : ligne de base établie.
- `outils/chemins.py` écrit et testé.
- `outils/extraire_glossaire.py` écrit : **994 entrées** officielles EN→FR.
- Dossier `translation/` monté : `README`, `ETAT_DES_LIEUX`, `JOURNAL`,
  `DECISIONS`, `GLOSSAIRE`, `PIEGES`, `CONVENTIONS`, plus `outils/` et
  `donnees/`.

**Mesuré**

| Grandeur | Valeur |
|---|---|
| Espace libre dans la ROM (`9df8776ca`) | **17 794 / 2 097 152 octets — 0,85 %** |
| …au commit précédent (`20a367242`, 105 commits plus tôt) | 26 989 — **la marge se réduit** |
| Lignes de texte PC / EN vanilla / FR officiel | 38 759 / 24 364 / 24 113 |
| Caractères de texte, idem | 530 527 / 331 449 / 311 032 |
| Ratio FR/EN en caractères | **0,938** — le français officiel est plus *court* |
| Cases de charmap libres dans PC | **0 sur 256** |
| Cases nécessaires au français | 19 (10 accentuées + 9 élisions utiles) |
| Cases libérables sans arbitrage éditorial | 7 |
| Polices à alimenter en glyphes | **8**, 114 tuiles chacune |
| Capitales accentuées dans la VF officielle | **0 sur 44 945** |
| Espace avant `!` dans la VF officielle | **0 sur 3 818** |
| Guillemets `«` `»` dans la VF officielle | **0** |
| Ellipse : `…` / `...` dans PC | **2 305 / 0** — contre 281 / 1 356 côté VF |
| Largeur max : dialogue / Pokédex / talents / générique | **18 / 19 / 19 / 20** |
| Entrées de glossaire officiel extraites | **994**, dont 195 identiques |

**Trouvé, et absent du cahier**

1. **PC compresse son texte** — arbre de Huffman + 67 n-grammes anglais, le tout
   dans `constants/charmap.asm`, appliqué par des macros RGBDS à l'assemblage.
   Aucun outil externe. Les générateurs `utils/huffman.py` et `utils/ngram.py`
   calculent les tables ; c'est tout ce qu'ils font.
2. **0,85 % de ROM libre, et en baisse** (1,29 % cent-cinq commits plus tôt).
   Retuner la compression n'est pas une optimisation : c'est une condition de
   build. → priorité 1.
3. **Le charmap est plein** — zéro case libre sur 256.
4. **Huit polices**, pas une.
5. **La largeur de ligne dépend du contexte** — 18 dans la boîte de dialogue
   (structurel : `TEXTBOX_INNERW`), mais **19** pour le Pokédex et les talents,
   **20** pour le générique. Le cahier annonce 18 partout.

**Raté, et corrigé**

- **J'ai écrit une fausse conclusion et je l'ai répétée.** J'avais annoncé
  « 0 ligne > 18 dans PC » après avoir expliqué les lignes à 19-20 comme des
  terminateurs `@`, sur la foi d'**un seul** exemple. En dépouillant
  correctement, 8 lignes dépassent — et ce ne sont pas des accidents, mais un
  contexte d'affichage différent. → [`PIEGES.md`](PIEGES.md) #2 bis.
- `chemins.py` a d'abord annoncé `pokecrystal 2463 ≠ pokecrystal-fr 3017`.
  Le contrôle avait raison de sonner, mais **le fautif était l'outil** : son
  `rglob` comptait les `.asm` générés par la compilation que je venais de
  lancer. Corrigé en passant par `git ls-files`. → [`PIEGES.md`](PIEGES.md) #1.

**Corrige le cahier sur**

- §1 « volume de texte bien plus faible » → **faux**, PC a +59 % de lignes que
  le vanilla (38 759 contre 24 364).
- §5.1 « la limite est de 18 tuiles, dure, sans une seule exception » → vrai
  pour le dialogue, **faux pour le Pokédex, les talents et le générique**.

**Conventions mesurées, pas supposées** → [`CONVENTIONS.md`](CONVENTIONS.md)

- Aucune capitale accentuée : **0 sur 44 945**. La règle du §5.4 est absolue.
- **Pas d'espace avant `!` `?` `:`** — contre-intuitif en français, mais c'est
  l'usage des jeux Pokémon, et il est net. Les 3 « exceptions » relevées sont
  des faux positifs (`Mon nom est ???.`, un `:` isolé).
- **Aucun guillemet** `«` `»` `“` `”` dans toute la VF officielle.
- **Conflit arbitré** : l'ellipse. PC écrit `…` exclusivement, la VF officielle
  préfère `...`. On suit PC — cohérence, et surtout 1 tuile contre 3 avec
  1,29 % de ROM libre. → décision P8.

**Prochaine séance**

1. Estimer le coût en octets du français sous les tables anglaises (§7 bis de
   l'état des lieux). C'est le chiffre qui décide de la faisabilité.
2. Lecteur `.asm` — `label -> texte`, testé sur un fichier compté à la main.
3. `inventaire` puis `triage`. **Aucun chiffre de travail annoncé avant.**
