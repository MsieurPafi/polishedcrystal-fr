TeamRocketBaseB2F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_TEAMROCKETBASEB2F_LANCE_HEALS
	scene_const SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	scene_const SCENE_TEAMROCKETBASEB2F_ELECTRODES
	scene_const SCENE_TEAMROCKETBASEB2F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TransmitterDoorAndTurbinesCallback

	def_warp_events
	warp_event  3, 14, TEAM_ROCKET_BASE_B1F, 2
	warp_event  3,  2, TEAM_ROCKET_BASE_B3F, 1
	warp_event 27,  2, TEAM_ROCKET_BASE_B3F, 2
	warp_event  3,  6, TEAM_ROCKET_BASE_B3F, 3
	warp_event 27, 14, TEAM_ROCKET_BASE_B3F, 4

	def_coord_events
	coord_event  5, 14, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS, LanceHealsScript
	coord_event  4, 13, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS, LanceHealsScript
	coord_event 14, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFLeft
	coord_event 15, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFRight
	coord_event 14, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 15, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 12,  3, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 10, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 11, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript

	def_bg_events
	bg_event 14, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 15, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 16,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 26,  7, BGEVENT_ITEM + FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL

	def_object_events
	object_event 20, 16, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_PETREL
	object_event 20, 16, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ARIANA
	object_event  5, 13, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	object_event  9, 13, SPRITE_DRAGONITE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	object_event  7,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ELECTRODE, -1, PAL_MON_RED, OBJECTTYPE_SCRIPT, NO_FORM, RocketElectrode1, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event  7,  7, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ELECTRODE, -1, PAL_MON_RED, OBJECTTYPE_SCRIPT, NO_FORM, RocketElectrode2, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event  7,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ELECTRODE, -1, PAL_MON_RED, OBJECTTYPE_SCRIPT, NO_FORM, RocketElectrode3, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	pokemon_event 22,  5, ELECTRODE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, ClearText, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	pokemon_event 22,  7, ELECTRODE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, ClearText, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	pokemon_event 22,  9, ELECTRODE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, ClearText, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 25, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM17, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGruntM18, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGruntM19, EVENT_TEAM_ROCKET_BASE_POPULATION
	itemball_event  3, 10, HYPER_POTION, 1, EVENT_TEAM_ROCKET_BASE_B2F_HYPER_POTION

	object_const_def
	const TEAMROCKETBASEB2F_PETREL
	const TEAMROCKETBASEB2F_ARIANA
	const TEAMROCKETBASEB2F_LANCE
	const TEAMROCKETBASEB2F_DRAGONITE
	const TEAMROCKETBASEB2F_ELECTRODE1
	const TEAMROCKETBASEB2F_ELECTRODE2
	const TEAMROCKETBASEB2F_ELECTRODE3
	const TEAMROCKETBASEB2F_ELECTRODE4
	const TEAMROCKETBASEB2F_ELECTRODE5
	const TEAMROCKETBASEB2F_ELECTRODE6
	const TEAMROCKETBASEB2F_ROCKET1
	const TEAMROCKETBASEB2F_ROCKET2
	const TEAMROCKETBASEB2F_ROCKET3

TransmitterDoorAndTurbinesCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iffalsefwd .ClosedTransmitterDoor
	changeblock 14, 12, $0d
.ClosedTransmitterDoor
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalsefwd .TurbinesStillRunning
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalsefwd .TurbinesStillRunning
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalsefwd .TurbinesStillRunning
	changeblock 12, 4, $94
	changeblock 16, 4, $95
	changeblock 12, 6, $96
	changeblock 16, 6, $97
.TurbinesStillRunning
	endcallback

RocketBaseBossFLeft:
	moveobject TEAMROCKETBASEB2F_LANCE, 9, 13
	sjumpfwd RocketBaseBossFScript

RocketBaseBossFRight:
	moveobject TEAMROCKETBASEB2F_ARIANA, 21, 16
	moveobject TEAMROCKETBASEB2F_PETREL, 21, 16
	moveobject TEAMROCKETBASEB2F_DRAGONITE, 10, 13
	moveobject TEAMROCKETBASEB2F_LANCE, 10, 13
