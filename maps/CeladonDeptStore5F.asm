CeladonDeptStore5F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_4F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_6F, 1
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore5FDirectoryText

	def_object_events
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_5F_1, -1
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_5F_2, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore5FGentlemanText, -1
	object_event  3,  3, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore5FSailorText, -1
	object_event  1,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore5FTeacherText, -1

CeladonDeptStore5FGentlemanText:
	text "Je voudrais ache-"
	line "ter des objets"

	para "pour augmenter les"
	line "stats de mes #-"
	cont "mon, mais je n'ai"
	cont "pas assez de sous."
	done

CeladonDeptStore5FSailorText:
	text "Je veux PP plus"
	line "pour augmenter les"

	para "PP des capacités."
	line "Mais on ne peut"
	cont "pas en acheter..."
	done

CeladonDeptStore5FTeacherText:
	text "Utiliser des"
	line "objets sur les"
	cont "#mon les rend"
	cont "heureux."

	para "Mais ils n'aiment"
	line "pas certains"
	cont "objets..."
	done

CeladonDeptStore5FDirectoryText:
	text "Bring Out"
	line "#mon Potential"

	para "5F: Drug Store"
	done
