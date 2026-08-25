AzaleaMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 3
	warp_event  3,  7, AZALEA_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_AZALEA
	object_event  2,  5, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartCooltrainermText, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartBugCatcherText, -1
	object_event  8,  6, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << MORN) | (1 << DAY), PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartLadyText, -1
	object_event  8,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << EVE) | (1 << NITE), PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartRockerText, -1

AzaleaMartCooltrainermText:
	text "Il n'y a pas"
	line "de super Balls."

	para "Les # Balls"
	line "devront faire"
	cont "l'affaire."

	para "J'aimerais que"
	line "Fargas me fabri-"
	cont "que quelques unes"
	cont "de ses Balls"
	cont "artisanales."
	done

AzaleaMartBugCatcherText:
	text "Une super Ball est"
	line "plus efficace"
	cont "qu'une # Ball"
	cont "pour attraper les"
	cont "#mon."

	para "Mais celles de"
	line "Fargas sont plus"
	cont "efficaces quelque-"
	cont "fois."
	done

AzaleaMartLadyText:
	text "I can buy many"
	line "items at home in"
	cont "Goldenrod City,"

	para "but for boosting"
	line "Fire-type moves,"

	para "nothing beats"
	line "Azalea's Charcoal!"
	done

AzaleaMartRockerText:
	text "The prototype"
	line "versions of"

	para "Kurt's balls had"
	line "some problems."

	para "Love Balls used"
	line "to catch same-"
	cont "gender #mon,"

	para "and Fast Balls"
	line "only worked for"

	para "three different"
	line "#mon species."

	para "Thank goodness"
	line "those problems"
	cont "were fixed!"
	done
