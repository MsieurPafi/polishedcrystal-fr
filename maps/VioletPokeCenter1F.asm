VioletPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, VIOLET_CITY, 5
	warp_event  6,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalFalknerScript

	def_object_events
	object_event 10,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletPokeCenter1FElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FGameboyKidText, -1
	object_event  2,  3	, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FGentlemanText, -1
	object_event  0,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FSageText, -1
	object_event 11,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FYoungsterText, -1

	object_const_def
	const VIOLETPOKECENTER1F_SCIENTIST

PokemonJournalFalknerScript:
	setflag ENGINE_READ_FALKNER_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Falkner!"

	para "People say that"
	line "Falkner reveres"
	cont "his father, who"

	para "led the Violet Gym"
	line "before him."
	done

VioletPokeCenter1FElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftruefwd .SecondTimeAsking
	writetext .IntroText
	sjumpfwd .AskTakeEgg
.SecondTimeAsking:
	writetext .QuestionText
.AskTakeEgg:
	yesorno
	iffalsefwd .RefusedEgg
	giveegg TOGEPI
	iffalse_jumpopenedtext .PartyAndBoxFull
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_LYRA_GROTTOES
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequalfwd UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkStraightMovement
	sjumpfwd .Finish
.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkAroundMovement
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkDownMovement
.Finish:
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_SCIENTIST
	waitsfx
	end

.PartyAndBoxFull:
	text "Oh, no. You can't"
	line "carry any more"
	cont "#mon with you."

	para "You have no space"
	line "in your Box, too."

	para "I'll wait here"
	line "while you make"
	cont "room for the Egg."
	done

.RefusedEgg:
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	jumpthisopenedtext

	text "B-but… Prof.Elm"
	line "asked for you…"
	done

.IntroText:
	text "<PLAYER>, long"
	line "time, no see."

	para "I was browsing the"
	line "#mon Journal"
	cont "while I waited."

	para "Its gossip is a"
	line "good pastime…"

	para "Anyway, Prof.Elm"
	line "has another favor"
	cont "to ask you."

	para "Would you take the"
	line "#mon Egg?"
	done

.QuestionText:
	text "<PLAYER>, veux-tu"
	line "prendre l'Oeuf?"
	done

.GoodbyeText:
	text "Nous avons décou-"
	line "vert qu'un #mon"

	para "ne peut naître qu'"
	line "en grandissant"
	cont "dans l'Oeuf."

	para "Il doit aussi être"
	line "en compagnie de"
	cont "#mon actifs."

	para "<PLAYER>, nous ne"
	line "pouvons que comp-"
	cont "ter sur toi."

	para "Appelle le Prof."
	line "Orme après son"
	cont "éclosion!"
	done

.WalkAroundMovement:
	step_left
	step_left
	step_down
	step_left
	step_left
	step_end

.WalkStraightMovement:
	step_down
	step_left
	step_left
	step_left
	step_left
.WalkDownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

VioletPokeCenter1FGameboyKidText:
	text "Un type du nom de"
	line "Leo a créé le"
	cont "système de stocka-"
	cont "ge de #mon."
	done

VioletPokeCenter1FGentlemanText:
	text "Ça fait plus ou"
	line "moins trois ans."

	para "La Team Rocket"
	line "était la pire en-"
	cont "nemie des #mon."

	para "Mais y'a une"
	line "justice! Un jeune"
	cont "gamin les a depuis"
	cont "détrônés."
	done

VioletPokeCenter1FSageText:
	text "Some Bellsprout"
	line "are found with"
	cont "Gold Leaves."

	para "And some Oddish"
	line "are found with"
	cont "Silver Leaves."

	para "These are valued"
	line "by a certain type"
	cont "of person."
	done

VioletPokeCenter1FYoungsterText:
	text "Les #mon"
	line "sont intelligents."

	para "Ils n'obéissent"
	line "pas aux dresseurs"
	cont "qui ne les res-"
	cont "pectent pas."

	para "Sans les Badges"
	line "appropriés, ils"

	para "n'en feront qu'à"
	line "leur tête."
	done
