ElmsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  4, NEW_BARK_TOWN, 5
	warp_event  7,  5, NEW_BARK_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, ElmsHouseFridgeText
	bg_event  6,  1, BGEVENT_JUMPTEXT, ElmsHousePCText
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  1,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ElmsWifeText, -1
	object_event  4,  5, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ElmsSonText, -1

ElmsWifeText:
	text "Salut <PLAYER>!"
	line "Mon mari est tou-"

	para "jours occupé..."
	line "J'espère qu'il va"
	cont "bien."

	para "Lorsqu'il travail-"
	line "le, il oublie même"
	cont "de manger."
	done

ElmsSonText:
	text "Quand je serai"
	line "grand, j'aiderai"
	cont "mon papa!"

	para "Je serai un sacré"
	line "professeur #-"
	cont "mon super balèze!"
	done

ElmsHouseFridgeText:
	text "Il y a de la"
	line "nourriture ici."
	cont "Ça doit être pour"
	cont "les #mon."
	done

ElmsHousePCText:
	text "#mon. Where do"
	line "they come from?"

	para "Where are they"
	line "going?"

	para "Why has no one"
	line "ever witnessed a"
	cont "#mon's birth?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #mon!"

	para "…"

	para "It's a part of"
	line "Prof.Elm's re-"
	cont "search papers."
	done
