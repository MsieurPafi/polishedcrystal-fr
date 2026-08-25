VermilionHouseFishingSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_JUMPTEXT, FishingDudesHousePhotoText

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, FishingDudeText, -1

FishingDudeText:
	text "Moi chuis le"
	line "gars qui pêche,"
	cont "l'aîné des frères"
	cont "pêcheurs."

	para "As-tu vu le maître"
	line "pêcheur au Lac"
	cont "colère?"

	para "Il rêve de voir le"
	line "plus grand Magi-"
	cont "carpe du monde."

	para "Si ça t'embête pas"
	line "trop, peux-tu lui"

	para "montrer les"
	line "Magicarpe que"
	cont "tu attrapes?"

	para "Qui sait, tu"
	line "attraperas peut-"
	cont "être le Magicarpe"
	cont "de ses rêves."
	done

FishingDudesHousePhotoText:
	text "C'est une photo de"
	line "pêcheurs..."

	para "Ils ont l'air de"
	line "s'amuser..."
	done
