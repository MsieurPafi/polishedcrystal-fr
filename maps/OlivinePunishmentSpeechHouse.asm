OlivinePunishmentSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 4
	warp_event  3,  7, OLIVINE_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivinePunishmentSpeechHouseDadText, -1
	object_event  5,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivinePunishmentSpeechHouseDaughterText, -1

OlivinePunishmentSpeechHouseDadText:
	text "Sur le chemin"
	line "d'Irisia, il y a"

	para "quatre îles"
	line "désertes."

	para "Les petites"
	line "canailles y sont"
	cont "emmenées en guise"
	cont "de punition!"
	done

OlivinePunishmentSpeechHouseDaughterText:
	text "A chaque fois que"
	line "je fais des"
	cont "bêtises, papa me"
	cont "dit qu'il va m'y"
	cont "envoyer et moi"
	cont "j'ai peur!"
	done
