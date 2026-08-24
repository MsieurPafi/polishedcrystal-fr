# Polished Crystal — traduction française

Dossier de travail du chantier. **Tout ce qui se décide, s'apprend ou se rate
ici s'écrit ici.** Le reste du dépôt est le hack ; ce dossier est notre mémoire.

## Par où commencer

| Si tu veux… | Lis |
|---|---|
| comprendre le chantier en 10 minutes | [`ETAT_DES_LIEUX.md`](ETAT_DES_LIEUX.md) |
| savoir où on en est | [`JOURNAL.md`](JOURNAL.md) |
| savoir pourquoi c'est comme ça | [`DECISIONS.md`](DECISIONS.md) |
| comprendre la compression et si le FR tient | [`COMPRESSION.md`](COMPRESSION.md) |
| écrire du français sans le refaire trois fois | [`CONVENTIONS.md`](CONVENTIONS.md) |
| trouver un terme officiel | [`GLOSSAIRE.md`](GLOSSAIRE.md) + `donnees/glossaire_officiel.tsv` |
| éviter une erreur déjà commise | [`PIEGES.md`](PIEGES.md) |

Le cahier de mission d'origine est à la racine de l'atelier :
`../../POLISHED_CRYSTAL_FR.md`. Il reste la doctrine. Nos documents le
complètent et, sur trois points mesurés, le corrigent.

## L'atelier

```
<atelier>/
  ├── POLISHED_CRYSTAL_FR.md   ← le cahier de mission
  ├── polishedcrystal/         ← LE dépôt git — c'est ici qu'on commite
  │     └── translation/       ← ce dossier
  ├── pokecrystal/             ← référence EN — JAMAIS versionnée par nous
  └── pokecrystal-fr/          ← référence FR — JAMAIS versionnée par nous
```

⚠️ Les deux décompilations vivent **à côté** du dépôt, jamais dedans. Elles
contiennent du texte officiel Nintendo. La règle est structurelle pour
qu'aucun `git add .` ne puisse se tromper. Ne jamais la contourner.

⚠️ Aucune ROM commerciale n'est téléchargée, cherchée ni manipulée. Le
`.gitignore` du dépôt couvre déjà `*.gbc`, `*.ips`, `*.patch`.

## La règle fondatrice

> **Le hack est la source, l'officiel est la référence.**

On traduit ce que **Polished Crystal** dit, avec les mots que **le Cristal
français officiel** emploie. Jamais l'inverse.

Le critère exact, sans aucune heuristique :

```
PolishedCrystal == pokecrystal (EN)   ET   pokecrystal-fr (FR) != EN
```

## Les outils

Tous dans `outils/`, tous importent `chemins.py`, aucun n'écrit de chemin absolu.

| Outil | Ce qu'il garantit | État |
|---|---|---|
| `chemins.py` | Résout l'atelier depuis sa propre position. Échoue bruyamment. | ✅ |
| `extraire_glossaire.py` | Glossaire officiel EN→FR depuis les tables indexées. | ✅ |
| `encodage.py` | Simule l'encodage réel de PC. **Validé à −0,16 % contre la ROM.** | ✅ |
| `estimer_cout.py` | Coût en octets du français, quatre scénarios. | ✅ |
| lecteur `.asm` | `label -> texte`, blocs multi-lignes, terminateur `@`. | à faire |
| `inventaire` | Décompte au critère exact, périmètre annoncé. | à faire |
| `triage` | Orphelins / confirmés / hors d'atteinte / travail réel. | à faire |
| `verif_longueurs` | Aucune ligne > 18 tuiles, macros développées. | à faire |
| `verif_glossaire` | Balaie par valeurs anglaises connues, pas par détection. | à faire |
| `capitales` | Retire les accents des capitales, liste de gardés. | à faire |

Contrôle de santé de l'atelier :

```bash
python3 translation/outils/chemins.py
```

## La discipline

- **Compiler après chaque lot.** Une ROM qui ne se construit pas arrête tout.
- **Vérifier dans la ROM**, pas seulement dans la source.
- **Mesurer avant d'écrire**, jamais après.
- **Un lot, un commit.** Le message dit *pourquoi*, pas *quoi*.
- **Quand un contrôle ne trouve rien, douter de lui d'abord.** Fabriquer un cas
  positif, vérifier qu'il le voit, et alors seulement croire son zéro.
