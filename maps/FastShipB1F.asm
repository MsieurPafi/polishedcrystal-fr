FastShipB1F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_FASTSHIPB1F_SAILOR_BLOCKS
	scene_const SCENE_FASTSHIPB1F_NOOP

	def_callbacks

	def_warp_events
	warp_event  1,  9, FAST_SHIP_1F, 11
	warp_event 27, 11, FAST_SHIP_1F, 12

	def_coord_events
	coord_event 26,  5, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksLeft
	coord_event 27,  5, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksRight

	def_bg_events
	bg_event 23,  7, BGEVENT_IFNOTSET, FastShipB1FJugglerFritzSeasickTrashScript

	def_object_events
	object_event 26,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 27,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  5,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  2, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 22,  7, SPRITE_JUGGLER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 10, 11, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBakerSharyn, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 13,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 21,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 11,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 19,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 10,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 10,  9, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

	object_const_def
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftruefwd FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 26, 4
	appear FASTSHIPB1F_SAILOR1
	pause 5
	callasm UpdateSprites
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftruefwd FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 27, 4
	appear FASTSHIPB1F_SAILOR2
	pause 5
	callasm UpdateSprites
	disappear FASTSHIPB1F_SAILOR1
FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptextfaceplayer FastShipB1FOnDutySailorDirectionsText
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftruefwd .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue_jumpopenedtext FastShipB1FOnDutySailorRefusedText
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	jumpthisopenedtext

	text "Hey, kid. Could I"
	line "get you to look"
	cont "for my buddy?"

	para "He's goofing off"
	line "somewhere, that"
	cont "lazy bum!"

	para "I want to go find"
	line "him, but I'm on"
	cont "duty right now."
	done

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalsefwd .NotFoundGirl
	waitendtext

.NotFoundGirl:
	promptbutton
	jumpthisopenedtext

	text "A little girl?"

	para "I may have seen"
	line "her go by here."
	done

GenericTrainerSailorJeff:
	generictrainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText

	text "I guess I can't"
	line "win if I don't get"
	cont "serious."
	done

GenericTrainerPicnickerDebra:
	generictrainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText

	text "Saffron, Celadon…"
	line "I hear there are"

	para "many big cities"
	line "in Kanto."
	done

GenericTrainerJugglerFritz:
	generictrainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText

	text "No more ships for"
	line "me. Next time,"

	para "I'm taking the"
	line "Magnet Train."
	done

GenericTrainerBakerSharyn:
	generictrainer BAKER, SHARYN, EVENT_BEAT_BAKER_SHARYN, BakerSharynSeenText, BakerSharynBeatenText

	text "I may not be the"
	line "best at battles,"

	para "but people love"
	line "my baking."
	done

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script, TRAINERPAL_DARK_SAILOR

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "We get different"
	line "passengers from"

	para "Vermilion City to"
	line "Olivine City."
	done

GenericTrainerFisherJonah:
	generictrainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText

	text "I plan to fish off"
	line "Vermilion's pier."
	done

GenericTrainerBlackbeltWai:
	generictrainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText

	text "I couldn't find"
	line "the Karate King in"
	cont "Johto."

	para "He's supposed to"
	line "be training in a"
	cont "cave somewhere."
	done

GenericTrainerSailorKenneth:
	generictrainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText

	text "Eight Badges!"
	line "They must prove"

	para "that you've beaten"
	line "Gym Leaders."

	para "No wonder you're"
	line "so good!"
	done

GenericTrainerTeacherShirley:
	generictrainer TEACHER_F, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText

	text "We're on a field"
	line "trip to the ruins"
	cont "outside Violet."
	done

GenericTrainerSchoolboyNate:
	generictrainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText

	text "Radios pick up"
	line "strange signals"
	cont "inside the ruins."
	done

GenericTrainerSchoolboyRicky:
	generictrainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText

	text "I read in a #-"
	line "mon Journal that"

	para "there are four of"
	line "those stone panels"
	cont "in the ruins."
	done

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	turn_head_down
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	run_step_left
	remove_fixed_facing
	turn_head_down
	step_end

FastShipB1FJugglerFritzSeasickTrashScript:
	dw EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	jumpthistext

	text "Yuck! Shouldn't"
	line "have looked!"
	done

FastShipB1FOnDutySailorRefusedText:
	text "Oh, ben..."

	para "Le Capitaine va"
	line "être furax..."
	done

FastShipB1FOnDutySailorThanksText:
	text "Merci toi!"
	line "J'lui ai passé un"

	para "savon des familles"
	line "et il va bosser"
	cont "maintenant."
	done

FastShipB1FOnDutySailorDirectionsText:
	text "La salle à manger"
	line "est tout droit."

	para "Les escaliers au"
	line "bout mènent à la"
	cont "cabine du"
	cont "Capitaine."
	done

SailorJeffSeenText:
	text "Y'a rien de tel"
	line "qu'un combat pen-"
	cont "dant la pause."
	done

SailorJeffBeatenText:
	text "Finie la pause!"
	done

PicnickerDebraSeenText:
	text "J'm'ennuie."
	line "...Combat?"
	done

PicnickerDebraBeatenText:
	text "Woah. Cool."
	done

JugglerFritzSeenText:
	text "Beuh..... J'ai"
	line "le mal de mer!"
	done

JugglerFritzBeatenText:
	text "J'peux plus"
	line "bouger..."
	done

BakerSharynSeenText:
	text "As I bake bread,"
	line "I will bake your"
	cont "#mon, too!"
	done

BakerSharynBeatenText:
	text "At least my bread"
	line "is a winner."
	done

SailorGarrettSeenText:
	text "Nous les marins,"
	line "on rigole pas!"
	done

SailorGarrettBeatenText:
	text "Ha ha ha ha ha."
	line "Perdu."
	done

FisherJonahSeenText:
	text "On est en mer"
	line "mais on peut pas"
	cont "pêcher!"

	para "C'est naze!"
	line "Allez...combat!"
	done

FisherJonahBeatenText:
	text "T'es naze..."
	line "J't'aime pas."
	done

BlackbeltWaiSeenText:
	text "Je me muscle les"
	line "jambes avec le"
	cont "tangage du bateau!"
	done

BlackbeltWaiBeatenText:
	text "Je me suis"
	line "tout planté!"
	done

SailorKennethSeenText:
	text "J'suis un marin!"

	para "J'entraîne aussi"
	line "des #mon pour"
	cont "devenir un boss!"
	done

SailorKennethBeatenText:
	text "J'suis un nul..."
	done

TeacherShirleySeenText:
	text "Touche pas à mes"
	line "élèves!"
	done

TeacherShirleyBeatenText:
	text "Aaack!"
	done

SchoolboyNateSeenText:
	text "Tu connais les"
	line "ruines d'alpha?"
	done

SchoolboyNateBeatenText:
	text "Yaargh!"
	done

SchoolboyRickySeenText:
	text "Il y a d'étranges"
	line "panneaux dans les"
	cont "ruines d'alpha."
	done

SchoolboyRickyBeatenText:
	text "Yaaaaaah!"
	done
