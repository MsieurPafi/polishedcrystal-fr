FastShipCabins_NNW_NNE_NE_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  4,  5, SPRITE_PI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPILooker, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4,  3, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

	object_const_def
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR

GenericTrainerPILooker:
	generictrainer PI, LOOKER, EVENT_BEAT_PI_LOOKER, PILookerSeenText, PILookerBeatenText

	text "My code name,"
	line "it is Looker."

	para "It is what they"
	line "all call me."

	para "I am on the look-"
	line "out for members"
	cont "of Team Rocket."

	para "What?! You defeat-"
	line "ed them?"

	para "Bravo!"
	done

GenericTrainerCooltrainermSean:
	generictrainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText

	text "Trainers from"
	line "Johto can battle"

	para "with Kanto Gym"
	line "Leaders."
	done

GenericTrainerCooltrainerfCarol:
	generictrainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText

	text "I'm going to beat"
	line "you someday!"
	done

GenericTrainerPokemaniacEthan:
	generictrainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText

	text "Lily's nice, but"
	line "Mary's the best!"

	para "I want to check"
	line "out Johto's radio"
	cont "programs!"
	done

GenericTrainerHikerNoland:
	generictrainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText

	text "I wonder if there"
	line "are any mountains"

	para "worth climbing in"
	line "Kanto?"
	done

GenericTrainerGentlemanEdward:
	generictrainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText

	text "I give up."
	line "You don't have to"

	para "look. Just forget"
	line "about it!"
	done

GenericTrainerBurglarCorey:
	generictrainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText

	text "I found a pretty"
	line "coin here."

	para "Someone must have"
	line "lost it…"
	done

FastShipLazySailorScript:
	special SaveMusic
	playmusic MUSIC_HIKER_ENCOUNTER
	showtextfaceplayer SailorStanlySeenText
	winlosstext SailorStanlyBeatenText, SailorStanlyBeatenText
	loadtrainer SAILOR, STANLY
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	showtext SailorStanlyAfterBattleText
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FASTSHIPB1F_NOOP
	readvar VAR_FACING
	ifequalfwd $3, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipLazySailorLeavesMovement1:
	step_left
	step_left
	step_up
	step_up
	step_end

FastShipLazySailorLeavesMovement2:
	step_down
	step_left
	step_left
	step_up
	step_up
	step_up
	step_end

PILookerSeenText:
	text "WHAAAT?!"

	para "…How did you know?"
	line "How did you unmask"

	para "me as a member of"
	line "the International"
	cont "Police?!"
	done

PILookerBeatenText:
	text "Quite admirable,"
	line "you are!"
	done

CooltrainermSeanSeenText:
	text "Je vais à Kanto"
	line "pour m'entraîner."
	done

CooltrainermSeanBeatenText:
	text "J'voulais gagner!"
	done

CooltrainerfCarolSeenText:
	text "J'm'entraîne pour"
	line "être la meilleure!"
	done

CooltrainerfCarolBeatenText:
	text "Pourquoi?"
	done

PokemaniacEthanSeenText:
	text "Tu connais Petra?"
	line "C'est un super DJ"
	cont "de Kanto."
	done

PokemaniacEthanBeatenText:
	text "Gyaaaah!"
	done

HikerNolandSeenText:
	text "Ça va?"
	line "Alors...combat!"
	done

HikerNolandBeatenText:
	text "T'es trop, toi!"
	line "Pfouiii!"
	done

SailorStanlySeenText:
	text "Ouaip. Moi j'suis"
	line "un marin."

	para "Un vrai de vrai."
	line "Pur boeuf!"

	para "J'suis grand."
	line "J'suis beau."
	cont "Je sens le sable"
	cont "chaud."

	para "Oh! Tu m'écoutes?"
	line "...combat!"
	done

SailorStanlyBeatenText:
	text "Heu... Comment?"
	line "De quoi?"
	done

SailorStanlyAfterBattleText:
	text "Dans la mariiine,"
	line "on n'est pas des"
	cont "p'tites filles!"
	cont "Dans la mariiine!"
	done

GentlemanEdwardSeenText:
	text "J'ai perdu un truc"
	line "super important..."
	done

GentlemanEdwardBeatenText:
	text "J'le...trouve..."
	line "...pas!!!"
	done

BurglarCoreySeenText:
	text "Ouaiiis!"
	line "Le bol!"
	done

BurglarCoreyBeatenText:
	text "Ooooh!"
	line "Pas d'bol!"
	done
