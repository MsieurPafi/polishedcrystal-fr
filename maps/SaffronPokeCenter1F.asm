SaffronPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SAFFRON_CITY, 4
	warp_event  6,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalSabrinaScript

	def_object_events
	pc_nurse_event  5, 1
	object_event 11,  5, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokeCenter1FFisherScript, -1
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronPokeCenter1FTeacherText, -1
	object_event  8,  4, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronPokeCenter1FYoungsterText, -1

PokemonJournalSabrinaScript:
	setflag ENGINE_READ_SABRINA_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Sabrina!"

	para "People say that"
	line "Sabrina can com-"
	cont "municate with her"

	para "#mon during"
	line "battle without"
	cont "speaking."
	done

SaffronPokeCenter1FFisherScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "I just happened to"
	line "come through Rock"

	para "Tunnel. There was"
	line "some commotion at"
	cont "the Power Plant."
	done

.Text2:
	text "Les cavernes s'ef-"
	line "fondrent facile-"
	cont "ment."

	para "Plusieurs ont dis-"
	line "paru au cours des"

	para "années. Tout comme"
	line "celle près"
	cont "d'Azuria."

	para "Et ouais. Seul un"
	line "pro d'la montagne"
	cont "sait tout ça."
	done

SaffronPokeCenter1FTeacherText:
	text "Comment sont les"
	line "Centres #mon"
	cont "de Johto?"

	para "...Je vois."
	line "Ils sont comme"
	cont "ceux de Kanto."

	para "Je peux aller à"
	line "Johto sans crainte"
	cont "dans ce cas!"
	done

SaffronPokeCenter1FYoungsterText:
	text "Les Bureaux de la"
	line "Sylphe SARL et la"

	para "Station du train"
	line "Magnet sont les"

	para "choses à voir à"
	line "Safrania."
	done
