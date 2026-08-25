GoldenrodDeptStore6F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15,  0, GOLDENROD_DEPT_STORE_5F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 13,  0, GOLDENROD_DEPT_STORE_ROOF, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore6FDirectoryText

	def_object_events
	object_event 10,  2, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore6FLassText, -1
	object_event  8,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore6FSuperNerdText, -1

GoldenrodDeptStore6FLassText:
	text "Écoutes-tu"
	line "l'Antenne de la"
	cont "chance?"

	para "Si tu veux gagner,"
	line "échange un maximum"

	para "de #mon avec le"
	line "plus de personnes"

	para "possibles pour"
	line "avoir un max de"
	cont "numéros ID"
	cont "différents."
	done

GoldenrodDeptStore6FSuperNerdText:
	text "Si tu es naze,"
	line "sers-toi du"
	cont "distributeur auto-"
	cont "matique."

	para "Ton #mon"
	line "appréciera aussi."
	done

GoldenrodDeptStore6FDirectoryText:
	text "Une petite pause!"

	para "5Eme coin"
	line "     tranquille"
	done
