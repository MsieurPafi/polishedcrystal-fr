Route41_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13, 17, WHIRL_ISLAND_NW, 1
	warp_event 37, 19, WHIRL_ISLAND_NE, 1
	warp_event 13, 37, WHIRL_ISLAND_SW, 1
	warp_event 37, 45, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

	def_object_events
	object_event 57, 14, SPRITE_MARLON, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route41MarlonScript, -1
	object_event 32,  6, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermMathew, -1
	object_event 57, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermLewis, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmerfWendy, -1
	itemball_event 56, 12, SILVER_LEAF, 1, EVENT_ROUTE_41_SILVER_LEAF

	object_const_def
	const ROUTE41_MARLON

Route41MarlonScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MARLON_AGAIN
	iftruefwd .Beaten
	checkevent EVENT_BEAT_MARLON
	iffalsefwd .NotYetBattled
	writetext .RematchText
	sjumpfwd .Battle
.NotYetBattled
	checkevent EVENT_INTRODUCED_MARLON
	iftruefwd .Introduced1
	writetext .IntroText
	waitbutton
	setevent EVENT_INTRODUCED_MARLON
.Introduced1
	writetext .ChallengeText
.Battle
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE41_MARLON
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Rematch1
	loadtrainer MARLON, 1
	sjumpfwd .StartBattle
.Rematch1
	loadtrainer MARLON, 2
	sjumpfwd .StartBattle
.Rematch2
	loadtrainer MARLON, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	opentext
.Beaten:
	writetext .AfterText
	waitbutton
	closetext
	setevent EVENT_BEAT_MARLON
	setevent EVENT_BEAT_MARLON_AGAIN
	end

.IntroText:
	text "Marlon: Uihaa!"

	para "Sup, so you're"
	line "<PLAYER>!"

	para "The name's Marlon,"
	line "man of the sea!"

	para "Me 'n' my #mon"
	line "swam here from"
	cont "the Unova region!"
	done

.ChallengeText:
	text "You look strong!"
	line "Shoots!"

	para "We should totally"
	line "have a battle!"
	done

.RematchText:
	text "Ohoho! 'Sup,"
	line "<PLAYER>!"

	para "So I'm facing"
	line "you again!"

	para "You're gonna get"
	line "swept away,"
	cont "fo' sho'!"
	done

.RefusedText:
	text "Aw, man!"
	done

.SeenText:
	text "Right on,"
	line "let's roll!"
	done

.BeatenText:
	text "You totally rocked"
	line "that!"

	para "You got this Trai-"
	line "ner thing down!"
	done

.AfterText:
	text "You don't just"
	line "look strong, you're"
	cont "strong fo' reals!"

	para "Eh, I was swept"
	line "away, too!"
	done

GenericTrainerSwimmerfKaylee:
	generictrainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText

	text "There's supposed"
	line "to be a big #-"
	cont "mon deep beneath"
	cont "Whirl Islands."

	para "I wonder what it"
	line "could be?"
	done

GenericTrainerSwimmerfSusie:
	generictrainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText

	text "Wasn't there a hit"
	line "song about a boy"
	cont "riding a Lapras?"
	done

GenericTrainerSwimmerfDenise:
	generictrainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText

	text "A sunburn is the"
	line "worst for skin."

	para "But I don't use a"
	line "sunblock."

	para "I won't pollute"
	line "the water."
	done

GenericTrainerSwimmerfKara:
	generictrainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText

	text "I heard roars from"
	line "deep inside the"
	cont "Islands."
	done

GenericTrainerSwimmerfWendy:
	generictrainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText

	text "The clusters of"
	line "Staryu light up"
	cont "at the same time."

	para "It's so beautiful,"
	line "it's scary."
	done

GenericTrainerSwimmermCharlie:
	generictrainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText

	text "Isn't it relaxing"
	line "just floating like"
	cont "this?"
	done

GenericTrainerSwimmermGeorge:
	generictrainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText

	text "It's so far to"
	line "Cianwood."

	para "But it's no easy"
	line "return trip to"
	cont "Olivine either."

	para "What should I do?"
	done

GenericTrainerSwimmermBerke:
	generictrainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText

	text "It was a dark and"
	line "stormy night…"

	para "I saw this giant"
	line "#mon flying"
	cont "from the islands."

	para "It was scattering"
	line "feathers from its"
	cont "silver wings."
	done

GenericTrainerSwimmermKirk:
	generictrainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText

	text "The currents keep"
	line "me from reaching"
	cont "that island."
	done

GenericTrainerSwimmermMathew:
	generictrainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText

	text "A secret about"
	line "Whirl Islands…"

	para "It's pitch-black"
	line "inside!"
	done

GenericTrainerSwimmermLewis:
	generictrainer SWIMMERM, LEWIS, EVENT_BEAT_SWIMMERM_LEWIS, SwimmermLewisSeenText, SwimmermLewisBeatenText

	text "It takes knowledge"
	line "and experience"

	para "to not get lost"
	line "in the water."
	done

SwimmermCharlieSeenText:
	text "l'eau est bonne"
	line "par ici."

	para "Tu veux combattre?"
	line "Pas de problème!"
	done

SwimmermCharlieBeatenText:
	text "J'suis tout fripé!"
	done

SwimmermGeorgeSeenText:
	text "J'suis fatigué."
	line "Si je gagne, tu me"
	cont "prêtes tes #-"
	cont "mon, OK?"
	done

SwimmermGeorgeBeatenText:
	text "Pfff...pff..."
	done

SwimmermBerkeSeenText:
	text "Tu vois ces îles"
	line "bloquées par des"
	cont "siphons?"

	para "Il doit y avoir"
	line "quelque chose de"
	cont "secret!"
	done

SwimmermBerkeBeatenText:
	text "Pourquoi t'es"
	line "cool, toi?"
	done

SwimmermKirkSeenText:
	text "Les vagues sont"
	line "dangereuses ici."

	para "Elles empêchent de"
	line "nager calmement."
	done

SwimmermKirkBeatenText:
	text "J'suis crevé!"
	done

SwimmermMathewSeenText:
	text "Tu cherches le"
	line "secret des"
	cont "Tourb'Îles?"
	done

SwimmermMathewBeatenText:
	text "Ooh!!! Quelle"
	line "endurance!"
	done

SwimmermLewisSeenText:
	text "I feel right at"
	line "home in the sea!"
	done

SwimmermLewisBeatenText:
	text "Beaten in my own"
	line "home?"
	done

SwimmerfKayleeSeenText:
	text "Je vais aux"
	line "Tourb'Îles."

	para "Je vais les explo-"
	line "rer avec un ami."
	done

SwimmerfKayleeBeatenText:
	text "C'est tout?"
	done

SwimmerfSusieSeenText:
	text "Cool, t'es à dada"
	line "sur ton #mon."
	done

SwimmerfSusieBeatenText:
	text "Tout perdu..."
	done

SwimmerfDeniseSeenText:
	text "Il fait si beau!"
	line "C'est la fête!"
	cont "Youkiii!"
	done

SwimmerfDeniseBeatenText:
	text "Ohhh!"
	done

SwimmerfKaraSeenText:
	text "Si tu es naze,"
	line "fais la planche!"

	para "Bon..."
	line "On s'bat?"
	done

SwimmerfKaraBeatenText:
	text "Oh! Tu en as de"
	line "l'énergie, toi."
	done

SwimmerfWendySeenText:
	text "La nuit tombée,"
	line "des Stari se réu-"
	cont "nissent à la sur-"
	cont "face de l'eau."
	done

SwimmerfWendyBeatenText:
	text "Oh..."
	done
