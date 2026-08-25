CeladonDeptStore2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_3F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_1F, 3
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore2FDirectoryText

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_2F_1, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_2F_2, -1
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore2FPokefanMText, -1
	object_event  6,  2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore2FYoungsterText, -1

CeladonDeptStore2FPokefanMText:
	text "Je suis un dres-"
	line "seur depuis peu."

	para "Mon fils m'a un"
	line "peu poussé."

	para "Il y a tellement"
	line "d'objets..."
	cont "C'est dingue!"
	done

CeladonDeptStore2FYoungsterText:
	text "Mon père a du mal"
	line "à retenir tous les"

	para "objets et leurs"
	line "fonctions..."
	done

CeladonDeptStore2FDirectoryText:
	text "De bons objets"
	line "pour de bons dres-"
	cont "seurs!"

	para "1Er:  marche du"
	line "      dresseur"
	done
