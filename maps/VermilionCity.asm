VermilionCity_MapScriptHeader:
	def_scene_scripts
	scene_script LawrenceIntroScript, SCENE_VERMILIONCITY_LAWRENCE_INTRO
	scene_const SCENE_VERMILIONCITY_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionCitySetupLawrenceCallback
	callback MAPCALLBACK_TILES, VermilionCitySetupBattleFactoryCallback
	callback MAPCALLBACK_CMDQUEUE, VermilionCitySetUpPaletteSwap

	def_warp_events
	warp_event  5,  3, VERMILION_HOUSE_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  3, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event  8, 19, VERMILION_GYM, 1
	warp_event 18, 31, VERMILION_PORT, 1
	warp_event 19, 31, VERMILION_PORT, 3
	warp_event 38, 13, DIGLETTS_CAVE, 1
	warp_event 28, 31, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 29, 31, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 13,  3, VERMILION_POLLUTION_SPEECH_HOUSE, 1
	warp_event 19,  3, VERMILION_S_S_ANNE_SPEECH_HOUSE, 1
	warp_event 28,  7, BATTLE_FACTORY_1F, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_JUMPTEXT, VermilionCitySignText
	bg_event  9, 19, BGEVENT_JUMPTEXT, VermilionGymSignText
	bg_event  5, 13, BGEVENT_JUMPTEXT, PokemonFanClubSignText
	bg_event 35, 13, BGEVENT_JUMPTEXT, VermilionCityDiglettsCaveSignText
	bg_event 27, 15, BGEVENT_JUMPTEXT, VermilionCityPortSignText
	bg_event 27, 24, BGEVENT_JUMPTEXT, VermilionCityPierSignText
	bg_event 23,  7, BGEVENT_JUMPTEXT, VermilionCityBattleFactorySignText
	bg_event 10, 23, BGEVENT_JUMPTEXT, VermilionCityAdvancedTipsSignText
	bg_event 12, 19, BGEVENT_ITEM + FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL
	bg_event 32,  4, BGEVENT_ITEM + MAX_ETHER, EVENT_VERMILION_CITY_HIDDEN_MAX_ETHER

	def_object_events
	object_event 37, 14, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 18, 27, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_VERMILION_CITY
	object_event 18, 10, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityTeacherText, -1
	object_event 20,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachokeOwnerScript, -1
	pokemon_event 21,  7, MACHOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GRAY, VermilionMachokeText, -1
	object_event 16, 16, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySuperNerdText, -1
	object_event 31, 10, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerd2Script, -1
	object_event 11,  6, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySailorText, -1
	object_event 19, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event 28,  8, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityOfficerFText, EVENT_RESTORED_POWER_TO_KANTO
	cuttree_event 13, 19, EVENT_VERMILION_CITY_CUT_TREE
	object_event 30,  1, SPRITE_PEARL, SPRITEMOVEDATA_ARCH_TREE_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 26,  1, SPRITE_PEARL, SPRITEMOVEDATA_ARCH_TREE_RIGHT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 27, 32, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_WATER, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 30, 32, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_COPY_BG_WATER, OBJECTTYPE_COMMAND, end, NULL, -1

	object_const_def
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_LAWRENCE

VermilionCitySetupLawrenceCallback:
	checkscene
	iftruefwd .done
	readvar VAR_XCOORD
	ifequalfwd 18, .done
	disappear VERMILIONCITY_LAWRENCE
	moveobject VERMILIONCITY_LAWRENCE, 19, 27
	appear VERMILIONCITY_LAWRENCE
.done
	endcallback

VermilionCitySetupBattleFactoryCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .done
	changeblock 28, 6, $f7
.done
	endcallback

VermilionCitySetUpPaletteSwap:
	usepaletteswap .PaletteSwap
	endcallback

.PaletteSwap:
	paletteswap 21, 36, 27, 39, PAL_BG_ROOF, VermilionCityRoofPalettes, SeagallopFerryRoofPalettes
	db -1 ; end

LawrenceIntroScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	showtext LawrenceOverheardText
	applymovement VERMILIONCITY_LAWRENCE, LawrenceApproachMovementData
	playsound SFX_TACKLE
	applymovement VERMILIONCITY_LAWRENCE, LawrenceBumpMovementData
	showemote EMOTE_SHOCK, VERMILIONCITY_LAWRENCE, 15
	pause 15
	readvar VAR_XCOORD
	ifequalfwd 18, .left
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAroundRightMovementData
	turnobject PLAYER, LEFT
	sjumpfwd .continue

.left
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAroundLeftMovementData
	turnobject PLAYER, RIGHT
.continue
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext LawrenceIntroText
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAwayMovementData
	disappear VERMILIONCITY_LAWRENCE
	setscene SCENE_VERMILIONCITY_NOOP
	setevent EVENT_TELEPORT_GUY
	setflag ENGINE_FLYPOINT_VERMILION
	special RestartMapMusic
	end

LawrenceWalkAwayMovementData:
	step_down
	step_down
LawrenceApproachMovementData:
	step_down
	step_down
	step_down
	step_end

LawrenceBumpMovementData:
	fix_facing
	run_step_up
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	step_end

LawrenceWalkAroundLeftMovementData:
	step_right
	step_down
	step_down
	turn_head_left
	step_end

LawrenceWalkAroundRightMovementData:
	step_left
	step_down
	step_down
	turn_head_right
	step_end

