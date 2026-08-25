NewBarkTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU
	scene_const SCENE_NEWBARKTOWN_LYRA_FINAL
	scene_const SCENE_NEWBARKTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, NewBarkTownFlyPoint

	def_warp_events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event 15,  5, PLAYERS_HOUSE_1F, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 13, LYRAS_HOUSE_1F, 1
	warp_event 10,  2, ELMS_HOUSE, 2

	def_coord_events
	coord_event  1,  8, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouTrigger1
	coord_event  1,  9, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_TeacherStopsYouTrigger2
	coord_event  6,  4, SCENE_NEWBARKTOWN_TEACHER_STOPS_YOU, NewBarkTown_LyraIntroTrigger
	coord_event 19,  6, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger1
	coord_event 19,  7, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger2
	coord_event 19,  8, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger3
	coord_event 19,  9, SCENE_NEWBARKTOWN_LYRA_FINAL, NewBarkTown_LyraFinalTrigger4

	def_bg_events
	bg_event  8,  8, BGEVENT_JUMPTEXT, NewBarkTownSignText
	bg_event 13,  5, BGEVENT_JUMPTEXT, PlayersHouseSignText
	bg_event  3,  3, BGEVENT_JUMPTEXT, ElmsLabSignText
	bg_event  9, 13, BGEVENT_JUMPTEXT, LyrasHouseSignText
	bg_event  3,  2, BGEVENT_ITEM + POTION, EVENT_NEW_BARK_TOWN_HIDDEN_POTION

	def_object_events
	object_event  3,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownRivalScript, EVENT_RIVAL_NEW_BARK_TOWN
	object_event  1,  6, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_NEW_BARK_TOWN
	object_event  6,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	object_event 13,  8, SPRITE_FAT_GUY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_ElmDiscoveredNewMon, -1
	object_event  7, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_GearIsImpressive, -1

	object_const_def
	const NEWBARKTOWN_RIVAL
	const NEWBARKTOWN_LYRA
	const NEWBARKTOWN_TEACHER

NewBarkTownFlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	endcallback

NewBarkTown_TeacherStopsYouTrigger1:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	showtext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherRunsToYou1_NBT
	showtext Text_WhatDoYouThinkYoureDoing
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherBringsYouBack1_NBT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouTrigger2:
	playmusic MUSIC_MOM
	turnobject NEWBARKTOWN_TEACHER, LEFT
	showtext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherRunsToYou2_NBT
	turnobject PLAYER, UP
	showtext Text_WhatDoYouThinkYoureDoing
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherBringsYouBack2_NBT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

NewBarkTown_LyraIntroTrigger:
	appear NEWBARKTOWN_LYRA
	special Special_FadeOutMusic
	applymovement NEWBARKTOWN_LYRA, Movement_LyraEnters_NBT
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showemote EMOTE_SHOCK, NEWBARKTOWN_LYRA, 15
	applymovement NEWBARKTOWN_LYRA, Movement_LyraApproaches_NBT
	turnobject PLAYER, LEFT
	showtext Text_LyraIntro
	follow PLAYER, NEWBARKTOWN_LYRA
	applyonemovement PLAYER, step_up
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applyonemovement NEWBARKTOWN_LYRA, step_up
	playsound SFX_EXIT_BUILDING
	disappear NEWBARKTOWN_LYRA
	setscene SCENE_NEWBARKTOWN_NOOP
	special FadeOutPalettes
	pause 15
	warpfacing UP, ELMS_LAB, 4, 11
	end

NewBarkTown_LyraFinalTrigger1:
	moveobject NEWBARKTOWN_LYRA, 16, 11
	sjumpfwd NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger2:
	moveobject NEWBARKTOWN_LYRA, 16, 12
	sjumpfwd NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger3:
	moveobject NEWBARKTOWN_LYRA, 16, 13
	sjumpfwd NewBarkTown_LyraFinalTrigger

NewBarkTown_LyraFinalTrigger4:
	moveobject NEWBARKTOWN_LYRA, 16, 14
NewBarkTown_LyraFinalTrigger:
	appear NEWBARKTOWN_LYRA
	applymovement NEWBARKTOWN_LYRA, Movement_LyraSaysGoodbye1_NBT
	showemote EMOTE_SHOCK, NEWBARKTOWN_LYRA, 15
	special Special_FadeOutMusic
	pause 15
	applymovement NEWBARKTOWN_LYRA, Movement_LyraSaysGoodbye2_NBT
	turnobject PLAYER, LEFT
	showtext Text_LyraGoodbye1
	setevent EVENT_LYRA_NEW_BARK_TOWN
	winlosstext Text_LyraGoodbyeWin, Text_LyraGoodbyeLoss
	setlasttalked NEWBARKTOWN_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	loadtrainer LYRA1, LYRA1_10
	sjumpfwd .AfterBattle

.Totodile:
	loadtrainer LYRA1, LYRA1_11
	sjumpfwd .AfterBattle

.Chikorita:
	loadtrainer LYRA1, LYRA1_12
.AfterBattle
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	showtext Text_LyraGoodbye2
	applymovement NEWBARKTOWN_LYRA, Movement_LyraSaysGoodbye3_NBT
	disappear NEWBARKTOWN_LYRA
	setscene SCENE_NEWBARKTOWN_NOOP
	playmapmusic
	end

NewBarkTownTeacherScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue_jumptextfaceplayer Text_CallMomOnGear
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer Text_TellMomIfLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptextfaceplayer Text_YourMonIsAdorable
	jumpthistextfaceplayer

	text "There's always"
	line "such a refreshing"
	cont "breeze here."
	done

NewBarkTownRivalScript:
	showtext NewBarkTownRivalText1
	turnobject NEWBARKTOWN_RIVAL, LEFT
	showtext NewBarkTownRivalText2
	turnobject PLAYER, UP
	applyonemovement PLAYER, fix_facing
	follow PLAYER, NEWBARKTOWN_RIVAL
	applyonemovement PLAYER, step_down
	stopfollow
	pause 5
	turnobject NEWBARKTOWN_RIVAL, DOWN
	pause 5
	playsound SFX_TACKLE
	applyonemovement PLAYER, jump_step_down
	applyonemovement PLAYER, remove_fixed_facing
	applyonemovement NEWBARKTOWN_RIVAL, step_right
	end

Movement_TeacherRunsToYou1_NBT:
	step_left
	step_left
	step_left
	step_left
	step_end

Movement_TeacherRunsToYou2_NBT:
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_down
	step_end

Movement_TeacherBringsYouBack2_NBT:
	step_right
Movement_TeacherBringsYouBack1_NBT:
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

Movement_LyraEnters_NBT:
	step_right
	step_right
	step_end

Movement_LyraApproaches_NBT:
	step_right
	step_up
	step_up
	step_right
	step_end

Movement_LyraSaysGoodbye1_NBT:
	step_up
	step_up
	step_end

Movement_LyraSaysGoodbye2_NBT:
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end

Movement_LyraSaysGoodbye3_NBT:
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Text_GearIsImpressive:
	text "Oh! Ton #matos"
	line "est balèze!"

	para "C'est ta mère qui"
	line "l'a acheté?"
	done


Text_WaitPlayer:
	text "Attends, <PLAYER>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "On peut savoir ce"
	line "que tu fabriques?"
	done

Text_ItsDangerousToGoAlone:
	text "C'est dangereux de"
	line "sortir sans un"
	cont "#mon!"

	para "Des #mon sauva-"
	line "ges sortent des"

	para "herbes sur la rou-"
	line "te de la prochaine"
	cont "ville."
	done

Text_YourMonIsAdorable:
	text "Oh! Ton #mon"
	line "est adorable!"
	cont "Je veux le même!"
	done

Text_TellMomIfLeaving:
	text "Salut <PLAYER>!"
	line "Tu pars déjà?"

	para "Tu devrais préve-"
	line "nir ta petite"
	cont "maman."
	done

Text_CallMomOnGear:
	text "Appelle ta maman"
	line "avec ton #-"
	cont "matos et donne-lui"

	para "de tes nouvelles."
	done

Text_ElmDiscoveredNewMon:
	text "Yo, <PLAYER>!"

	para "Il paraît que le"
	line "Prof.Orme a décou-"
	cont "vert de nouveaux"
	cont "#mon."
	done

NewBarkTownRivalText1:
	text "................"

	para "Voici donc le cé-"
	line "lèbre Labo #mon"
	cont "du Prof.Orme..."
	done

NewBarkTownRivalText2:
	text "...Mais kess-tu"
	line "mates?"
	done

Text_LyraIntro:
	text "Lyra: Oh, hello,"
	line "<PLAYER>!"

	para "I came by your"
	line "house earlier,"

	para "but you were"
	line "still sleeping."

	para "You know how I"
	line "assist Prof.Elm"
	cont "sometimes?"

	para "He's starting new"
	line "#mon research"

	para "and would like us"
	line "both to help."

	para "Let's go and see"
	line "what he wants!"
	done

Text_LyraGoodbye1:
	text "Lyra: <PLAYER>!"

	para "I heard that you"
	line "have all the Gym"
	cont "Badges in Johto."

	para "…You're really"
	line "something,"
	cont "<PLAYER>."

	para "To think that we"
	line "both started our"

	para "journeys in this"
	line "town…"

	para "I do what I can"
	line "to help the Prof-"
	cont "essor, but I could"

	para "never take on the"
	line "League Champion."

	para "…Before you go…"

	para "How about one"
	line "more battle?"

	para "I want to see the"
	line "kind of trainer"
	cont "you've become!"
	done

Text_LyraGoodbyeWin:
	text "You're as talented"
	line "as I expected!"
	done

Text_LyraGoodbyeLoss:
	text "I hope you didn't"
	line "let me win…"
	done

Text_LyraGoodbye2:
	text "…Thanks, <PLAYER>."

	para "I can tell how"
	line "much work and"

	para "love you put into"
	line "raising your"
	cont "#mon."

	para "…So, this is"
	line "goodbye."

	para "I know you can win"
	line "at the #mon"
	cont "League!"

	para "You're going to be"
	line "a great Champion!"
	done

NewBarkTownSignText:
	text "Bourg Geon"

	para "La ville où"
	line "souffle le vent"
	cont "d'une nouvelle vie"
	done

PlayersHouseSignText:
	text "maison de <PLAYER>"
	done

ElmsLabSignText:
	text "Labo #mon du"
	line "Prof.Orme"
	done

LyrasHouseSignText:
	text "Lyra's House"
	done
