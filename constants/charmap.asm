MACRO ctxtmap
	DEF x = \2
	DEF ___huffman_data_{02X:x} EQU %\3
	DEF ___huffman_length_{02X:x} EQU STRLEN("\3")
	DEF ___huffman_char_\3 EQUS "\1"
	charmap \1, x
ENDM

; Huffman text compression (see data/text/compressed_text.asm and home/text.asm)
; tree starts at parent node $00
DEF ROOT_NODE_ID               EQU $00
; characters $7f-$eb correspond to leaf nodes $7f-$eb
DEF FIRST_LEAF_NODE_ID         EQU $7f
DEF LAST_LEAF_NODE_ID          EQU $ff
; characters $4d-$5c correspond to leaf nodes $ec-$fb
DEF FIRST_SHIFTED_LEAF_CHAR_ID EQU $4d
DEF LAST_SHIFTED_LEAF_CHAR_ID  EQU $5c
DEF FIRST_SHIFTED_LEAF_NODE_ID EQU $ec
DEF LAST_SHIFTED_LEAF_NODE_ID  EQU FIRST_SHIFTED_LEAF_NODE_ID + LAST_SHIFTED_LEAF_CHAR_ID - FIRST_SHIFTED_LEAF_CHAR_ID ; $fb
assert LAST_SHIFTED_LEAF_NODE_ID <= LAST_LEAF_NODE_ID
assert FIRST_SHIFTED_LEAF_CHAR_ID < LAST_SHIFTED_LEAF_CHAR_ID && LAST_SHIFTED_LEAF_CHAR_ID < FIRST_LEAF_NODE_ID

	newcharmap no_ngrams

; Control characters

	charmap "<START>",  $00
	charmap "<RAM>",    $01
	charmap "<WAIT>",   $02
	charmap "<ASM>",    $03
	charmap "<NUM>",    $04
	charmap "<PAUSE>",  $05
	charmap "<SOUND>",  $06
	charmap "<DAY>",    $07
	charmap "<FAR>",    $08
	charmap "<PLURAL>", $09

	; n-grams: $0a - $51 (defined below)

DEF SPECIALS_START EQU $52

	ctxtmap "<DONE>",   $52, 011101
	ctxtmap "@",        $53, 111111000
	ctxtmap "<PROMPT>", $54, 1101110000
	ctxtmap "<LNBRK>",  $55, 1100010001001
	ctxtmap "<NEXT>",   $56, 01001111
	ctxtmap "<LINE>",   $57, 01000
	ctxtmap "<CONT>",   $58, 1101000
	ctxtmap "<PARA>",   $59, 011111

	ctxtmap "<TARGET>", $5a, 001100111110010
	ctxtmap "<USER>",   $5b, 010011101101000
	ctxtmap "<ENEMY>",  $5c, 0011001111100010

	charmap "<CTXT>",   $5d

	charmap "¯",        $5e

; Battle characters

DEF BATTLEEXTRA_GFX_START EQU $5f

	charmap "<MALE>",   $5f
	charmap "<FEMALE>", $60
	charmap "<SHINY>",  $61
	charmap "<BALL>",   $62

	charmap "<HP1>",    $63
	charmap "<HP2>",    $64
	charmap "<NOHP>",   $65
	; HP: $66 - $6c
	charmap "<FULLHP>", $6d
	charmap "<HPEND>",  $6e

	charmap "◢",        $6f
	charmap "—",        $70
	charmap "◣",        $71
	charmap "<NONO>",   $72

	charmap "<XP1>",    $73
	charmap "<XP2>",    $74
	charmap "<NOXP>",   $75
	; EXP: $76 - $7c
	charmap "<FULLXP>", $7d
	charmap "<XPEND>",  $7e

; Actual characters

DEF FIRST_REGULAR_TEXT_CHAR EQU $7f

; map tiles:

	ctxtmap " ",        $7f, 100

