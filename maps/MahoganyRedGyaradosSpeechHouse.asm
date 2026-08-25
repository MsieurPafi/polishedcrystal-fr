MahoganyRedGyaradosSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, MAHOGANY_TOWN, 2
	warp_event  3,  7, MAHOGANY_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyRedGyaradosSpeechHouseBlackBeltText, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseTeacherScript, -1

MahoganyRedGyaradosSpeechHouseTeacherScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower
	jumpthistextfaceplayer

	text "My favorite radio"
	line "program? I'd say"
	cont "#mon Music."
	done

MahoganyRedGyaradosSpeechHouseBlackBeltText:
	text "J'ai entendu dire"
	line "qu'un Leviator"
	cont "rouge est apparu"
	cont "au Lac."

	para "C'est bizarre..."
	line "Même un Leviator"

	para "ordinaire est très"
	line "rare dans ce Lac!"
	done

MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower:
	text "J'ai entendu des"
	line "rires à la radio."

	para "Ça donne la chair"
	line "de poule!"
	done
