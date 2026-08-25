Route40_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MonicaCallback

	def_warp_events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_JUMPTEXT, Route40SignText
	bg_event  7,  8, BGEVENT_ITEM + HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

	def_object_events
	object_event  7, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event 13, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermSimon, -1
	object_event 18, 33, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfElaine, -1
	object_event  9, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfPaula, -1
	object_event 11, 13, SPRITE_BEACH_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40BeachGirlText, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40PicnickerText, -1
	object_event 14,  8, SPRITE_BEACH_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40BeachGuyScript, -1
	object_event 16, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40FisherScript, -1
	smashrock_event  8, 10
	smashrock_event  6, 9
	smashrock_event  7, 8

	object_const_def
	const ROUTE40_MONICA

MonicaCallback:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	endcallback

.MonicaAppears:
	appear ROUTE40_MONICA
	endcallback

GenericTrainerSwimmerfElaine:
	generictrainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText

	text "I'd say I'm a bet-"
	line "ter swimmer than"
	cont "you. Yeah!"
	done

GenericTrainerSwimmerfPaula:
	generictrainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText

	text "While I float like"
	line "this, the waves"
	cont "carry me along."
	done

GenericTrainerSwimmermSimon:
	generictrainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText

	text "Cianwood City is"
	line "a good distance"
	cont "away from here."
	done

GenericTrainerSwimmermRandall:
	generictrainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText

	text "Swimming exercises"
	line "your entire body."
	cont "It's healthy."
	done

Route40PokefanMScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer Route40PokefanMText2
	jumpthistextfaceplayer

	text "Hm! There's a big"
	line "building up ahead!"

	para "What is it?"
	done

Route40BeachGuyScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer Route40BeachGuyText2
	jumpthistextfaceplayer

	text "The Battle Tower"
	line "is almost ready!"

	para "Trainers are head-"
	line "ing to Olivine"

	para "from all over the"
	line "world to test"
	cont "their strength."
	done

Route40FisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_KNOCK_OFF_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_KNOCK_OFF_INTRO
.HeardIntro:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval KNOCK_OFF
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "I'll find something"
	line "else to do…"
	done

.IntroText:
	text "I was fishing when"
	line "some #mon leap-"
	cont "ed up and knocked"

	para "my Rod into the"
	line "water!"

	para "How will I catch"
	line "anything now?"

	para "…Well then, if I"
	line "can't fish, I'll"
	cont "just teach."
	done

.QuestionText:
	text "You give me a"
	line "Silver Leaf and"

	para "I'll teach your"
	line "#mon Knock Off."

	para "How about that?"
	done

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "No Leaf, no move."
	line "My time isn't free."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Knock Off knocks"
	line "a held item away"

	para "so it can't be used"
	line "in battle."

	para "It's so frustra-"
	line "ting!"
	done

MonicaScript:
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue_jumptextfaceplayer MonicaMondayText
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, MonicaNotMondayScript
	faceplayer
	opentext
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftruefwd .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalsefwd MonicaDoneScript
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	jumpthisopenedtext

	text "Monica: It's an"
	line "item that raises"

	para "the power of Fly-"
	line "ing-type moves."

	para "You should equip a"
	line "bird #mon with"
	cont "that item."
	done

MonicaNotMondayScript:
	jumpthistextfaceplayer

	text "Monica: I don't"
	line "think today is"
	cont "Monday. How sad…"
	done

MonicaDoneScript:
	end

SwimmermSimonSeenText:
	text "Il faut s'échauf-"
	line "fer avant de se"
	cont "baigner."

	para "Tout le monde sait"
	line "ça!"
	done

SwimmermSimonBeatenText:
	text "Aïe! Une crampe!"
	done

SwimmermRandallSeenText:
	text "T'as la flemme ou"
	line "quoi?"

	para "Nage au lieu de"
	line "monter sur ton"
	cont "#mon!"
	done

SwimmermRandallBeatenText:
	text "Zut de flûte."
	done

SwimmerfElaineSeenText:
	text "Tu vas à Irisia?"

	para "On s'bat d'abord?"
	done

SwimmerfElaineBeatenText:
	text "C'est perdu!"
	done

SwimmerfPaulaSeenText:
	text "J'adore les #-"
	line "mon marins!"
	done

SwimmerfPaulaBeatenText:
	text "Oups!"
	done

Route40BeachGirlText:
	text "I just ate at the"
	line "Olivine Café, so"

	para "I'm taking a break"
	line "before swimming."
	done


Route40PokefanMText2:
	text "Hmm! Tu as vu tous"
	line "les dresseurs"
	cont "qui sont entrés?"

	para "C'est quoi donc?"
	done

Route40PicnickerText:
	text "Je suis venue à"
	line "Oliville pour"

	para "voir les beaux"
	line "paysages..."

	para "La mer, c'est bô."
	done


Route40BeachGuyText2:
	text "As-tu visité la"
	line "Tour de Combat?"

	para "Plein de"
	line "dresseurs super"

	para "puissants s'y sont"
	line "réunis."

	para "Mais vu que tu as"
	line "des Badges, tu"

	para "devrais t'en"
	line "tirer."
	done

MeetMonicaText:
	text "Lucie: Bonjour!"
	line "Je suis Lucie du"

	para "lundi."
	done

MonicaGivesGiftText:
	text "Puisqu'on est des"
	line "potes, voilà un"
	cont "petit cadeau!"
	done


MonicaMondayText:
	text "Lucie: Mes frères"
	line "et soeurs sont un"
	cont "peu partout."

	para "Trouve-les tous!"
	done


Route40SignText:
	text "route 40"

	para "Irisia -"
	line "Oliville"
	done