RocketBaseBossFScript:
	appear TEAMROCKETBASEB2F_ARIANA
	appear TEAMROCKETBASEB2F_PETREL
	showtext RocketBaseExecutiveFHoldItText
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, RocketBasePlayerApproachesBossFMovement
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEB2F_ARIANA, RocketBaseBossFApproachesPlayerMovement
	turnobject PLAYER, UP
	applymovement TEAMROCKETBASEB2F_PETREL, RocketBaseGruntApproachesPlayerMovement
	showtext RocketBaseBossFThrashText
	cry DRAGONITE
	turnobject TEAMROCKETBASEB2F_ARIANA, LEFT
	turnobject PLAYER, LEFT
	appear TEAMROCKETBASEB2F_DRAGONITE
	applymovement TEAMROCKETBASEB2F_DRAGONITE, RocketBaseDragoniteAttacksMovement
	applymovement TEAMROCKETBASEB2F_ARIANA, RocketBaseBossFHitMovement
	applymovement TEAMROCKETBASEB2F_PETREL, RocketBaseGruntProtectsBossFMovement
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesBossFMovement
	showtext RocketBaseLanceShareFunText
	turnobject PLAYER, RIGHT
	applymovement TEAMROCKETBASEB2F_ARIANA, RocketBaseBossFFacesPlayerMovement
	showtext RocketBaseBossDontMeddleText
	applyonemovement TEAMROCKETBASEB2F_PETREL, big_step_left
	applyonemovement TEAMROCKETBASEB2F_ARIANA, big_step_left
	winlosstext RocketBaseBossWinText, 0
	setlasttalked TEAMROCKETBASEB2F_ARIANA
	loadtrainer ARIANA, ARIANA2
	startbattle
	disappear TEAMROCKETBASEB2F_DRAGONITE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_ARIANA
	setevent EVENT_TEAM_ROCKET_BASE_B2F_PETREL
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	reloadmapafterbattle
	setevent EVENT_BEAT_ARIANA_2
	showtext RocketBaseBossRetreatText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_PETREL
	disappear TEAMROCKETBASEB2F_ARIANA
	disappear TEAMROCKETBASEB2F_ROCKET1
	disappear TEAMROCKETBASEB2F_ROCKET2
	disappear TEAMROCKETBASEB2F_ROCKET3
	pause 15
	special Special_FadeInQuickly
	setscene SCENE_TEAMROCKETBASEB2F_ELECTRODES
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	showtext RocketBaseLancePostBattleText
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceChecksPlayerMovement
	turnobject PLAYER, UP
	showtext RocketBaseLancePowerOffText
	follow TEAMROCKETBASEB2F_LANCE, PLAYER
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesMachineMovement
	stopfollow
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLancePacesMovement
	showtext RockerBaseLanceElectrodeFaintText
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesElectrodesMovement
	disappear TEAMROCKETBASEB2F_LANCE

RocketBaseCantLeaveScript:
	applymovement PLAYER, RocketBasePlayerCantLeaveElectrodesMovement
	end

RocketBaseLancesSideScript:
	showtext RocketBaseLancesSideText
	applyonemovement PLAYER, step_left
	end

LanceHealsScript:
	faceobject PLAYER, TEAMROCKETBASEB2F_LANCE
	faceobject TEAMROCKETBASEB2F_LANCE, PLAYER
	showtext LanceHealsText1
	special FadeOutPalettes
	special LoadMapPalettes
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInPalettes_EnableDynNoApply
	showtext LanceHealsText2
	setscene SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	readvar VAR_FACING
	ifequalfwd RIGHT, .FacingRight
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

.FacingRight:
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealRightMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

GenericTrainerGruntM17:
	generictrainer GRUNTM, 17, EVENT_BEAT_ROCKET_GRUNTM_17, GruntM17SeenText, GruntM17BeatenText

	text "Heh, I'm just a"
	line "Grunt."

	para "I don't know the"
	line "password. Too bad"
	cont "for you."
	done

GenericTrainerGruntM18:
	generictrainer GRUNTM, 18, EVENT_BEAT_ROCKET_GRUNTM_18, GruntM18SeenText, GruntM18BeatenText

	text "I got wiped out on"
	line "the last mission"
	cont "by a kid too."

	para "When we were ab-"
	line "ducting #mon,"

	para "this kid with long"
	line "red hair and mean-"

	para "looking eyes just"
	line "creamed me…"
	done

GenericTrainerGruntM19:
	generictrainer GRUNTM, 19, EVENT_BEAT_ROCKET_GRUNTM_19, GruntM19SeenText, GruntM19BeatenText

	text "Heh, only the boss"
	line "knows the password"
	cont "for that door."

	para "Where's the boss?"
	line "Who knows? Go look"
	cont "for yourself."
	done

RocketElectrode1:
	cry ELECTRODE
	loadwildmon ELECTRODE, 33
	startbattle
	iftruefwd TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE1
	disappear TEAMROCKETBASEB2F_ELECTRODE4
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalsefwd TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement1
	sjumpfwd RocketBaseElectrodeScript

RocketElectrode2:
	cry ELECTRODE
	loadwildmon ELECTRODE, 33
	startbattle
	iftruefwd TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE2
	disappear TEAMROCKETBASEB2F_ELECTRODE5
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalsefwd TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement2
	sjumpfwd RocketBaseElectrodeScript

