DragonShrine_MapScriptHeader:
	def_scene_scripts
	scene_script DragonShrineTakeTestScene, SCENE_DRAGONSHRINE_TAKE_TEST
	scene_const SCENE_DRAGONSHRINE_NOOP

	def_callbacks

	def_warp_events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  4,  8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DragonShrineElder2Text, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DragonShrineElder3Text, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

	object_const_def
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_CLAIR

DragonShrineTakeTestScene:
	sdefer DragonShrineTestScript
	end

DragonShrineTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applyonemovement DRAGONSHRINE_ELDER1, slow_step_down
	opentext
	writetext DragonShrineElderGreetingText
	promptbutton
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	promptbutton
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .RightAnswer
	ifequalfwd $2, .WrongAnswer
	ifequalfwd $3, .RightAnswer
	end

.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	promptbutton
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .RightAnswer
	ifequalfwd $2, .RightAnswer
	ifequalfwd $3, .WrongAnswer
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	promptbutton
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .WrongAnswer
	ifequalfwd $2, .RightAnswer
	ifequalfwd $3, .RightAnswer
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	promptbutton
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .RightAnswer
	ifequalfwd $2, .WrongAnswer
	ifequalfwd $3, .RightAnswer
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	promptbutton
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .WrongAnswer
	ifequalfwd $2, .WrongAnswer
	ifequalfwd $3, .RightAnswer
.RightAnswer:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftruefwd .PassedTheTest
	writetext DragonShrineRightAnswerText
	promptbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question2
.WrongAnswer:
	closetext
	turnobject DRAGONSHRINE_ELDER1, LEFT
	showtext DragonShrineWrongAnswerText1
	turnobject DRAGONSHRINE_ELDER1, DOWN
	showtext DragonShrineWrongAnswerText2
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	turnobject PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	turnobject DRAGONSHRINE_CLAIR, RIGHT
	turnobject PLAYER, LEFT
	turnobject DRAGONSHRINE_ELDER1, LEFT
	showtext DragonShrineClairYouPassedText
	special Special_FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	showtext DragonShrineClairThatCantBeText
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	showtext DragonShrineClairYoureLyingText
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	turnobject DRAGONSHRINE_CLAIR, UP
	showtext DragonShrineMustIInformLanceText
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	showtext DragonShrineIUnderstandText
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairTwoSlowStepsRightMovement
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	givebadge RISINGBADGE, JOHTO_REGION
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene SCENE_DRAGONSHRINE_NOOP
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway1Movement
	turnobject DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway2Movement
	turnobject PLAYER, UP
	showtext DragonShrineElderScoldsClairText
	showtext DragonShrineSpeechlessText
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptextfaceplayer DragonShrineComeAgainText
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue_jumptextfaceplayer DragonShrineSymbolicDragonText
	checkevent EVENT_GOT_DRATINI
	iffalsefwd .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue_jumptextfaceplayer DragonShrineSilverIsInTrainingText
	jumpthistextfaceplayer

	text "Clair appears to"
	line "have learned an"

	para "invaluable lesson"
	line "from you."

	para "I thank you as her"
	line "grandfather."
	done

.GiveDratini:
	faceplayer
	opentext
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	iftruefwd .NoExtremeSpeed
	givepoke DRATINI, PLAIN_FORM, 15, SITRUS_BERRY, ULTRA_BALL, EXTREMESPEED
	sjumpfwd .FinishElderScript
.NoExtremeSpeed
	givepoke DRATINI, PLAIN_FORM, 15, SITRUS_BERRY, ULTRA_BALL
.FinishElderScript
	iffalse_jumpopenedtext DragonShrinePartyAndBoxFullText
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	jumpopenedtext DragonShrineSymbolicDragonText

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 8, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Ally@"
	db "Underling@"
	db "Friend@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 9, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Strategy@"
	db "Training@"
	db "Cheating@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 5, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Weak person@"
	db "Tough person@"
	db "Anybody@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 8, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Love@"
	db "Violence@"
	db "Knowledge@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 11, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Strong@"
	db "Weak@"
	db "Both@"

DragonShrinePlayerWalkInMovement:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_right
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step_left
	slow_step_left
	slow_step_left
	turn_head_down
	step_end

DragonShrineElderWalkAway1Movement:
	slow_step_right
	slow_step_right
	step_end

DragonShrineElderWalkAway2Movement:
	slow_step_right
	turn_head_down
	step_end

DragonShrineClairWalkInMovement:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	run_step_left
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step_left
	remove_fixed_facing
	step_end

DragonShrineClairTwoSlowStepsRightMovement:
	slow_step_right
	slow_step_right
	step_end

DragonShrineClairWalkOutMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

