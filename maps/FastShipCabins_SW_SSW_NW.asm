FastShipCabins_SW_SSW_NW_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed

	def_object_events
	object_event  1, 15, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBug_catcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5, 27, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRichBoyWinston, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  1, 26, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGuitaristmClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

GenericTrainerFirebreatherLyle:
	generictrainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText

	text "I guess fire is"
	line "weak on the sea."

	para "It doesn't matter?"
	line "Really?"
	done

GenericTrainerBug_catcherKen:
	generictrainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, Bug_catcherKenSeenText, Bug_catcherKenBeatenText

	text "You can find lots"
	line "of #mon in the"
	cont "trees of Johto!"
	done

GenericTrainerRichBoyWinston:
	generictrainer RICH_BOY, WINSTON, EVENT_BEAT_RICH_BOY_WINSTON, RichBoyWinstonSeenText, RichBoyWinstonBeatenText

	text "This boat is so"
	line "drab."
	done

GenericTrainerBeautyCassie:
	generictrainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText

	text "A voyage is best"
	line "for getting over"
	cont "a broken heart."

	para "But a Fast Ship"
	line "trip is too short"
	cont "for grieving."
	done

TrainerGuitaristmClyde:
	trainer GUITARISTM, CLYDE, EVENT_BEAT_GUITARISTM_CLYDE, GuitaristmClydeSeenText, GuitaristmClydeBeatenText, 0, GuitaristmClydeScript

GuitaristmClydeScript:
	endifjustbattled
	opentext
	checkbp 0
	iffalsefwd .BattleTower
	jumpthisopenedtext

	text "Speaking of the"
	line "Radio Station,"

	para "what's this week's"
	line "lucky number?"
	done

.BattleTower:
	jumpthisopenedtext

	text "I was going to"
	line "make my debut at"
	cont "the Battle Tower…"

	para "I should go back"
	line "to Vermilion and"
	cont "redo my training…"
	done

FastShipBed:
	showtext FastShipBedText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	turnobject PLAYER, LEFT
	special RestartMapMusic
	special Special_FadeInQuickly
	showtext FastShipBedText2
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftruefwd .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftruefwd .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftruefwd .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftruefwd .ArrivedOlivine
	showtext FastShipArrivedVermilionText
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedOlivine:
	showtext FastShipArrivedOlivineText
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FirebreatherLyleSeenText:
	text "Je vais à Kanto"
	line "me donner en"
	cont "spectacle!"
	done

FirebreatherLyleBeatenText:
	text "Pfff... Ma flamme"
	line "est minuscule..."
	done

Bug_catcherKenSeenText:
	text "Je vais voir ma"
	line "grand-mère pour"
	cont "attraper des"
	cont "insectes!"
	done

Bug_catcherKenBeatenText:
	text "Ooh!"
	line "Fort de café!"
	done

RichBoyWinstonSeenText:
	text "There's no way you"
	line "could afford a"
	cont "ticket."

	para "It looks like we've"
	line "got a stowaway!"
	done

RichBoyWinstonBeatenText:
	text "Wow! Who'd you buy"
	line "your #mon from?"
	done

BeautyCassieSeenText:
	text "J'oublie mes"
	line "malheurs et..."
	cont "combat!"
	done

BeautyCassieBeatenText:
	text "Mon coeur saigne."
	done

GuitaristmClydeSeenText:
	text "Je vais audition-"
	line "ner à la Station"

	para "radio de Doublon-"
	line "ville."
	done

GuitaristmClydeBeatenText:
	text "Wouh!"
	line "Un bide!"
	done



FastShipBedText1:
	text "Un lit douillet!"
	line "Hop! Au dodo..."
	done

FastShipBedText2:
	text "Ah... C'est la"
	line "super pêche!"
	done

FastShipArrivedOlivineText:
	text "Le bateau Express"
	line "Aquaria est arrivé"
	cont "à Oliville."
	done

FastShipArrivedVermilionText:
	text "Le bateau Express"
	line "Aquaria est arrivé"
	cont "à Carmin sur mer."
	done
