Route5_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17, 27, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  8, 31, ROUTE_5_SAFFRON_CITY_GATE, 1
	warp_event  9, 31, ROUTE_5_SAFFRON_CITY_GATE, 2
	warp_event 10, 21, ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 18, 28, BGEVENT_JUMPTEXT, Route5UndergroundPathSignText
	bg_event  5, 27, BGEVENT_JUMPTEXT, Route5AdvancedTipsSignText

	def_object_events
	object_event 17, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route5PokefanMText, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH

Route5PokefanMText:
	text "La route sera"
	line "fermée tant que le"

	para "problème à la"
	line "centrale ne sera"
	cont "pas résolu."
	done

Route5UndergroundPathSignText:
	text "souterrain"

	para "Azuria -"
	line "Carmin sur mer"
	done

Route5AdvancedTipsSignText:
	text "Advanced Tips!"

	para "Berserk Gene is"
	line "a powerful held"

	para "item, but it"
	line "causes confusion."

	para "But a #mon"
	line "with the Own Tempo"

	para "Ability won't"
	line "get confused!"
	done
