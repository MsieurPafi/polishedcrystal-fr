RuinsOfAlphOutside_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsOfAlphOutsideOpenSinjohChamberScene, SCENE_RUINSOFALPHOUTSIDE_OPEN_SINJOH_CHAMBER
	scene_const SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphOutsideTileScript
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphOutsideScientistCallback

	def_warp_events
	warp_event  7, 17, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event 15,  5, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  7, 29, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event 15, 31, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event 11, 18, RUINS_OF_ALPH_ENTRANCE_CHAMBER, 1
	warp_event 12, 18, RUINS_OF_ALPH_ENTRANCE_CHAMBER, 2
	warp_event 19, 17, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  2, 17, UNION_CAVE_B1F_NORTH, 1
	warp_event  2, 29, UNION_CAVE_B1F_NORTH, 2
	warp_event 11,  1, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 23, 22, ROUTE_32_RUINS_OF_ALPH_GATE, 1
	warp_event 23, 23, ROUTE_32_RUINS_OF_ALPH_GATE, 2
	warp_event  7, 11, RUINS_OF_ALPH_SINJOH_CHAMBER, 1
	warp_event 23, 36, HIDDEN_CAVE_GROTTO, 1

	def_coord_events
	coord_event 11, 20, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene

	def_bg_events
	bg_event 16, 12, BGEVENT_JUMPTEXT, RuinsOfAlphOutsideMysteryChamberSignText
	bg_event 10, 19, BGEVENT_JUMPTEXT, RuinsOfAlphOutsideMysteriousHallSignText
	bg_event  9,  5, BGEVENT_JUMPTEXT, RuinsOfAlphSignText
	bg_event 21, 21, BGEVENT_JUMPTEXT, RuinsOfAlphSignText
	bg_event 18, 18, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterSignText
	bg_event 21, 11, BGEVENT_JUMPTEXT, RuinsOfAlphAdvancedTipsSignText
	bg_event  7, 11, BGEVENT_IFNOTSET, MapRuinsofAlphOutsideSealedCaveSign
	bg_event  4,  3, BGEVENT_ITEM + RARE_CANDY, EVENT_RUINS_OF_ALPH_OUTSIDE_HIDDEN_RARE_CANDY
	bg_event  5, 34, BGEVENT_ITEM + NUGGET, EVENT_RUINS_OF_ALPH_OUTSIDE_HIDDEN_NUGGET
	bg_event 15, 23, BGEVENT_ITEM + BIG_MUSHROOM, EVENT_RUINS_OF_ALPH_OUTSIDE_HIDDEN_BIG_MUSHROOM
	bg_event 23, 35, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_RUINS_OF_ALPH

	def_object_events
	object_event 12, 20, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 19, 19, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST_CLIMAX
	object_event  5, 18, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPsychicNathan, -1
	object_event  5, 33, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSuperNerdStan, -1
	object_event 10, 23, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event 13, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 15, 21, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	itemball_event  2,  9, HYPER_POTION, 1, EVENT_RUINS_OF_ALPH_OUTSIDE_HYPER_POTION
	smashrock_event  0,  4
	smashrock_event  0,  9
	smashrock_event  1,  8
	smashrock_event  5,  3
	smashrock_event  6,  2
	smashrock_event  8,  3

	object_const_def
	const RUINSOFALPHOUTSIDE_SCIENTIST1
	const RUINSOFALPHOUTSIDE_SCIENTIST2

RuinsOfAlphOutsideOpenSinjohChamberScene:
	checkevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	iffalsefwd .End
	sdefer RuinsOfAlphOutsideOpenSinjohChamberScript
.End
	end

RuinsOfAlphOutsideOpenSinjohChamberScript:
	showtext RuinsofAlphScientistClimax1Text
	follow RUINSOFALPHOUTSIDE_SCIENTIST2, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST2, RuinsofAlphScientistClimaxApproachMovementData
	stopfollow
	showemote EMOTE_SHOCK, RUINSOFALPHOUTSIDE_SCIENTIST2, 15
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST2, RIGHT
	showtext RuinsofAlphScientistClimax2Text
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST2, RuinsofAlphScientistClimaxLeaveMovementData
	disappear RUINSOFALPHOUTSIDE_SCIENTIST2
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	clearevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	setevent EVENT_RUINS_OF_ALPH_CLIMAX_DONE
	end

RuinsofAlphOutsideTileScript:
	checkevent EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	iffalsefwd .locked
	changeblock  6, 10, $2b
.locked
	endcallback

RuinsOfAlphOutsideScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftruefwd .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .MaybeScientist
	sjumpfwd .NoScientist

.MaybeScientist:
	readvar VAR_UNOWNCOUNT
	ifgreater $0, .YesScientist
	sjumpfwd .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST1
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	endcallback

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST1
	setscene SCENE_RUINSOFALPHOUTSIDE_OPEN_SINJOH_CHAMBER
	endcallback

