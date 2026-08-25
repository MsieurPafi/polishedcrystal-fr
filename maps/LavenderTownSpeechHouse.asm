LavenderTownSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 3
	warp_event  3,  7, LAVENDER_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderSpeechHousePokefanFText, -1

LavenderSpeechHousePokefanFText:
	text "Lavanville est"
	line "une petite ville"

	para "calme au pied des"
	line "montagnes."

	para "Il y a plus de"
	line "passage depuis la"

	para "construction de la"
	line "Tour Radio."
	done
