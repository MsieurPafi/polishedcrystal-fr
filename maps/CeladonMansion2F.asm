CeladonMansion2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	def_coord_events

	def_bg_events
	bg_event  0,  3, BGEVENT_JUMPTEXT, CeladonMansion2FComputerText
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FSign
	bg_event  2,  3, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events

CeladonMansion2FSign:
	jumpthistext

	text "Game Freak"
	line "Meeting Room"
	done

CeladonMansion2FComputerText:
	text "<PLAYER> allume"
	line "le PC."

	para "…"

	para "Quelqu'un était en"
	line "train d'écrire un"
	cont "e-mail..."

	para "...J'espère que"
	line "vous viendrez à"
	cont "Kanto."

	para "Vous verrez à quel"
	line "point les choses"
	cont "ont changé ici."

	para "Vous verrez même"
	line "des #mon qui"

	para "n'existent pas à"
	line "Johto."

	para "Pour le Producteur"

	para "..."
	done
