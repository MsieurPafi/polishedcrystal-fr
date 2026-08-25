VermilionMagnetTrainSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 4
	warp_event  3,  7, VERMILION_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionMagnetTrainSpeechHousePokefanFText, -1
	object_event  0,  3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionMagnetTrainSpeechHouseYoungsterText, -1

VermilionMagnetTrainSpeechHousePokefanFText:
	text "Tu connais le"
	line "train Magnet?"

	para "C'est un train qui"
	line "va à Doublonville"
	cont "à Johto."
	done

VermilionMagnetTrainSpeechHouseYoungsterText:
	text "Je veux aller à"
	line "Safrania pour voir"
	cont "le train Magnet."
	done
