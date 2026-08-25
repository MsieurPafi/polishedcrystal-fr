CeladonDeptStore1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 17
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore1FDirectoryText

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FReceptionistText, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FGentlemanText, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FTeacherText, -1

CeladonDeptStore1FReceptionistText:
	text "Bienvenue au"
	line "centre Commercial"
	cont "de Celadopole!"

	para "Les informations"
	line "sont sur le mur."
	done

CeladonDeptStore1FGentlemanText:
	text "Ce centre Commer-"
	line "cial appartient à"

	para "la même chaîne que"
	line "celui de Doublon-"
	cont "ville."

	para "Ils ont été réno-"
	line "vés en même temps."
	done

CeladonDeptStore1FTeacherText:
	text "C'est la première"
	line "fois que je viens"
	cont "ici."

	para "C'est grand..."

	para "Je vais me perdre."
	line "C'est sûr."
	done

CeladonDeptStore1FDirectoryText:
	text "1F: Service"
	line "    Counter"

	para "2F: Trainer's"
	line "    Market"

	para "3F: Tech Shop"

	para "4F: Wiseman Gifts"

	para "5F: Drug Store"

	para "6F: Rooftop"
	line "    Atrium"
	done
