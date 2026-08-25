EarlsPokemonAcademy_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PokemonJournalWalkerScript
	bg_event  1,  1, BGEVENT_READ, PokemonJournalWalkerScript
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	def_object_events
	object_event  4,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  4, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
	object_event  2,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, EarlsPokemonAcademyYoungster1Text, -1
	object_event  4,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EarlsPokemonAcademyYoungster2Text, -1
	object_event  3, 11, SPRITE_GAMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1

	object_const_def
	const EARLSPOKEMONACADEMY_EARL

AcademyEarl:
	givekeyitem TYPE_CHART ; failsafe in case Violet City Earl is gone already in a save
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalsefwd .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse_jumpopenedtext AcademyEarlNoMoreToTeachText
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse_jumpopenedtext AcademyEarlNoMoreToTeachText
	jumpthisopenedtext

	text "Fine! Teach you,"
	line "I will!"

	para "If #mon come"
	line "out in battle even"

	para "briefly, some Exp."
	line "Points it gets."

	para "At top of list put"
	line "weak #mon."

	para "Switch in battle"
	line "quick!"

	para "This way, weak"
	line "#mon strong"
	cont "become!"
	done

EarlsPokemonAcademyGameboyKid1Script:
	showtextfaceplayer EarlsPokemonAcademyGameboyKid1Text
	turnobject LAST_TALKED, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	showtextfaceplayer EarlsPokemonAcademyGameboyKid2Text
	turnobject LAST_TALKED, DOWN
	end

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .MenuHeader
	_2dmenu
	closewindow
	ifequalfwd $1, .Poison
	ifequalfwd $2, .Paralysis
	ifequalfwd $3, .Sleep
	ifequalfwd $4, .Burn
	ifequalfwd $5, .Freeze
	endtext

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	sjump .Loop

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 11, 8
	dw .Data
	db 1 ; default option

.Data:
	db $80 ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "Psn@"
	db "Par@"
	db "Slp@"
	db "Brn@"
	db "Frz@"
	db "Quit@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalsefwd .Done
	writetext AcademyNotebookText1
	yesorno
	iffalsefwd .Done
	writetext AcademyNotebookText2
	yesorno
	iffalsefwd .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	endtext

PokemonJournalWalkerScript:
	setflag ENGINE_READ_WALKER_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Ex-Leader Walker!"

	para "Falkner's father"
	line "Walker is rumored"

	para "to be wandering"
	line "around Johto as"
	cont "a vagabond."
	done

AcademyEarlSpinMovement:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

AcademyEarlIntroText:
	text "Theophile est"
	line "mon nom!"

	para "Sensationnels sont"
	line "les #mon!"

	para "Te transmettre"
	line "quelques petits"
	cont "conseils au niveau"
	cont "me maintiendra!"

	para "Que veux-tu"
	line "savoir?"
	cont "Comment devenir"
	cont "maître?"
	done

AcademyEarlTeachHowToWinText:
	text "Très bien!"
	line "Ton éducation je"
	cont "ferai!"

	para "En combat, le"
	line "premier #mon de"
	cont "ta liste sort le"
	cont "premier!"

	para "Changer l'ordre de"
	line "la liste peut"
	cont "t'aider à gagner"
	cont "ou perdre!"

	para "Tu veux en savoir"
	line "plus?"
	done

AcademyEarlTeachMoreText:
	text "Alors, on veut"
	line "savoir comment"
	cont "bien élever ses"
	cont "p'tits #mon?"
	done


AcademyEarlNoMoreToTeachText:
	text "Tu fais attention!"
	line "C'est bien! Je"
	cont "n'ai plus rien à"
	cont "t'apprendre!"

	para "Aime fort tes"
	line "#mon!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Je prends note de"
	line "ce cours bien"
	cont "utile."

	para "C'est sûrement"
	line "utile de copier ce"
	cont "qu'il y a au"
	cont "tableau."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "J'ai échangé mon"
	line "meilleur #mon"
	cont "avec celui du gars"
	cont "à côté de moi."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "Hein? Le #mon"
	line "que je viens"
	cont "d'avoir tient"
	cont "quelque chose!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "Un #mon tenant"
	line "une Baie se soi-"
	cont "gnera tout seul en"
	cont "combat."

	para "Beaucoup d'autres"
	line "objets peuvent"
	cont "être tenus par les"
	cont "#mon..."

	para "Ecrire..."
	line "C'est dur..."
	done

AcademyBlackboardText:
	text "Le tableau indique"
	line "les changements de"

	para "statut des"
	line "#mon pendant"
	cont "les combats."
	done

AcademyPoisonText:
	text "Empoisonné, votre"
	line "#mon perd"
	cont "régulièrement des"
	cont "PV."

	para "Le poison agit"
	line "même après le"

	para "combat et vous"
	line "perdrez des PV en"
	cont "marchant."

	para "Seul remède connu"
	line "à ce jour:"
	cont "l'antidote."
	done

AcademyParalysisText:
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a ParalyzeHeal."
	done

AcademySleepText:
	text "Endormi, votre"
	line "#mon ne peut"
	cont "pas réagir."

	para "Un #mon endormi"
	line "ne se réveille pas"
	cont "après le combat."

	para "Réveillez-le avec"
	line "un réveil."
	done

AcademyBurnText:
	text "Une brûlure con-"
	line "somme des PV. Elle"

	para "réduit aussi la"
	line "force d'attaque."

	para "La brûlure conti-"
	line "nue même après le"
	cont "combat."

	para "Utilisez de"
	line "l'anti-brûlé pour"
	cont "la soigner."
	done

AcademyFreezeText:
	text "Si votre #mon"
	line "est gelé, il ne"
	cont "pourra rien faire."

	para "Le gel continue"
	line "après le combat."

	para "Mieux qu'un radia-"
	line "teur, l'antigel"
	cont "le réchauffera!"
	done

AcademyNotebookText:
	text "C'est le cahier de"
	line "ce gamin..."

	para "Attrapez les"
	line "#mon en lançant"
	cont "les # Balls."

	para "Vous pouvez trans-"
	line "porter six #mon"
	cont "avec vous."

	para "Continuer à lire?"
	done

AcademyNotebookText1:
	text "Avant de lancer"
	line "une # Ball,"
	cont "affaiblissez le"
	cont "#mon."

	para "Un #mon brûlé"
	line "ou empoisonné est"
	cont "plus facile à"
	cont "attraper."

	para "Continuer à lire?"
	done

AcademyNotebookText2:
	text "Certaines capaci-"
	line "tés peuvent em-"
	cont "brouiller l'esprit"
	cont "du #mon"
	cont "adverse."

	para "Une fois confus,"
	line "le #mon peut"
	cont "s'attaquer lui-"
	cont "même."

	para "Fuir le combat"
	line "annule tout effet"
	cont "de confusion."

	para "Continuer à lire?"
	done

AcademyNotebookText3:
	text "People who catch"
	line "and use #mon"

	para "in battle are"
	line "#mon trainers."

	para "They are expected"
	line "to visit #mon"

	para "Gyms and defeat"
	line "other trainers."

	para "The next page"
	line "is… Blank!"

	para "Boy: E-he-he…"

	para "I haven't written"
	line "any more…"
	done
