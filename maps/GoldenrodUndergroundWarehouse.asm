GoldenrodUndergroundWarehouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundResetSwitches

	def_warp_events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	itemball_event 18, 15, MAX_ETHER, 1, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	tmhmball_event 13,  9, TM_X_SCISSOR, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_X_SCISSOR
	itemball_event  2,  1, ULTRA_BALL, 1, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL

GenericTrainerGruntM24:
	generictrainer GRUNTM, 24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText

	text "Team Rocket will"
	line "keep going, wait-"
	cont "ing for the return"
	cont "of Giovanni."

	para "We'll do whatever"
	line "it takes."
	done

GenericTrainerGruntM14:
	generictrainer GRUNTM, 14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText

	text "I lost…"

	para "Please forgive me,"
	line "Giovanni!"
	done

GenericTrainerGruntM15:
	generictrainer GRUNTM, 15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText

	text "Hyuck-hyuck-hyuck!"
	line "That was a blast!"
	cont "I'll remember you!"
	done

GoldenrodUndergroundWarehouseDirectorScript:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue_jumptextfaceplayer DirectorAfterText
	faceplayer
	opentext
	writetext DirectorIntroText
	promptbutton
	verbosegivekeyitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
	jumpopenedtext DirectorAfterText

GruntM24SeenText:
	text "Comment t'as fait"
	line "pour arriver ici?"

	para "Bon... Tant pis:"
	line "je dois me débar-"
	cont "rasser de toi."
	done

GruntM24BeatenText:
	text "J'suis fichu..."
	done

GruntM14SeenText:
	text "Pas un pas de"
	line "plus!"

	para "Mes ennemis, j'en"
	line "fais de la purée."
	cont "A table!"
	done

GruntM14BeatenText:
	text "Purééééée!"
	done

GruntM15SeenText:
	text "Gnyak Gnyak Gnyak!"
	line "J'me souviens de"

	para "toi! Tu m'as battu"
	line "à notre planque!"
	done

GruntM15BeatenText:
	text "Gnyak!"
	line "Heu? Encore??"
	done

DirectorIntroText:
	text "Directeur: Qui?"
	line "Quoi? Tu es là"
	cont "pour me sauver?"

	para "Merci!"

	para "La Tour Radio!"

	para "Que se passe-t-il"
	line "là-bas?"

	para "Contrôlée par la"
	line "Team Rocket?"

	para "Tiens. Prends"
	line "cette carte Magn."
	done

DirectorCardKeyText:
	text "Directeur: Utilise"
	line "cette carte pour"
	cont "ouvrir les volets"
	cont "du 2ème."
	done

DirectorAfterText:
	text "Je t'en supplie..."
	line "Aide-nous."

	para "Dieu seul sait ce"
	line "qu'ils feront en"

	para "contrôlant le"
	line "transmetteur."

	para "Ils pourront même"
	line "manipuler les"

	para "#mon grâce à un"
	line "signal spécial!"

	para "Tu es mon seul"
	line "espoir."

	para "Sauvé la tour"
	line "radio! Pitié!!!"

	para "Sauvé tous les"
	line "gentils #mon!"
	done
