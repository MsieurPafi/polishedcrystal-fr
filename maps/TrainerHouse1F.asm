TrainerHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, VIRIDIAN_CITY, 3
	warp_event  5, 11, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, TrainerHouseSign1Text
	bg_event  9,  0, BGEVENT_JUMPTEXT, TrainerHouseSign2Text
	bg_event  4,  6, BGEVENT_JUMPTEXT, TrainerHouseIllegibleText

	def_object_events
	object_event  1, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FReceptionistText, -1
	object_event  8, 10, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerMText, -1
	object_event  6,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerFText, -1
	object_event  7,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FYoungsterText, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FGentlemanText, -1

TrainerHouse1FReceptionistText:
	text "Bienvenue au Club"
	line "des dresseurs,"

	para "l'attraction de"
	line "Jadielle."

	para "Nous accueillons"
	line "les dresseurs."

	para "Vous pouvez com-"
	line "battre les meil-"

	para "leurs à l'étage"
	line "inférieur."
	done

TrainerHouse1FCooltrainerMText:
	text "Viridian is the"
	line "town closest to"
	cont "Indigo Plateau."

	para "It's known as the"
	line "gateway to Indigo"
	cont "Plateau!"

	para "They built this"
	line "place because so"

	para "many trainers pass"
	line "through on their"

	para "way up to the"
	line "#mon League."
	done

TrainerHouse1FCooltrainerFText:
	text "Des combats d'en-"
	line "traînement se dé-"
	cont "roulent en bas."

	para "J'aimerais bien"
	line "voir comment se"

	para "débrouille un"
	line "dresseur de Johto."
	done

TrainerHouse1FYoungsterText:
	text "A mon avis, on ne"
	line "peut pas devenir"

	para "un maître sans"
	line "avoir tout vu et"

	para "combattu tout le"
	line "monde."

	para "Le maître de"
	line "Palette a voyagé"

	para "dans tous les"
	line "coins de Kanto."
	done

TrainerHouse1FGentlemanText:
	text "Fouiii...j'ai trop"
	line "combattu. Je me"
	cont "repose un peu."
	done

TrainerHouseSign1Text:
	text "Des combats d'en-"
	line "traînement se dé-"

	para "roulent en bas,"
	line "dans le Hall d'en-"
	cont "traînement."

	para "Les bons dresseurs"
	line "y sont invités."
	done

TrainerHouseSign2Text:
	text "Comme pour les"
	line "combats en exté-"

	para "rieur, il n'y a"
	line "pas de règles spé-"

	para "ciales pour les"
	line "combats d'entraî-"
	cont "nement!"
	done

TrainerHouseIllegibleText:
	text "...C'est quoi ça?"
	line "Une note sur la"
	cont "stratégie?"

	para "On dirait des tra-"
	line "cés faits par un"

	para "Onix..."
	line "C'est illisible..."
	done
