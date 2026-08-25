GoldenrodDeptStore2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_3F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_1F, 3
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore2FDirectoryText

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_GOLDENROD_2F_1, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore2FYoungsterText, -1
	object_event  6,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore2FCooltrainerFText, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore2FGentlemanText, -1

GoldenrodDeptStore2FClerk2Script:
	checkevent EVENT_GOT_EEVEE
	iftruefwd .eevee
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2

.eevee
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2_EEVEE

GoldenrodDeptStore2FYoungsterText:
	text "#gear has no"
	line "storage limit."

	para "But getting too"
	line "many phone calls"
	cont "can be annoying."
	done

GoldenrodDeptStore2FCooltrainerFText:
	text "J'ai eu mon Abra"
	line "au Casino."

	para "Maintenant, c'est"
	line "mon meilleur ami."
	done

GoldenrodDeptStore2FGentlemanText:
	text "Ce centre Commer-"
	line "cial montre que"

	para "Doublonville est"
	line "une grande ville."

	para "La marchandise est"
	line "la meilleure de"
	cont "la région."
	done

GoldenrodDeptStore2FDirectoryText:
	text "Votre compagnon de"
	line "voyage"

	para "1Er  boutique"
	line "     dresseur"
	done
