OlivineMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_OLIVINE
	object_event  6,  2, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineMartCooltrainerFText, -1
	object_event  1,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineMartLassText, -1

OlivineMartCooltrainerFText:
	text "Est-ce que ton"
	line "#mon connait"

	para "la capacité qui"
	line "permet de trans-"
	cont "porter des per-"
	cont "sonnes sur l'eau?"
	done

OlivineMartLassText:
	text "Mon Papilusion"
	line "vient de mon petit"
	cont "copain de l'autre"
	cont "côté de la mer."

	para "Il nous transporte"
	line "nos Lettres."

	para "Tu veux savoir ce"
	line "qui est écrit?"

	para "Alors... Ah!"
	line "Désolée! C'est"
	cont "perso une lettre"
	cont "comme ça!"
	done
