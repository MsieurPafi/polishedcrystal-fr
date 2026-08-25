MahoganyPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, MAHOGANY_TOWN, 4
	warp_event  6,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalPryceScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FPokefanmText, -1
	object_event  1,  3, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FYoungsterText, -1
	object_event  2,  3, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FCooltrainerfText, -1

PokemonJournalPryceScript:
	setflag ENGINE_READ_PRYCE_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Pryce!"

	para "Pryce's middle name"
	line "is Willow."

	para "His fighting style"
	line "is said to be as"

	para "flexible as a"
	line "willow tree in"
	cont "winter, which has"

	para "earned him the"
	line "nickname the"
	cont "winter trainer."
	done

MahoganyPokeCenter1FPokefanmText:
	text "C'est quoi ça? La"
	line "Team Rocket est de"
	cont "retour?"

	para "J'ai vu des hommes"
	line "en noir au Lac"
	cont "colère..."
	done

MahoganyPokeCenter1FYoungsterText:
	text "J'ai empêché mes"
	line "#mon d'évoluer"
	cont "trop tôt."

	para "Je leur fais"
	line "apprendre cer-"
	cont "taines capacités"
	cont "avant de les faire"
	cont "évoluer."
	done

MahoganyPokeCenter1FCooltrainerfText:
	text "Les #mon"
	line "deviennent bien"

	para "plus forts lorsqu'"
	line "ils évoluent mais"
	cont "ils apprennent"
	cont "leurs capacités"
	cont "plus lentement."
	done
