#!/bin/sh
# Régénère l'arbre de Huffman sur le texte tel qu'il est AUJOURD'HUI.
#
# À relancer à chaque palier de traduction : l'arbre doit SUIVRE le texte.
# Régénérer trop tôt sur du français pur ferait déborder la ROM tant que
# l'anglais domine (mesuré : +20 816 octets). Voir COMPRESSION.md §7.
#
# ⚠️ `make huffman` écrit le journal de compilation ET les caractères sur la
# même sortie. Sans le filtre ci-dessous, utils/huffman.py prend chaque ligne
# de gcc et de rgbgfx pour un caractère et produit 796 codes au lieu de 125.
# Le mode d'emploi du dépôt amont ne le mentionne pas.
set -e
cd "$(dirname "$0")/../.."
# ⚠️ `make huffman` dépend de la cible `crystal` : si la ROM est déjà à jour,
# make ne fait RIEN et le fichier de caractères sort vide. Il faut nettoyer.
echo "1/4  extraction des caractères (reconstruction complète)…"
make clean > /dev/null 2>&1
make huffman > /tmp/pc_chars.txt 2>/dev/null
grep -E '^".*"$' /tmp/pc_chars.txt > /tmp/pc_chars_propre.txt
n=$(wc -l < /tmp/pc_chars_propre.txt)
echo "     $n caractères retenus sur $(wc -l < /tmp/pc_chars.txt) lignes"
if [ "$n" -lt 100000 ]; then
  echo "ÉCHEC : trop peu de caractères — ne pas croire ce résultat." >&2
  exit 1
fi
echo "2/4  construction de l'arbre…"
python3 utils/huffman.py /tmp/pc_chars_propre.txt > /tmp/pc_codes.txt
echo "     $(wc -l < /tmp/pc_codes.txt) codes"
echo "3/4  réinjection dans constants/charmap.asm…"
python3 translation/outils/injecter_codes.py /tmp/pc_codes.txt
echo "4/4  fait. Recompiler et VÉRIFIER une chaîne dans le binaire :"
echo "     un arbre mal réinjecté corrompt tout le texte sans casser le build."
