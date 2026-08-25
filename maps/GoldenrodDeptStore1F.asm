GoldenrodDeptStore1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 24
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore1FDirectoryText

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FReceptionistText, -1
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FPokefanFText, -1
	object_event  5,  5, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FBugCatcherText, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FGentlemanText, -1

GoldenrodDeptStore1FReceptionistText:
	text "Bienvenue au"
	line "centre Commercial"
	cont "de Doublonville."
	done

GoldenrodDeptStore1FGentlemanText:
	text "Le centre Commer-"
	line "cial a un tas de"
	cont "bons produits."

	para "Mais certains"
	line "objets ne sont"

	para "disponibles qu'en"
	line "prix à gagner au"
	cont "Casino."
	done

GoldenrodDeptStore1FPokefanFText:
	text "Je suis très"
	line "impatiente de"
	cont "faire les courses!"
	done

GoldenrodDeptStore1FBugCatcherText:
	text "Maman est trop"
	line "forte quand il"
	cont "s'agit de bizness."

	para "Elle achète tou-"
	line "jours des trucs"
	cont "pas chers."
	done

GoldenrodDeptStore1FDirectoryText:
	text "Rdc  Accueil"

	para "1Er  boutique"
	line "     dresseur"

	para "2Eme collection"
	line "     de combat"

	para "3Eme Pharmacie"

	para "4Eme Y'A bon les"
	line "     CT"

	para "5Eme coin"
	line "     tranquille"

	para "toit Panorama"
	done