VermilionSnorlax:
	opentext
	special SpecialSnorlaxAwake
	iftruefwd .Awake
	jumpthisopenedtext

	text "Snorlax is snoring"
	line "peacefully…"
	done

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 60
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	checkevent EVENT_GOT_BOTTLE_CAP_FROM_VERMILION_GUY
	iftrue_jumptextfaceplayer VermilionCityBadgeGuyBattleEdgeText
	readvar VAR_BADGES
	ifequalfwd 16, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	jumpthistextfaceplayer

	text "Skilled trainers"
	line "gather in Kanto."

	para "Gym Leaders are"
	line "especially strong."

	para "They won't be easy"
	line "to defeat."
	done

.SomeBadges:
	jumpthistextfaceplayer

	text "You've started to"
	line "collect Kanto Gym"
	cont "Badges?"

	para "Don't you agree"
	line "that the trainers"
	cont "here are tough?"
	done

.MostBadges:
	jumpthistextfaceplayer

	text "I guess you'll be"
	line "finished with your"

	para "conquest of Kanto"
	line "Gyms soon."

	para "Let me know if"
	line "you get all eight"
	cont "Badges."
	done

.AllBadges:
	faceplayer
	opentext
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem BOTTLE_CAP
	iffalse_endtext
	setevent EVENT_GOT_BOTTLE_CAP_FROM_VERMILION_GUY
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitendtext

VermilionMachokeOwnerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionMachokeOwnerText
	jumpthistextfaceplayer

	text "My #mon"
	line "prepared the land"

	para "to construct that"
	line "huge building!"

	para "It's quite a shame"
	line "that the public"
	cont "can't enter yet…"
	done

VermilionCitySuperNerd2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionCitySuperNerd2Text
	jumpthistextfaceplayer

	text "The Battle Factory"
	line "is brand-new!"

	para "But it draws a"
	line "huge amount of"
	cont "power…"

	para "With the Power"
	line "Plant offline,"
	cont "it's useless!"
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Avoir des #mon"
	line "de types diffé-"

	para "rents donne"
	line "l'avantage en"
	cont "combat."

	para "Les Badges de Kan-"
	line "To t'aideront,"
	cont "j'en suis sûr."
	done

LawrenceOverheardText:
	text "…So the legendary"
	line "#mon was not"
	cont "on that island…"

	para "I must continue my"
	line "search elsewhere…"
	done

LawrenceIntroText:
	text "Lawrence: Please"
	line "excuse me for"
	cont "bumping into you."

	para "I'm in a hurry to"
	line "complete my"
	cont "collection."

	para "My name is"
	line "Lawrence III."

	para "And you're the"
	line "League Champion?"

	para "…Well, appearances"
	line "can be deceiving."

	para "Legendary #mon"
	line "have always been"
	cont "my passion."

	para "I took the Seagal-"
	line "lop Ferry here to"

	para "Shamouti Island,"
	line "but did not find"
	cont "the one I sought."

	para "Oh, you've encoun-"
	line "tered #mon out"
	cont "of Johto's legends?"

	para "Then our paths may"
	line "cross again as"
	cont "fellow collectors."

	para "But I really must"
	line "be on my way."
	cont "Farewell!"
	done

VermilionCityTeacherText:
	text "Le port de Carmin"
	line "est la porte de"
	cont "Kanto vers"
	cont "l'océan."

	para "De magnifiques"
	line "paquebots du monde"
	cont "entier viennent y"
	cont "jeter l'ancre."
	done

VermilionMachokeOwnerText:
	text "My #mon"
	line "prepared the land"

	para "to construct that"
	line "huge building!"

	para "It was a Machop"
	line "three years ago,"

	para "but the effort"
	line "made it evolve!"
	done

VermilionMachokeText:
	text "Machoke: Guooh"
	line "gogogoh!"
	done

VermilionCitySuperNerdText:
	text "Il y a huit Arenes"
	line "à Kanto."

	para "Ce grand bâtiment"
	line "est l'Arene #-"
	cont "mon de Carmin."
	done

VermilionCitySuperNerd2Text:
	text "The Battle Factory"
	line "is brand-new, but"

	para "trainers are al-"
	line "ready arriving"

	para "from distant"
	line "regions to take"
	cont "its challenge!"
	done

VermilionCityOfficerFText:
	text "Sorry, the Battle"
	line "Factory is closed"

	para "until the Power"
	line "Plant is up and"
	cont "running again."
	done

VermilionCitySailorText:
	text "Nothing beats"
	line "good sea air!"
	done

VermilionCityRadioNearSnorlaxText:
	text "Le #matos est"
	line "placé près de"
	cont "l'oreille du"
	cont "Ronflex."

	para "..."

	para "Ronflex se"
	line "réveille!"
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Félicitations!"

	para "Tu as tous les"
	line "Badges des Arenes"
	cont "de Kanto!"

	para "Voilà une petite"
	line "récompense."
	done

VermilionCitySignText:
	text "Carmin sur mer"

	para "Le port aux cou-"
	line "chers de soleil"
	done

VermilionGymSignText:
	text "champion d'Arene"
	line "de Carmin sur mer:"
	cont "Major Bob"

	para "l'Américain"
	line "survolté"
	done

PokemonFanClubSignText:
	text "fan Club #mon"

	para "Fans de #mon"
	line "bienvenus!"
	done

VermilionCityDiglettsCaveSignText:
	text "Cave Taupiqueur"
	done

VermilionCityPortSignText:
	text "port de Carmin"
	line "Entree"
	done

VermilionCityPierSignText:
	db "◀ S.S.Aqua<LINE>▼ Seagallop Ferry<DONE>" ; not compressible

VermilionCityAdvancedTipsSignText:
	text "Advanced Tips!"

	para "Your Trainer Card"
	line "has room to show"
	cont "sixteen Badges!"
	done

VermilionCityBattleFactorySignText:
	text "Battle Factory"

	para "Win it All with"
	line "Rental #mon!"
	done
