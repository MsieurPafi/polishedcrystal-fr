CeladonCafe_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  7, CELADON_CITY, 9
	warp_event  7,  7, CELADON_CITY, 9

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_JUMPTEXT, EatathonContestPosterText
	bg_event  7,  1, BGEVENT_JUMPTEXT, EatathonContestTrashCanText

	def_object_events
	object_event  7,  4, SPRITE_MAYLENE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MayleneScript, -1
	object_event  4,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, -1
	object_event  4,  6, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, -1
	object_event  1,  7, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, -1
	object_event  1,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, -1
	object_event  9,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ChefText_Eatathon, -1
	object_event 11,  4, SPRITE_BAKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCafeBakerText, -1

	object_const_def
	const CELADONCAFE_MAYLENE
	const CELADONCAFE_TEACHER

MayleneScript:
	showtext MayleneText1
	faceplayer
	opentext
	writetext MayleneText2
	waitbutton
	checkevent EVENT_BEAT_MAYLENE
	iftruefwd .Done
	writetext MayleneText3
	yesorno
	iffalsefwd .Refused
	writetext MayleneSeenText
	waitbutton
	closetext
	winlosstext MayleneBeatenText, 0
	setlasttalked CELADONCAFE_MAYLENE
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer MAYLENE, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer MAYLENE, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MAYLENE
	opentext
	writetext MayleneAfterText
	waitbutton
.Done
	closetext
	turnobject CELADONCAFE_MAYLENE, RIGHT
	end

.Refused
	writetext MayleneRefusedText
	waitbutton
	closetext
	turnobject CELADONCAFE_MAYLENE, RIGHT
	end

CeladonCafeTeacher:
	checkkeyitem COIN_CASE
	iftruefwd .NoCoinCase
	showtext TeacherText_CrunchCrunch
	showtextfaceplayer TeacherText_NoCoinCase
	turnobject LAST_TALKED, LEFT
	end

.NoCoinCase:
	showtext TeacherText_KeepEating
	turnobject CELADONCAFE_TEACHER, RIGHT
	showtext TeacherText_MoreChef
	turnobject CELADONCAFE_TEACHER, LEFT
	end

CeladonCafeFisher1:
	showtext Fisher1Text_Snarfle
	showtextfaceplayer Fisher1Text_Concentration
	turnobject LAST_TALKED, LEFT
	end

CeladonCafeFisher2:
	showtext Fisher2Text_GulpChew
	showtextfaceplayer Fisher2Text_Quantity
	turnobject LAST_TALKED, RIGHT
	end

CeladonCafeFisher3:
	showtext Fisher3Text_MunchMunch
	showtextfaceplayer Fisher3Text_GoldenrodIsBest
	turnobject LAST_TALKED, RIGHT
	end

ChefText_Eatathon:
	text "Salut!"

	para "On doit bouffer"
	line "un max."

	para "Je ne peux pas"
	line "t'aider pour"
	cont "l'instant."
	done

Fisher1Text_Snarfle:
	text "...(tousse)..."
	line "...(crache)..."
	done

Fisher1Text_Concentration:
	text "Me parle pas!"

	para "J'vais perdre ma"
	line "concentration!"
	done

Fisher2Text_GulpChew:
	text "...(tousse)..."
	line "...(mâche)..."
	done

Fisher2Text_Quantity:
	text "Bouffer!"
	line "Bouuuuuffer!"

	para "J'vais m'faire"
	line "exploser l'ventre!"
	done

Fisher3Text_MunchMunch:
	text "Miam...(bouffe)..."
	done

Fisher3Text_GoldenrodIsBest:
	text "Ici la nourriture"
	line "est bonne mais"
	cont "celle de Doublon-"
	cont "ville est la meil-"
	cont "leure de toutes."
	done

TeacherText_CrunchCrunch:
	text "(mâche), (croque)."
	done

TeacherText_NoCoinCase:
	text "Personne ne te"
	line "donnera de boîte"

	para "Jeton, ici. Va"
	line "voir à Johto."
	done

TeacherText_KeepEating:
	text "Ouuaiiiiis!"

	para "Manger c'est bon!"
	done

TeacherText_MoreChef:
	text "Et la sauce?"
	done

MayleneText1:
	text "Maylene: Munch"
	line "munch munch…"
	done

MayleneText2:
	text "The eatathon"
	line "contest!"

	para "I never dreamed of"
	line "such a wonderful"
	cont "thing."

	para "After a strict"
	line "diet during train-"
	cont "ing, I can eat"
	cont "like a Snorlax."

	para "The winner eats"
	line "for free, too."

	para "That's just a"
	line "dream come true!"
	done

MayleneText3:
	text "I'm starting to"
	line "feel full…"

	para "Um, as a break,"
	line "do you want to"
	cont "battle with me?"
	done

MayleneRefusedText:
	text "Sigh… OK."
	done

MayleneSeenText:
	text "OK! Rei!"

	para "Oh, that's my bow"
	line "before a match."

	para "I'm throwing every-"
	line "thing I have at"
	cont "you!"
	done

MayleneBeatenText:
	text "I'm forced to admit"
	line "defeat…"

	para "You are much too"
	line "strong."
	done

MayleneAfterText:
	text "Thank you,"
	line "<PLAYER>!"

	para "I'm ready to keep"
	line "on eating!"
	done

CeladonCafeBakerText:
	text "I'm working here"
	line "'cause I get to"

	para "eat any time I"
	line "want. Simple."
	done

EatathonContestPosterText:
	text "Concours de"
	line "Bouffe! Pas de"

	para "temps limite!"
	line "Une joie sans fin!"
	cont "Et c'est gratuit"
	cont "pour le vainqueur!"
	done

EatathonContestTrashCanText:
	text "The trash is full"
	line "of eatathon left-"
	cont "overs…"
	done