RocketElectrode3:
	cry ELECTRODE
	loadwildmon ELECTRODE, 33
	startbattle
	iftruefwd TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE3
	disappear TEAMROCKETBASEB2F_ELECTRODE6
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalsefwd TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalsefwd TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement3
	sjumpfwd RocketBaseElectrodeScript

TeamRocketBaseB2FReloadMap:
	reloadmapafterbattle
	end

RocketBaseElectrodeScript:
	moveobject TEAMROCKETBASEB2F_LANCE, 18, 6
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesElectrodesMovement
	turnobject PLAYER, RIGHT
	opentext
	writetext RocketBaseLanceElectrodeDoneText
	promptbutton
	verbosegivetmhm TM_THIEF
	setevent EVENT_GOT_TM46_THIEF_FROM_LANCE
	writetext RocketBaseLanceWhirlpoolText
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	showtext RocketBaseLanceMonMasterText
	turnobject PLAYER, DOWN
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesBaseMovement
	disappear TEAMROCKETBASEB2F_LANCE
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	setscene SCENE_TEAMROCKETBASEB2F_NOOP
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

TeamRocketBaseB2FLockedDoor:
	dw EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	opentext
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iffalse_jumpopenedtext RocketBaseDoorNoPasswordText
	writetext RocketBaseDoorKnowPasswordText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 14, 12, $0d
	refreshmap
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

TeamRocketBaseB2FTransmitterScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptext .DeactivateTransmitterText
	jumpthistext

	text "It's the radio"
	line "transmitter that's"

	para "sending the"
	line "sinister signal."

	para "It's working at"
	line "full capacity."
	done

.DeactivateTransmitterText:
	text "l'émetteur radio"
	line "a enfin interrompu"

	para "son signal maléfi-"
	line "que."
	done

RocketBaseLanceLeavesAfterHealMovement:
	step_right
RocketBaseLanceLeavesAfterHealRightMovement:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

RocketBasePlayerApproachesBossFMovement:
	step_down
	step_down
	step_down
	turn_head_right
	step_end

RocketBaseBossFApproachesPlayerMovement:
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	turn_head_down
	step_end

RocketBaseGruntApproachesPlayerMovement:
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	step_end

RocketBaseDragoniteAttacksMovement:
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	step_end

RocketBaseBossFHitMovement:
	fix_facing
	set_sliding
	jump_step_right
	remove_sliding
	remove_fixed_facing
	step_end

RocketBaseBossFFacesPlayerMovement:
	slow_step_down
	turn_head_left
	step_end

RocketBaseLanceApproachesBossFMovement:
	step_right
	step_right
	step_right
	step_end

RocketBaseGruntProtectsBossFMovement:
	run_step_left
	run_step_up
	turn_head_left
	step_end

RocketBaseLanceChecksPlayerMovement:
	step_right
	step_right
	turn_head_down
	step_end

RocketBaseLanceApproachesMachineMovement:
	step_up
	step_up
	step_up
	step_end

RocketBaseLancePacesMovement:
	step_sleep_8
	step_left
	step_left
	turn_head_up
	step_sleep_8
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_sleep_8
	step_left
	step_left
	turn_head_down
	step_end

RocketBaseLanceApproachesElectrodesMovement:
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

RocketBasePlayerCantLeaveElectrodesMovement:
	step_up
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end

RocketBaseLanceLeavesElectrodesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

RocketBaseLanceLeavesBaseMovement:
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RocketBasePlayerLeavesElectrodesMovement1:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

RocketBasePlayerLeavesElectrodesMovement2:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

RocketBasePlayerLeavesElectrodesMovement3:
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_end

RocketBaseExecutiveFHoldItText:
	text "Hop hop hop!"
	line "On bouge plus!"
	done

RocketBaseBossFThrashText:
	text "On peut pas te"
	line "laisser fouiner"
	cont "par ici."

	para "C'est contre la"
	line "politique de la"
	cont "Team Rocket."

	para "Même si t'es super"
	line "méga balèze, tu ne"

	para "pourras jamais"
	line "gagner contre nous"
	cont "deux en même"
	cont "temps."

	para "Désolé ma puce."
	line "C'est l'heure de"
	cont "prendre ta baffe."
	done

RocketBaseLanceShareFunText:
	text "Hé! Moi aussi"
	line "je veux m'amuser!"
	cont "T'es perso."
	done

RocketBaseBossDontMeddleText:
	text "Quoi? Tu avais un"
	line "complice? Et ton"

	para "sens de l'honneur?"
	line "Il est où? Hein?"

	para "Avec le remplaçant"
	line "du boss Giovanni,"

	para "je vais te montrer"
	line "qu'il faut pas"

	para "venir se frotter"
	line "à la Team Rocket!"
	done

