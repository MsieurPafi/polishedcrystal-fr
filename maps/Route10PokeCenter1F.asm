Route10PokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ROUTE_10_NORTH, 1
	warp_event  6,  7, ROUTE_10_NORTH, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalAgathaScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10PokeCenter1FGymGuyScript, -1
	object_event  9,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route10PokeCenter1FGentlemanText, -1
	object_event  2,  3, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route10PokeCenter1FCooltrainerfText, -1

PokemonJournalAgathaScript:
	setflag ENGINE_READ_AGATHA_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Ex-Elite Agatha!"

	para "In their youth,"
	line "Agatha and Prof."
	cont "Oak were rivals"

	para "who vied for supr-"
	line "emacy as trainers."
	done

Route10PokeCenter1FGymGuyScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "The Power Plant's"
	line "Manager is looking"

	para "for a strong #-"
	line "mon trainer."

	para "He needs help"
	line "getting back"

	para "something that"
	line "was stolen."
	done

.Text2:
	text "On dit que la Team"
	line "Rocket s'est re-"

	para "formée à Johto et"
	line "s'est plantée à"
	cont "nouveau."

	para "C'est tout ce"
	line "qu'on raconte."
	done

Route10PokeCenter1FGentlemanText:
	text "Un centre #mon"
	line "près d'une"
	cont "caverne?"

	para "C'est super"
	line "pratique, ça."
	done

Route10PokeCenter1FCooltrainerfText:
	text "Dehors on voit le"
	line "toit d'un très"

	para "grand bâtiment."

	para "C'est la centrale."
	done
