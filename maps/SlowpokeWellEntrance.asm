SlowpokeWellEntrance_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11,  7, AZALEA_TOWN, 6
	warp_event  7,  5, SLOWPOKE_WELL_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  6, 13, BGEVENT_ITEM + SUPER_POTION, EVENT_SLOWPOKE_WELL_ENTRANCE_HIDDEN_SUPER_POTION

	def_object_events
	object_event  8,  9, SPRITE_KURT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SlowpokeWellEntranceKurtText, EVENT_SLOWPOKE_WELL_KURT

SlowpokeWellEntranceKurtText:
	text "Fargas: Salut,"
	line "<PLAYER>!"

	para "Le garde a"
	line "décampé quand je"
	cont "lui ai crié"
	cont "dessus..."

	para "Et puis je suis"
	line "descendu dans le"
	cont "Puits."

	para "Et ben j'me suis"
	line "planté et... Je"
	cont "peux plus bouger."

	para "Pfff! Si j'étais"
	line "en forme, mes"

	para "#mon les au-"
	line "raient punis..."

	para "C'est vraiment"
	line "trop bête."

	para "<PLAYER>, va leur"
	line "mettre une raclée"
	cont "à ma place!"
	done