RocketBaseBossWinText:
	text "Pfff. C'est vrai"
	line "que t'es balèze."

	para "Ça craint."

	para "Si tu venais à la"
	line "Team Rocket, tu"

	para "deviendrais vite"
	line "Caïd."
	done

RocketBaseBossRetreatText:
	text "...Cette cachette"
	line "est fichue..."

	para "Mais c'est pas"
	line "grave. l'opération"
	cont "radio est une"
	cont "réussite totale."

	para "On se fiche de"
	line "cette cachette"
	cont "maintenant."

	para "On a d'autres"
	line "plans."

	para "Tu vas vite com-"
	line "prendre la puis-"

	para "sance de la Team"
	line "Rocket."

	para "Amuse-toi tant"
	line "qu'il est temps."

	para "Hi hihihihi hi!"
	done

RocketBaseLancePostBattleText:
	text "Peter: Terminé!"
	line "On a battu tous"

	para "les gars de la"
	line "Rocket du coin."

	para "Mais je m'inquiète"
	line "à propos du jeune"

	para "garçon que j'ai"
	line "combattu..."
	done

RocketBaseLancePowerOffText:
	text "Pardon, <PLAYER>."
	line "J'étais en train"

	para "de t'admirer en"
	line "silence."

	para "Tout ce qu'il nous"
	line "reste à faire,"

	para "c'est d'arrêter le"
	line "signal radio."
	done

RockerBaseLanceElectrodeFaintText:
	text "Cette machine"
	line "est la cause du"
	cont "problème."

	para "Je ne vois pas"
	line "d'interrupteur..."

	para "Il n'y a pas de"
	line "choix: il faut"

	para "mettre K.O. tous"
	line "les Electrode."

	para "Cela devrait arrê-"
	line "ter cette machine"

	para "et du même coup"
	line "le signal."

	para "Ce n'est pas la"
	line "faute des #mon,"

	para "ça me met donc un"
	line "peu mal à l'aise."

	para "<PLAYER>, on"
	line "fait chacun un"
	cont "côté."
	done

RocketBaseLancesSideText:
	text "Peter: Je m'occupe"
	line "de ce côté."
	done

RocketBaseLanceElectrodeDoneText:
	text "Peter: Cet étrange"
	line "signal s'est enfin"
	cont "arrêté."

	para "Le Lac doit être"
	line "normal à nouveau."

	para "Tu es formidable!"
	line "Je te remercie au"

	para "nom de tous les"
	line "#mon."

	para "Au fait. Voilà"
	line "pour toi."

	para "Je l'ai trouvée"
	line "ici mais moi j'en"
	cont "ai pas besoin."
	done

RocketBaseLanceWhirlpoolText:
	text "That's Thief."
	line "I trust you won't"

	para "abuse it the way"
	line "Team Rocket does."
	done

RocketBaseLanceMonMasterText:
	text "<PLAYER>..."

	para "Devenir le meil-"
	line "leur dresseur"

	para "#mon prend du"
	line "temps et est"
	cont "très difficile..."

	para "Vas-tu tenir le"
	line "coup?"

	para "..."

	para "Je vois."
	line "Tu as raison."

	para "Abandonner mainte-"
	line "nant serait stupi-"

	para "de. Tu ne dois pas"
	line "oublier ton rêve."

	para "Je suis impatient"
	line "de te revoir!"
	done

LanceHealsText1:
	text "Peter: Tu vas"
	line "bien?"

	para "Tes #mon sont"
	line "très fatigués."

	para "Tiens, soigne-les"
	line "avec mon médica-"
	cont "ment."
	done

LanceHealsText2:
	text "Peter: <PLAYER>,"
	line "ensemble pour"
	cont "les #mon!"
	done

GruntM17SeenText:
	text "La porte ne"
	line "s'ouvre pas?"

	para "Normal, débiloss!"
	line "Il faut un mot de"

	para "passe connu seule-"
	line "ment de la Team"
	cont "Rocket."
	done

GruntM17BeatenText:
	text "Quoi? Perdu?"
	done

GruntM18SeenText:
	text "Désolé je suis."
	line "Mais te briser"

	para "je dois."
	done

GruntM18BeatenText:
	text "Perdu j'ai?"
	done

GruntM19SeenText:
	text "Espèce de sale"
	line "peste!"
	done

GruntM19BeatenText:
	text "Grrrr..."
	done

RocketBaseDoorNoPasswordText:
	text "La porte est"
	line "fermée..."

	para "Il faut un mot"
	line "de passe."
	done

RocketBaseDoorKnowPasswordText:
	text "La porte est"
	line "fermée..."

	para "<PLAYER> tape"
	line "le mot de passe."

	para "La porte est"
	line "ouverte!"
	done
