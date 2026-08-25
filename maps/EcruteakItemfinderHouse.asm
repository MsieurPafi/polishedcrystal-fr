EcruteakItemfinderHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1

EcruteakItemfinderGuy:
	checkevent EVENT_GOT_ITEMFINDER
	iftrue_jumptextfaceplayer ItemfinderExplanationText
	faceplayer
	opentext
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse_jumpopenedtext EcruteakItemfinderToEachHisOwnText
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegivekeyitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
	jumpthisopenedtext

ItemfinderExplanationText:
	text "Il y a beaucoup"
	line "d'objets cachés"
	cont "par terre."

	para "Utilise Cherch'"
	line "objet pour voir"

	para "s'il y a un objet"
	line "par terre près de"
	cont "toi."

	para "Ça ne te montre"
	line "pas l'endroit"

	para "exact mais c'est"
	line "sûrement dans les"
	cont "environs."

	para "Ah oui, j'ai en-"
	line "tendu dire qu'il y"

	para "a des objets dans"
	line "la Tour Cendrée"
	cont "de Rosalia."
	done

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iffalse_endtext
	writetext EcruteakTwoTowersText
	yesorno
	iffalse_endtext
	jumpthisopenedtext

	text "Ecruteak was also"
	line "home to three"

	para "#mon that raced"
	line "around the town."

	para "They were said to"
	line "have been born of"

	para "water, lightning"
	line "and fire."

	para "But they could not"
	line "contain their"
	cont "excessive power."

	para "So they say the"
	line "three ran like the"

	para "wind off into the"
	line "grassland."
	done

EcruteakItemfinderAdventureText:
	text "Ah! Tu fais les"
	line "400 coups avec tes"
	cont "#mon?"

	para "Mais qu'est-ce"
	line "qu'une aventure"
	cont "sans une chasse au"
	cont "trésor?"

	para "J'ai bon ou j'ai"
	line "bon?"
	done

EcruteakItemfinderTrueSpiritText:
	text "C'est cool, tu"
	line "comprends le vrai"

	para "esprit de l'aven-"
	line "ture."

	para "Et moi, j'aime ça!"
	line "Prends ça avec"
	cont "toi."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Oh... Chacun pour"
	line "soi je parie."
	done

EcruteakHistoryBookText:
	text "histoire de"
	line "Rosalia"

	para "Désirez-vous lire?"
	done

EcruteakTwoTowersText:
	text "Il existait deux"
	line "tours à Rosalia."

	para "Chacune d'elle"
	line "était le perchoir"
	cont "d'un puissant"
	cont "#mon volant."

	para "Mais l'une des"
	line "tours a complète-"
	cont "ment brûlé."

	para "Les deux #mon"
	line "n'ont jamais été"
	cont "revus depuis..."

	para "Continuer à lire?"
	done
