RadioTower4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, RadioTower4FProductionSignText
	bg_event 15,  0, BGEVENT_JUMPTEXT, RadioTower4FStudio2SignText

	def_object_events
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower4FFisherText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_MARY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	pokemon_event 12,  7, MEOWTH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, RadioTowerMeowthText, -1
	object_event 14,  1, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerProton1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerRocketScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

	object_const_def
	const RADIOTOWER4F_ROCKET

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FAIRYFEATHER_FROM_MARY
	iftrue_jumpopenedtext RadioTower4FDJMaryText_After
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .ClearedRockets
	jumpthisopenedtext

	text "Mary: Why? Why do"
	line "I have to suffer"
	cont "through this?"

	para "Meowth, help me!"
	done

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem FAIRYFEATHER
	iffalse_endtext
	setevent EVENT_GOT_FAIRYFEATHER_FROM_MARY
	jumpthisopenedtext

	text "Mary: It's just"
	line "right for #mon"

	para "that know Fairy-"
	line "type moves."
	done

GenericTrainerGruntM10:
	generictrainer GRUNTM, 10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText

	text "I don't believe"
	line "it! I was beaten!"
	done

GenericTrainerProton1:
	generictrainer PROTON, PROTON1, EVENT_BEAT_PROTON_1, Proton1SeenText, Proton1BeatenText

	text "You've earned my"
	line "respect, so here's"
	cont "some advice."

	para "It's not too late."
	line "You can still turn"
	cont "back."
	done

GenericTrainerGruntF4:
	generictrainer GRUNTF, 4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText

	text "I love my"
	line "beautiful self!"

	para "Who cares about"
	line "#mon?"
	done

GenericTrainerRocketScientistRich:
	generictrainer ROCKET_SCIENTIST, RICH, EVENT_BEAT_ROCKET_SCIENTIST_RICH, RocketScientistRichSeenText, RocketScientistRichBeatenText

	text "Do you honestly"
	line "believe you can"
	cont "stop Team Rocket?"
	done

RadioTower4FFisherText:
	text "J'écoutais la ra-"
	line "dio tout en visi-"
	cont "tant les ruines."

	para "J'y ai entendu une"
	line "émission étrange."
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "Lula: Oh! Tu es"
	line "formidable!"

	para "Veux-tu de ceci"
	line "en remerciement?"
	done

RadioTower4FDJMaryText_After:
	text "Lula: Écouté mon"
	line "émission avec le"

	para "Prof.Chen: la"
	line "Chronique #mon."
	done

RadioTowerMeowthText:
	text "Miaouss: Miaou..."
	done

GruntM10SeenText:
	text "Tu comptes sauver"
	line "le Directeur?"

	para "Je crois que ça va"
	line "pas être possible."
	cont "J'vais t'écraser!"
	done

GruntM10BeatenText:
	text "Incroyable!"
	done

Proton1SeenText:
	text "Stop! On m'appelle"
	line "la forteresse de"
	cont "la Team Rocket!"

	para "Pas un pas de"
	line "plus, poussin!"
	done

Proton1BeatenText:
	text "Tout cassé ma"
	line "forteresse!"
	done

GruntF4SeenText:
	text "Quoi? Est-ce que"
	line "les #mon sont"
	cont "mignons?"

	para "Les miens seront"
	line "mignons après"

	para "t'avoir fichu une"
	line "raclée, ouais!"
	done

GruntF4BeatenText:
	text "Oh, non! Ils sont"
	line "nuls!"
	done

RocketScientistRichSeenText:
	text "Parfait."

	para "Cette Tour Radio"
	line "sera parfaite pour"
	cont "nos plans."
	done

RocketScientistRichBeatenText:
	text "Hmmm..."

	para "Tout plan comprend"
	line "certains accrocs."
	done

RadioTower4FProductionSignText:
	text "3Eme Production"
	done

RadioTower4FStudio2SignText:
	text "3Eme studio 2"
	done
