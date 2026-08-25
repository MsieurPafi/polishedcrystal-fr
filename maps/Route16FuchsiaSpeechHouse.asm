Route16FuchsiaSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_16_NORTH, 1
	warp_event  3,  7, ROUTE_16_NORTH, 1

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route16FuchsiaSpeechHouseSuperNerdText, -1
	object_event  5,  4, SPRITE_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route16FuchsiaSpeechHouseLadyText, -1

Route16FuchsiaSpeechHouseSuperNerdText:
	text "Si tu descends la"
	line "Piste Cyclable, tu"

	para "te retrouveras à"
	line "Parmanie."
	done

Route16FuchsiaSpeechHouseLadyText:
	text "The person who"
	line "used to live here"

	para "moved away three"
	line "years ago."

	para "I wonder where"
	line "she went?"
	done
