PewterMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, PEWTER_CITY, 3
	warp_event  3,  7, PEWTER_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_PEWTER
	object_event  9,  2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterMartYoungsterText, -1
	object_event  6,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterMartSuperNerdText, -1

PewterMartYoungsterText:
	text "Hé! Mate un peu"
	line "mon Leviator!"

	para "Je l'ai eu en en-"
	line "traînant mon"

	para "Magicarpe. Il est"
	line "super balèze!!!"
	done

PewterMartSuperNerdText:
	text "Il y avait un type"
	line "tout vieux et bi-"
	cont "zarre qui vendait"
	cont "des Magicarpe."

	para "Il recommandait"
	line "les Magicarpe du"
	cont "Lac Colère."
	done
