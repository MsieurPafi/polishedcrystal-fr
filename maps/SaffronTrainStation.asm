SaffronTrainStation_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_SAFFRONTRAINSTATION_ARRIVE_FROM_GOLDENROD

	def_callbacks

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, SCENE_SAFFRONTRAINSTATION_ARRIVE_FROM_GOLDENROD, Script_ArriveFromGoldenrod

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event 11, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuideScript, -1
	object_event  6, 11, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronMagnetTrainStationTeacherText, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  6, 10, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronMagnetTrainStationLassText, EVENT_SAFFRON_TRAIN_STATION_POPULATION

	object_const_def
	const SAFFRONTRAINSTATION_OFFICER

SaffronMagnetTrainStationOfficerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer SaffronMagnetTrainStationOfficerTrainIsntOperatingText
	faceplayer
	opentext
	writetext SaffronMagnetTrainStationOfficerAreYouComingOnBoardText
	yesorno
	iffalse_jumpopenedtext SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText
	checkkeyitem PASS
	iffalse_jumpopenedtext SaffronMagnetTrainStationOfficerYouDontHaveAPassText
	writetext SaffronMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement SAFFRONTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval $1
	special Special_MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applyonemovement PLAYER, turn_head_down
	wait 2
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement SAFFRONTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement
	showtext SaffronMagnetTrainStationOfficerArrivedInSaffronText
	turnobject PLAYER, DOWN
	end

SaffronMagnetTrainStationGymGuideScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart
	jumpthistextfaceplayer

	text "The Magnet Train"
	line "is a super modern"

	para "rail liner that"
	line "uses electricity"

	para "and magnets to"
	line "attain incredible"
	cont "speed."

	para "However, if there"
	line "isn't any elec-"
	cont "tricity…"
	done

SaffronMagnetTrainStationOfficerApproachTrainDoorMovement:
	step_up
	step_up
	step_right
	turn_head_left
	step_end

SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step_left
	step_down
	step_down
	step_end

SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_up
	step_end

SaffronMagnetTrainStationOfficerTrainIsntOperatingText:
	text "Le train Magnet ne"
	line "fonctionne pas"
	cont "pour l'instant."
	done

SaffronMagnetTrainStationOfficerAreYouComingOnBoardText:
	text "Nous partons bien-"
	line "tôt pour Doublon-"
	cont "ville."

	para "Veux-tu monter"
	line "à bord?"
	done

SaffronMagnetTrainStationOfficerRightThisWayText:
	text "Puis-je voir"
	line "ton passe?"

	para "OK. Ça marche."
	line "Par ici."
	done

SaffronMagnetTrainStationOfficerYouDontHaveAPassText:
	text "Désolé."
	line "Pas de passe."
	done

SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "Allez..."
	line "Au revoir."
	done

SaffronMagnetTrainStationOfficerArrivedInSaffronText:
	text "Nous sommes arri-"
	line "vés à Safrania."

	para "A bientôt."
	done


SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart:
	text "Fouiii..."

	para "Combien de fois"
	line "ai-je fait la na-"

	para "vette entre Kanto"
	line "et Johto? J'en"
	cont "sais rien, moi!"
	done

SaffronMagnetTrainStationTeacherText:
	text "Il y avait une"
	line "maison avant la"

	para "construction de la"
	line "Station de train."

	para "Une petite fille,"
	line "appelée Copieuse,"
	cont "y vivait."
	done

SaffronMagnetTrainStationLassText:
	text "Bonjour. As-tu un"
	line "passe?"

	para "Moi j'en ai un!"
	line "Tous ceux de sa-"

	para "Frania qui utili-"
	line "sent le train"
	cont "Magnet en ont un."
	done