DragonShrineElderGreetingText:
	text "Hmm..."
	line "Bienvenue."

	para "Ne parle pas."

	para "Sandra t'a dit de"
	line "venir, non?"

	para "Coriace la petite,"
	line "non?"

	para "Je dois te mettre"
	line "à l'épreuve."

	para "Tu ne dois répon-"
	line "dre qu'à quelques"
	cont "questions."

	para "On commence?"
	done

DragonShrineQuestion1Text:
	text "Que représente un"
	line "#mon à tes"
	cont "yeux?"
	done

DragonShrineQuestion2Text:
	text "Qu'est-ce qui aide"
	line "à gagner les"
	cont "combats?"
	done

DragonShrineQuestion3Text:
	text "Quel type de"
	line "dresseur veux-tu"
	cont "affronter?"
	done

DragonShrineQuestion4Text:
	text "Quelle est la cho-"
	line "se la plus impor-"
	cont "tante en entraî-"
	cont "nant les #mon?"
	done

DragonShrineQuestion5Text:
	text "#mon puissant."
	line "#mon faible."

	para "Lequel est le plus"
	line "important?"
	done

DragonShrinePassedTestText:
	text "Hmm... Je vois..."

	para "Tu as de vrais"
	line "sentiments pour"
	cont "les #mon."

	para "C'est bien ça."

	para "C'est très impor-"
	line "tant!"

	para "<PLAYER>, ne"
	line "change jamais."

	para "Cela t'aidera"
	line "pour la Ligue"
	cont "#mon."
	done

DragonShrineMustIInformLanceText:
	text "Clair!"

	para "This child is"
	line "impeccable, in"
	cont "skill and spirit!"

	para "Admit defeat and"
	line "confer the Rising"
	cont "Badge!"

	para "…Or must I inform"
	line "Lance of this?"
	done

DragonShrineElderScoldsClairText:
	text "Sandra..."

	para "Penche-toi sur"
	line "tes lacunes..."

	para "Prends exemple sur"
	line "<PLAYER>."
	done

DragonShrineComeAgainText:
	text "N'hésite pas à"
	line "revenir en ce"
	cont "saint lieu."
	done

DragonShrineTakeThisDratiniText:
	text "Hmm..."
	line "Bienvenue."

	para "Tu tombes au bon"
	line "moment."

	para "J'ai quelque chose"
	line "pour toi."

	para "Ce Minidraco est"
	line "la preuve de ta"
	cont "valeur..."
	done

DragonShrinePartyAndBoxFullText:
	text "Hm? Your party and"
	line "Box are both full."
	done

DragonShrineSymbolicDragonText:
	text "Les #mon dra-"
	line "gons représentent"
	cont "notre clan."

	para "Tu es digne d'en"
	line "posséder un."
	done


DragonShrineSilverIsInTrainingText:
	text "Un garçon de ton"
	line "âge s'entraîne"
	cont "ici."

	para "Il est comme l'é-"
	line "tait Sandra plus"

	para "jeune. Je suis"
	line "très inquiet..."
	done

DragonShrineWrongAnswerText1:
	text "Hein? J'ai pas"
	line "tout compris..."
	done

DragonShrineWrongAnswerText2:
	text "Qu'as-tu dit?"
	done

DragonShrineRightAnswerText:
	text "Oh, je vois..."
	done

DragonShrineElder2Text:
	text "Cela fait long-"
	line "temps que notre"

	para "maître n'a pas"
	line "cautionné un"
	cont "dresseur."

	para "Pas une seule fois"
	line "depuis Peter."
	done

DragonShrineElder3Text:
	text "Tu connais"
	line "Maître Peter?"

	para "Il ressemble à"
	line "notre maître étant"
	cont "jeune."

	para "C'est dans leur"
	line "sang."
	done

DragonShrineClairYouPassedText:
	text "Comment c'était?"

	para "Je ne vois pas"
	line "pourquoi je deman-"
	cont "de..."

	para "Tu as échoué,"
	line "n'est-ce pas?"

	para "………………………………"

	para "...Quoi? Réussi?"
	done

DragonShrineClairThatCantBeText:
	text "Y'a maldonne!"
	done

DragonShrineClairYoureLyingText:
	text "Tu mens!"

	para "Même moi j'ai pas"
	line "réussi!"
	done

DragonShrineIUnderstandText:
	text "Je... Je vois."
	done

DragonShrineHereRisingBadgeText:
	text "Here, this is the"
	line "Rising Badge…"

	para "Hurry up! Take it!"
	done

DragonShrineRisingBadgeExplanationText:
	text "The Rising Badge"
	line "will enable your"

	para "#mon to use the"
	line "move for climbing"
	cont "waterfalls."

	para "Also, all #mon"
	line "will recognize you"

	para "as a trainer and"
	line "obey your every"

	para "command without"
	line "question."
	done

DragonShrineSpeechlessText: ; text > text
	text "………………………………"
	done