; typeface font:

	ctxtmap "A",        $80, 001100110
	ctxtmap "B",        $81, 010011011
	ctxtmap "C",        $82, 110001001
	ctxtmap "D",        $83, 0100111010
	ctxtmap "E",        $84, 1100000011
	ctxtmap "F",        $85, 11111100100
	ctxtmap "G",        $86, 0100110100
	ctxtmap "H",        $87, 1101110110
	ctxtmap "I",        $88, 11111101
	ctxtmap "J",        $89, 1101110111
	ctxtmap "K",        $8a, 11000000101
	ctxtmap "L",        $8b, 1101110101
	ctxtmap "M",        $8c, 001101110
	ctxtmap "N",        $8d, 11000000100
	ctxtmap "O",        $8e, 1101110100
	ctxtmap "P",        $8f, 001101111
	ctxtmap "Q",        $90, 1101110001100
	ctxtmap "R",        $91, 0100110101
	ctxtmap "S",        $92, 110000011
	ctxtmap "T",        $93, 00110010
	ctxtmap "U",        $94, 110001000111
	ctxtmap "V",        $95, 00110011110
	ctxtmap "W",        $96, 1100001011
	ctxtmap "X",        $97, 11000100010101000
	ctxtmap "Y",        $98, 1100001010
	ctxtmap "Z",        $99, 11011100010000

	ctxtmap "(",        $9a, 001100111111
	ctxtmap ")",        $9b, 010011101100
	ctxtmap ".",        $9c, 110101
	ctxtmap ",",        $9d, 0011010
	ctxtmap "?",        $9e, 11000101
	ctxtmap "!",        $9f, 1101111

	ctxtmap "a",        $a0, 0110
	ctxtmap "b",        $a1, 1101001
	ctxtmap "c",        $a2, 110010
	ctxtmap "d",        $a3, 111110
	ctxtmap "e",        $a4, 000
	ctxtmap "f",        $a5, 1111111
	ctxtmap "g",        $a6, 010010
	ctxtmap "h",        $a7, 00111
	ctxtmap "i",        $a8, 11110
	ctxtmap "j",        $a9, 110000100
	ctxtmap "k",        $aa, 0011000
	ctxtmap "l",        $ab, 10110
	ctxtmap "m",        $ac, 110011
	ctxtmap "n",        $ad, 11101
	ctxtmap "o",        $ae, 0101
	ctxtmap "p",        $af, 011110
	ctxtmap "q",        $b0, 110000010
	ctxtmap "r",        $b1, 11100
	ctxtmap "s",        $b2, 0010
	ctxtmap "t",        $b3, 1010
	ctxtmap "u",        $b4, 10111
	ctxtmap "v",        $b5, 1101100
	ctxtmap "w",        $b6, 1101101
	ctxtmap "x",        $b7, 110000000
	ctxtmap "y",        $b8, 011100
	ctxtmap "z",        $b9, 0100111000

	ctxtmap "É",        $ba, 00110011111011
	ctxtmap "Ç",        $bb, 1101110001110
	ctxtmap "-",        $bc, 11000011
	ctxtmap ":",        $bd, 1111110011
	ctxtmap "♂",        $be, 001100111110000000
	ctxtmap "♀",        $bf, 0100111011011100001

; Français, 2e vague — les CAPITALES accentuées qu'exige la casse mixte (D3).
; Cédé leur case : les guillemets courbes “ ” (56 usages anglais, ZÉRO en
; français — cf. CONVENTIONS.md §4), la ligature 's (66 usages en français
; contre 1 970 en anglais) et le signe × (8 étiquettes de prix, remplacé par
; un x minuscule à deux pixels près).
; Ni PILAR, ni le lecteur de musique, ni les cœurs n'ont été touchés.
;
; Français, 1re vague : les contractions anglaises 'd 'l 'm 'r 't 'v, la capitale É et
; les accentuées espagnoles í ó ont cédé leur case aux accents français.
; Les codes Huffman sont CONSERVÉS tels quels : seul le libellé des feuilles
; change, l'arbre garde sa forme. Ils seront réoptimisés par `make huffman`
; une fois le texte traduit. Registre : translation/CHARMAP.md
	ctxtmap "'",        $c0, 1100011
	ctxtmap "à",        $c1, 0100111001
	ctxtmap "â",        $c2, 11011100011011
	ctxtmap "ç",        $c3, 110111000101
	ctxtmap "è",        $c4, 11000100000
	ctxtmap "Î",        $c5, 010011101101111
	ctxtmap "ê",        $c6, 11000100001
	ctxtmap "î",        $c7, 110001000110

	ctxtmap "é",        $c8, 01001100
	ctxtmap "ô",        $c9, 1101110001001
	ctxtmap "á",        $ca, 00110011111000001
	ctxtmap "<BOLDH>",  $cb, 0100111011011100000
	ctxtmap "ù",        $cc, 00110011111010
	ctxtmap "û",        $cd, 11011100011010

	ctxtmap "¿",        $ce, 010011101101110010
	ctxtmap "¡",        $cf, 0011001111100011111

	ctxtmap "<PO>",     $d0, 0011001111100011110
	ctxtmap "<KE>",     $d1, 0011001111100011101
	ctxtmap "<PK>",     $d2, 0011001111100111
	ctxtmap "<MN>",     $d3, 0011001111100110

	ctxtmap "<ID>",     $d4, 0011001111100011100
	ctxtmap "№",        $d5, 010011101101110001
	ctxtmap "<LV>",     $d6, 11000100010101001
	ctxtmap "<BOLDP>",  $d7, 00110011111000110

	ctxtmap "&",        $d8, 1100010001010000

	ctxtmap "♪",        $d9, 010011101101101
	ctxtmap "♥",        $da, 1100010001010101

	ctxtmap "Â",        $db, 0011001111100000011
	ctxtmap "/",        $dc, 010011101101100
	ctxtmap "%",        $dd, 010011101101110011

	ctxtmap "+",        $de, 1100010001010001
	ctxtmap "<SHARP>",  $df, 0011001111100000010

	ctxtmap "0",        $e0, 111111001010
	ctxtmap "1",        $e1, 1111110010111
	ctxtmap "2",        $e2, 1111110010110
	ctxtmap "3",        $e3, 1101110001111
	ctxtmap "4",        $e4, 1100010001011
	ctxtmap "5",        $e5, 1100010001000
	ctxtmap "6",        $e6, 01001110110101
	ctxtmap "7",        $e7, 110001000101011
	ctxtmap "8",        $e8, 010011101101001
	ctxtmap "9",        $e9, 110001000101001

	ctxtmap "¥",        $ea, 11011100010001

	ctxtmap "…",        $eb, 110111001

	charmap "★",        $ec

	charmap "▼",        $ed
	charmap "▲",        $ee
	charmap "◀",        $ef
	charmap "▶",        $f0
	charmap "▷",        $f1

