Route32RuinsOfAlphGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, RUINS_OF_ALPH_OUTSIDE, 11
	warp_event  0,  5, RUINS_OF_ALPH_OUTSIDE, 12
	warp_event  9,  4, ROUTE_32, 2
	warp_event  9,  5, ROUTE_32, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32RuinsOfAlphGateOfficerText, -1
	object_event  8,  2, SPRITE_HIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32RuinsOfAlphGatePokefanMText, -1
	object_event  1,  6, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32RuinsOfAlphGateYoungsterText, -1

Route32RuinsOfAlphGateOfficerText:
	text "ruines d'alpha"

	para "Un site touristi-"
	line "que interactif."

	para "Essayez les pan-"
	line "neaux coulissants!"
	done

Route32RuinsOfAlphGatePokefanMText:
	text "Tu étudies les"
	line "ruines d'alpha?"

	para "Tu aimes la"
	line "science, toi!"
	done

Route32RuinsOfAlphGateYoungsterText:
	text "Il y a des dessins"
	line "sur les panneaux."

	para "J'ai essayé de les"
	line "déplacer. Quelle"
	cont "est leur fonction?"
	done
