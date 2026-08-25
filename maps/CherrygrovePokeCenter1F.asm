CherrygrovePokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CHERRYGROVE_CITY, 2
	warp_event  6,  7, CHERRYGROVE_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalRedScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokeCenter1FTeacherScript, -1
	object_event  8,  1, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FFisherText, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FGentlemanText, -1
	object_event  9,  4, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FLadyText, -1

PokemonJournalRedScript:
	setflag ENGINE_READ_RED_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "<PK><MN> Trainer Red!"

	para "Red is said to"
	line "have defeated his"

	para "rival Blue for the"
	line "title of #mon"

	para "League Champion in"
	line "record time."
	done

CherrygrovePokeCenter1FTeacherScript:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "The Communication"
	line "Center upstairs"
	cont "was just built."

	para "But they're still"
	line "finishing it up."
	done

.Text2:
	text "Le centre de"
	line "communication"
	cont "d'au-dessus vient"
	cont "d'être construit."

	para "J'y ai échangé"
	line "des #mon!"
	done

CherrygrovePokeCenter1FFisherText:
	text "C'est super. Je"
	line "peux stocker"

	para "autant de #mon"
	line "que je veux et"
	cont "c'est gratuit."
	done

CherrygrovePokeCenter1FGentlemanText:
	text "Ce PC est en libre"
	line "service pour les"
	cont "dresseurs."
	done

CherrygrovePokeCenter1FLadyText:
	text "#mon Journal"
	line "has such fascin-"
	cont "ating stories!"

	para "I come to #mon"
	line "Centers for the"

	para "latest issues, but"
	line "they're not the"

	para "only place with"
	line "a subscription."
	done
