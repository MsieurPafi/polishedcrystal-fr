EcruteakCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlyPoint

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 23, 11, ECRUTEAK_HOUSE, 1
	warp_event 17,  9, ECRUTEAK_SHRINE_OUTSIDE, 3
	warp_event 18,  9, ECRUTEAK_SHRINE_OUTSIDE, 4
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATRE, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event  5, 16, VALERIES_HOUSE, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 20, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 21, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event 29, 27, ECRUTEAK_CHERISH_BALL_HOUSE, 1
	warp_event 13, 16, ECRUTEAK_DESTINY_KNOT_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_JUMPTEXT, EcruteakCitySign
	bg_event  7, 27, BGEVENT_JUMPTEXT, EcruteakGymSign
	bg_event 21, 21, BGEVENT_JUMPTEXT, EcruteakDanceTheaterSign
	bg_event  7,  9, BGEVENT_JUMPTEXT, BurnedTowerSign
	bg_event 15, 11, BGEVENT_JUMPTEXT, EcruteakShrineSign
	bg_event 21, 11, BGEVENT_JUMPTEXT, EcruteakBarrierStationSign
	bg_event  9, 15, BGEVENT_JUMPTEXT, EcruteakCityAdvancedTips
	bg_event 25, 14, BGEVENT_ITEM + HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION
	bg_event 33, 16, BGEVENT_ITEM + RARE_CANDY, EVENT_ECRUTEAK_CITY_HIDDEN_RARE_CANDY
	bg_event  1, 19, BGEVENT_ITEM + ULTRA_BALL, EVENT_ECRUTEAK_CITY_HIDDEN_ULTRA_BALL
	bg_event  6,  6, BGEVENT_ITEM + ETHER, EVENT_ECRUTEAK_CITY_HIDDEN_ETHER

	def_object_events
	object_event 20, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps1Text, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps2Text, -1
	object_event 20, 26, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityLass1Text, -1
	object_event  8, 10, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 11, 16, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityYoungsterText, -1
	object_event  3, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps3Text, EVENT_ECRUTEAK_CITY_GRAMPS
	object_event 11, 11, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityHexManiacText, -1
	object_event 11, 11, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCitySightseerMText, -1
	pokemon_event 12, 11, SMEARGLE, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_BROWN, EcruteakCitySmeargleText, -1
	object_event 16,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 19,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_RIGHT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1

EcruteakCityFlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityLass2Script:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue_jumptextfaceplayer EcruteakCityLass2Text_ReleasedBeasts
	jumpthistextfaceplayer

	text "The tower that"
	line "used to be here…"

	para "My grandma told me"
	line "it used to be much"
	cont "taller."
	done

EcruteakCityFisherScript:
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer EcruteakCityFisherText_JasmineReturned
	jumpthistextfaceplayer

	text "I heard a rumor"
	line "about Olivine"
	cont "Lighthouse."

	para "The #mon that"
	line "serves as the"

	para "beacon fell ill."
	line "Sounds like they"
	cont "are in trouble."
	done

EcruteakCityGramps1Text:
	text "Rosalia avait"
	line "deux tours:"

	para "une à l'Est,"
	line "l'autre à l'Ouest."
	done

EcruteakCityGramps2Text:
	text "Ah..."
	line "As-tu appris à"

	para "danser comme les"
	line "Kimono?"

	para "Si tu vas dans"
	line "leur salle de"

	para "danse, un vieil"
	line "homme bizarre te"
	cont "donnera un cadeau."
	done

EcruteakCityLass1Text:
	text "I'm going to get"
	line "my #mon blessed"

	para "at the shrine."
	line "Care to join me?"
	done

EcruteakCityHexManiacText:
	text "Spirits of #mon"
	line "haunt this place…"
	done

EcruteakCitySightseerMText:
	text "Ecruteak has such"
	line "an incredible"
	cont "history."

	para "Smeargle and I"
	line "traveled here to"
	cont "draw it."
	done

EcruteakCitySmeargleText:
	text "Smeargle: Smeer!"
	done


EcruteakCityLass2Text_ReleasedBeasts:
	text "Trois gros #mon"
	line "se sont enfuis"
	cont "dans des direc-"
	cont "tions différentes."
	cont "Qu'est-ce qui"
	cont "s'organise?"
	done


EcruteakCityFisherText_JasmineReturned:
	text "Le #mon du"
	line "Phare d'Oliville a"
	cont "été soigné."

	para "Les bateaux peu-"
	line "vent de nouveau"
	cont "naviguer de nuit"
	cont "sans soucis."
	done

EcruteakCityYoungsterText:
	text "On dit que les"
	line "#mon sont"

	para "déchaînés au Lac"
	line "colère. J'aimerais"
	cont "bien voir ça."
	done

EcruteakCityGramps3Text:
	text "Il y a bien"
	line "longtemps..."

	para "La tour prit feu."
	line "3 #mon inconnus"

	para "périrent alors"
	line "dans les flammes."

	para "Un #mon aux"
	line "couleurs de l'arc-"

	para "en-ciel descendit"
	line "du ciel et les"
	cont "ressuscita..."

	para "Cette légende est"
	line "connue de tous les"

	para "Champions de"
	line "Rosalia."

	para "Moi?"

	para "J'étais dresseur"
	line "à l'époque."
	cont "Hohoho!"
	done

EcruteakCitySign:
	text "Rosalia"
	line "Une ville bien"

	para "historique où"
	line "le Passé et le"
	cont "Présent se"
	cont "rencontrent"
	done

EcruteakGymSign:
	text "champion d'Arène"
	line "de Rosalia:"
	cont "Mortimer"

	para "Le mystérieux"
	line "voyant"
	done

EcruteakCityAdvancedTips:
	text "Advanced Tips!"

	para "Some #mon you"
	line "encounter may"

	para "have a rare"
	line "ability, also"

	para "known as a"
	line "hidden Ability!"

	para "A hatched #mon"
	line "also has a low"

	para "chance to have"
	line "a hidden Ability."
	done

EcruteakDanceTheaterSign:
	text "salle de danse"
	line "de Rosalia"
	done

BurnedTowerSign:
	text "Tour Cendrée"

	para "Elle a été détrui-"
	line "te par un feu"
	cont "d'origine encore"
	cont "inconnue."

	para "Restez à l'écart"
	line "pour votre propre"
	cont "sécurité."
	done

EcruteakShrineSign:
	text "Ecruteak Shrine"

	para "Life is a lamp-"
	line "flame before a"
	cont "wind."
	done

EcruteakBarrierStationSign:
	text "Barrier Station"
	line "to Bell Tower"

	para "No Trespassing by"
	line "the Unworthy"
	done
