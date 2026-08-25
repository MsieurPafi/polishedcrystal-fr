PlayersNeighborsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_READ, InitialRadio

	def_object_events
	object_event  5,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborText, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	object_event  2,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsDaughterText, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsHusbandText, -1

PlayersNeighborsDaughterText:
	text "Pikachu est un"
	line "#mon évolué."

	para "Les découvertes du"
	line "Prof.Orme sont"
	cont "incroyables."

	para "Ses recherches sur"
	line "l'évolution des"
	cont "#mon sont"
	cont "brillantes."

	para "(soupir)"

	para "J'aimerais être"
	line "comme lui..."
	done

PlayersNeighborsHusbandText:
	text "This town is the"
	line "farthest south-"

	para "east one in all"
	line "of Johto."
	done

PlayersNeighborText:
	text "Ma fille veut"
	line "devenir l'assis-"

	para "tante du Prof."
	line "Orme."

	para "Elle adoooore les"
	line "#mon!"
	cont "Et moi aussi!"
	done