RuinsOfAlphOutsideScientistScene:
RuinsOfAlphOutsideScientistScript:
	faceobject RUINSOFALPHOUTSIDE_SCIENTIST1, PLAYER
	faceobject PLAYER, RUINSOFALPHOUTSIDE_SCIENTIST1
	showtext RuinsOfAlphOutsideScientistText
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST1, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST1, RuinsOfAlphOutsideScientistWalkToLabMovement
	disappear RUINSOFALPHOUTSIDE_SCIENTIST1
	stopfollow
	applyonemovement PLAYER, step_up
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue_jumpopenedtext RuinsOfAlphOutsideFisherText2
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext RuinsOfAlphOutsideFisherText1
	promptbutton
	jumpthisopenedtext

RuinsOfAlphOutsideFisherText2:
	text "Il y a un secret"
	line "dans les ruines!"

	para "Enfin je crois..."
	done

RuinsOfAlphOutsideYoungster1Script:
	jumpthistextfaceplayer

	text "There are many"
	line "kinds of Unown, so"

	para "we use them for"
	line "our secret codes."
	done

RuinsOfAlphOutsideYoungster2Script:
	showtextfaceplayer RuinsOfAlphOutsideYoungster2Text
	turnobject LAST_TALKED, RIGHT
	end

GenericTrainerPsychicNathan:
	generictrainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText

	text "I like thinking"
	line "here."
	done

GenericTrainerSuperNerdStan:
	generictrainer SUPER_NERD, STAN, EVENT_BEAT_SUPER_NERD_STAN, SuperNerdStanSeenText, SuperNerdStanBeatenText

	text "The ruins are from"
	line "about 1,500 years"
	cont "ago."

	para "Nobody knows who"
	line "built them."

	para "It's also not"
	line "known if the #-"
	cont "mon statues have"
	cont "any meaning."

	para "It's all one big"
	line "mystery…"
	done

RuinsOfAlphOutsideScientistWalkToLabMovement:
rept 7
	step_right
endr
rept 3
	step_up
endr
	step_end

RuinsofAlphScientistClimaxApproachMovementData:
	step_down
rept 4
	step_left
endr
rept 7
	step_up
endr
rept 8
	step_left
endr
	turn_head_up
	step_end

RuinsofAlphScientistClimaxLeaveMovementData:
	step_up
rept 7
	step_right
endr
	step_end

RuinsOfAlphOutsideScientistText:
	text "Hm? C'est un #-"
	line "Dex, n'est-ce pas?"
	cont "Puis-je le voir?"

	para "Il y a tant de"
	line "#mon..."

	para "Hmm? C'est quoi?"

	para "Quel est donc"
	line "ce #mon?"

	para "Il ressemble aux"
	line "inscriptions sur"

	para "les murs des"
	line "ruines."

	para "Si ces dessins"
	line "sont des #mon,"
	cont "il doit y en avoir"
	cont "beaucoup d'autres."

	para "Je sais! Je vais"
	line "améliorer ton"
	cont "#dex..."
	cont "Suis-moi."
	done

SuperNerdStanSeenText:
	text "Que veux-tu?"
	line "J'étudie, là..."
	cont "Me cherche pas!"
	done

SuperNerdStanBeatenText:
	text "Pardon..."
	line "Le manque de"

	para "communication est"
	line "un tort..."
	done

PsychicNathanSeenText:
	text "Hmmm... C'est"
	line "bizarre ici."
	done

PsychicNathanBeatenText: ; text > text
	text "...."
	done

RuinsOfAlphOutsideMysteryChamberSignText:
	text "pierre mystère"
	line "chambre du Panneau"
	done

RuinsOfAlphOutsideMysteriousHallSignText:
	text "Mysterious Hall"

	para "Please watch"
	line "your step."
	done

RuinsOfAlphSignText:
	text "ruines d'alpha"
	line "Bienvenue"
	done

RuinsOfAlphResearchCenterSignText:
	text "ruines d'alpha"
	line "centre de"
	cont "recherche"

	para "La référence des"
	line "ruines d'alpha"
	done

RuinsOfAlphAdvancedTipsSignText:
	text "Advanced Tips!"

	para "The #dex is a"
	line "powerful tool!"

	para "Its Area map shows"
	line "a yellow icon if a"

	para "#mon can be"
	line "found right where"
	cont "you are!"
	done

MapRuinsofAlphOutsideSealedCaveSign:
	dw EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	jumpthistext

	text "There's a door-"
	line "shaped groove in"
	cont "the rock."
	done

RuinsOfAlphOutsideFisherText1:
	text "En explorant les"
	line "ruines, nous avons"

	para "senti une drôle"
	line "de présence."

	para "On a eu peur et"
	line "on a filé."

	para "Fais gaffe."
	line "C'est un conseil."
	done


RuinsOfAlphOutsideYoungster2Text:
	text "D… R… O… I… T…"
	line "Hmmm…"

	para "Quoi?"

	para "Je décode le"
	line "message!"
	done

RuinsofAlphScientistClimax1Text:
	text "That sounded like"
	line "it came from over"
	cont "here…"
	done

RuinsofAlphScientistClimax2Text:
	text "Incredible!"

	para "Another chamber"
	line "was hidden here"
	cont "all this time!"

	para "We could spend"
	line "years studying it!"

	para "…Although, that"
	line "was quite a loud"
	cont "earthquake."

	para "Could another"
	line "chamber have"

	para "opened up far"
	line "away from here?"

	para "I must go tell"
	line "my colleagues"
	cont "about this!"
	done