; common font:
	charmap "↑",        $f2
	charmap "↓",        $f3
	charmap "′",        $f4
	charmap "″",        $f5
	charmap "<PHONE>",  $f6
	charmap "<BLACK>",  $f7

; frame:
	charmap "┌",        $f8
	charmap "─",        $f9
	charmap "┐",        $fa
	charmap "│",        $fb
	charmap "┃",        $fc
	charmap "└",        $fd
	charmap "━",        $fe
	charmap "┘",        $ff


DEF NGRAMS_START EQU $0a

	newcharmap compressing, no_ngrams

	ctxtmap "#",        $4d, 01001110111
	ctxtmap "#mon",     $4e, 00110110
DEF NGRAMS_VAR_START EQU $4f
	; these below are implemented as n-grams whose string is stored in WRAM
	ctxtmap "<PLAYER>", $4f, 0011001110
	ctxtmap "<RIVAL>",  $50, 0100111011011101
	ctxtmap "<TRENDY>", $51, 0011001111100001

	newcharmap default, compressing

	charmap "ou",       $0a
	charmap "th",       $0b
	charmap "in",       $0c
	charmap "t ",       $0d
	charmap "er",       $0e
	charmap "s ",       $0f
	charmap "an",       $10
	charmap "on",       $11
	charmap "to ",      $12
	charmap "d ",       $13
	charmap "ea",       $14
	charmap "y ",       $15
	charmap "en",       $16
	charmap "or",       $17
	charmap "at",       $18
	charmap ", ",       $19
	charmap "ll",       $1a
	charmap "I ",       $1b
	charmap "ar",       $1c
	charmap "it",       $1d
	charmap "st",       $1e
	charmap "ow",       $1f
	charmap "ha",       $20
	charmap "a ",       $21
	charmap "om",       $22
	charmap "le",       $23
	charmap "of ",      $24
	charmap "se",       $25
	charmap "re",       $26
	charmap "to",       $27
	charmap "'s ",      $28
	charmap "Th",       $29
	charmap "is",       $2a
	charmap "ra",       $2b
	charmap "ch",       $2c
	charmap "I'm ",     $2d
	charmap "o ",       $2e
	charmap "gh",       $2f
	charmap "es",       $30
	charmap "wa",       $31
	charmap "e.",       $32
	charmap "oo",       $33
	charmap "ck",       $34
	charmap "r ",       $35
	charmap "l ",       $36
	charmap "be",       $37
	charmap "li",       $38
	charmap "ed",       $39
	charmap "us",       $3a
	charmap "ti",       $3b
	charmap " you",     $3c
	charmap "ing ",     $3d
	charmap "the ",     $3e
	charmap "you",      $3f
	charmap "ing",      $40
	charmap "is ",      $41
	charmap "the",      $42
	charmap "You ",     $43
	charmap "er ",      $44
	charmap "with",     $45
	charmap "batt",     $46
	charmap "for",      $47
	charmap "ve ",      $48
	charmap "ed ",      $49
	charmap "It's ",    $4a
	charmap "that ",    $4b
	charmap "e ",       $4c

DEF NGRAMS_END EQU $51

	setcharmap default


MACRO rawchar
	setcharmap no_ngrams
	db \#
	setcharmap default
ENDM
