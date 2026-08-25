DEF ROUTE43GATE_TOLL EQU 1000

Route43Gate_MapScriptHeader:
	def_scene_scripts
	scene_script Route43GateRocketShakedownScene, SCENE_ROUTE43GATE_ROCKET_SHAKEDOWN
	scene_const SCENE_ROUTE43GATE_NOOP

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_43, 4
	warp_event  5,  0, ROUTE_43, 5
	warp_event  4,  7, ROUTE_43, 3
	warp_event  5,  7, ROUTE_43, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RocketText_MakingABundle, EVENT_ROUTE_43_GATE_ROCKETS
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RocketText_MakingABundle, EVENT_ROUTE_43_GATE_ROCKETS
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OfficerScript_GuardWithSludgeBomb, EVENT_LAKE_OF_RAGE_CIVILIANS

	object_const_def
	const ROUTE43GATE_ROCKET1
	const ROUTE43GATE_ROCKET2

Route43GateRocketShakedownScene:
	sdefer .RocketTakeover
	end

.RocketTakeover:
	playmusic MUSIC_ROCKET_ENCOUNTER
	readvar VAR_FACING
	ifequalfwd DOWN, RocketScript_Southbound
	ifequalfwd UP, RocketScript_Northbound
	setscene SCENE_ROUTE43GATE_NOOP
	end

RocketScript_Southbound:
	applyonemovement PLAYER, step_down
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET2, 15
	applymovement ROUTE43GATE_ROCKET2, Rocket2Script_BlocksYouSouth
	turnobject ROUTE43GATE_ROCKET1, UP
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET1, 15
	applymovement ROUTE43GATE_ROCKET1, Rocket1Script_BlocksYouSouth
	opentext
	writetext RocketText_TollFee
	promptbutton
	checkmoney YOUR_MONEY, ROUTE43GATE_TOLL - 1
	ifequalfwd HAVE_MORE, RocketScript_TollSouth
	sjumpfwd RocketScript_YoureBrokeSouth

RocketScript_TollSouth:
	scall RocketScript_TakeToll
	writetext RocketText_ThankYou
	sjumpfwd RocketScript_ShakeDownSouth

RocketScript_YoureBrokeSouth:
	scall RocketScript_TakeToll
	writetext RocketText_AllYouGot
	; fallthrough

RocketScript_ShakeDownSouth:
	promptbutton
	closetext
	applymovement ROUTE43GATE_ROCKET1, Rocket1Script_LetsYouPassSouth
	applymovement ROUTE43GATE_ROCKET2, Rocket2Script_LetsYouPassSouth
	setscene SCENE_ROUTE43GATE_NOOP
	special RestartMapMusic
	end

RocketScript_Northbound:
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET1, 15
	applymovement ROUTE43GATE_ROCKET1, Rocket1Script_BlocksYouNorth
	turnobject ROUTE43GATE_ROCKET2, DOWN
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET2, 15
	applymovement ROUTE43GATE_ROCKET2, Rocket2Script_BlocksYouNorth
	opentext
	writetext RocketText_TollFee
	promptbutton
	checkmoney YOUR_MONEY, ROUTE43GATE_TOLL - 1
	ifequalfwd HAVE_MORE, RocketScript_TollNorth
	sjumpfwd RocketScript_YoureBrokeNorth

RocketScript_TollNorth:
	scall RocketScript_TakeToll
	writetext RocketText_ThankYou
	sjumpfwd RocketScript_ShakeDownNorth

RocketScript_YoureBrokeNorth:
	scall RocketScript_TakeToll
	writetext RocketText_AllYouGot
	; fallthrough

RocketScript_ShakeDownNorth:
	promptbutton
	closetext
	applymovement ROUTE43GATE_ROCKET2, Rocket2Script_LetsYouPassNorth
	applymovement ROUTE43GATE_ROCKET1, Rocket1Script_LetsYouPassNorth
	setscene SCENE_ROUTE43GATE_NOOP
	special RestartMapMusic
	end

RocketScript_TakeToll:
	takemoney YOUR_MONEY, ROUTE43GATE_TOLL
	waitsfx
	playsound SFX_TRANSACTION
	end

OfficerScript_GuardWithSludgeBomb:
	checkevent EVENT_GOT_TM36_SLUDGE_BOMB
	iftrue_jumptextfaceplayer OfficerText_AvoidGrass
	faceplayer
	opentext
	writetext OfficerText_FoundTM
	promptbutton
	verbosegivetmhm TM_SLUDGE_BOMB
	setevent EVENT_GOT_TM36_SLUDGE_BOMB
	endtext

Rocket1Script_BlocksYouSouth:
	run_step_up
	run_step_up
	run_step_right
	run_step_right
	turn_head_up
	step_end

Rocket1Script_LetsYouPassSouth:
	run_step_left
	run_step_left
	run_step_down
	run_step_down
	step_end

Rocket1Script_BlocksYouNorth:
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	turn_head_down
	step_end

Rocket1Script_LetsYouPassNorth:
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	turn_head_down
	step_end

Rocket2Script_BlocksYouSouth:
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	turn_head_up
	step_end

Rocket2Script_LetsYouPassSouth:
	run_step_right
	run_step_right
	run_step_down
	run_step_down
	turn_head_up
	step_end

Rocket2Script_BlocksYouNorth:
	run_step_down
	run_step_down
	run_step_left
	run_step_left
	turn_head_down
	step_end

Rocket2Script_LetsYouPassNorth:
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	step_end

RocketText_TollFee:
	text "Minute, mon p'tit"
	line "bouchon!"

	para "Le péage est de"
	line "{d:ROUTE43GATE_TOLL}¥."
	done

RocketText_ThankYou:
	text "Merci bien!"
	done

RocketText_AllYouGot:
	text "Alors donne ce que"
	line "t'as."
	done

RocketText_MakingABundle:
	text "Hé-hé-hé. On se"
	line "fait des thunes."

	para "Tout le monde veut"
	line "voir ce qu'il se"

	para "passe au Lac"
	line "colère."
	done

OfficerText_FoundTM:
	text "Des voyous en noir"
	line "m'ont fait quitter"
	cont "mon poste."

	para "Ils ont oublié ce"
	line "truc en plus."

	para "J'veux pas le gar-"
	line "der, moi..."
	cont "Tu le veux?"
	done

OfficerText_AvoidGrass:
	text "Emprunte cette"
	line "porte pour éviter"
	cont "les hautes herbes."
	done
