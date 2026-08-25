DanceTheatre_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 15, ECRUTEAK_CITY, 8
	warp_event  6, 15, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, MapDanceTheatreSignpost1Script
	bg_event  6,  6, BGEVENT_UP, MapDanceTheatreSignpost1Script

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerKimono_girlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLACK, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 0, GenericTrainerKimono_girlMiki, -1
	object_event  7, 12, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	pokemon_event  6, 10, RHYDON, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, RhydonText, -1
	object_event 10, 12, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreCooltrainerMText, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreGrannyText, -1
	object_event  1, 10, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DanceTheatreLadyText, -1

GenericTrainerKimono_girlNaoko:
	assert !DEF(TRAINERPAL_NAOKO) ; the default TRAINERPAL_KIMONO_GIRL is hers
	generictrainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, Kimono_girlNaokoSeenText, Kimono_girlNaokoBeatenText

	text "I enjoyed that"
	line "bout. I would like"
	cont "to see you again."
	done

GenericTrainerKimono_girlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, Kimono_girlSayoSeenText, Kimono_girlSayoBeatenText, 0, .Script, TRAINERPAL_SAYO

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Rhythm is impor-"
	line "tant for both"

	para "dancing and #-"
	line "mon."
	done

GenericTrainerKimono_girlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, Kimono_girlZukiSeenText, Kimono_girlZukiBeatenText, 0, .Script, TRAINERPAL_ZUKI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "I put a different"
	line "flower in my bar-"
	cont "rette every month."
	done

GenericTrainerKimono_girlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, Kimono_girlKuniSeenText, Kimono_girlKuniBeatenText, 0, .Script, TRAINERPAL_KUNI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "I trained a lot,"
	line "so I thought I was"

	para "a capable trainer."
	line "I guess I'm not."
	done

GenericTrainerKimono_girlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, Kimono_girlMikiSeenText, Kimono_girlMikiBeatenText, 0, .Script, TRAINERPAL_MIKI

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "I can keep dancing"
	line "because there are"

	para "people who enjoy"
	line "what I do."

	para "My #mon keep my"
	line "spirits up too."
	done

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue_jumpopenedtext SurfGuyElegantKimonoGirlsText
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalsefwd .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalsefwd .KimonoGirlsUndefeated
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegivetmhm HM_SURF
	setevent EVENT_GOT_HM03_SURF
	jumpthisopenedtext

	text "That's Surf."

	para "It's a move that"
	line "lets #mon swim"
	cont "across water."
	done

.KimonoGirlsUndefeated:
	jumpthisopenedtext

	text "Kiddo! If you can"
	line "defeat all the"

	para "Kimono Girls, I'll"
	line "give you a gift."
	done

MapDanceTheatreSignpost1Script:
	jumpthistext

	text "It's a fancy panel"
	line "that's decorated"
	cont "with flowers."
	done

Kimono_girlNaokoSeenText:
	text "Tu as de jolis"
	line "#mon. On peut"
	cont "voir c'que ça"
	cont "donne en combat?"
	done

Kimono_girlNaokoBeatenText:
	text "Oh, bravo les"
	line "biscotos!!"
	done

Kimono_girlSayoSeenText:
	text "Je danse toujours"
	line "avec mes #mon."

	para "Bien sûr, je les"
	line "entraîne aussi."
	done

Kimono_girlSayoBeatenText:
	text "Oh, presque!"
	line "J'ai failli"
	cont "t'avoir."
	done

Kimono_girlZukiSeenText:
	text "Elle est pas belle"
	line "ma barrette?"

	para "Oh! Un combat de"
	line "#mon?"
	done

Kimono_girlZukiBeatenText:
	text "Je n'ai plus de"
	line "#mon..."
	done

Kimono_girlKuniSeenText:
	text "Oh, t'es tout"
	line "mimi comme"
	cont "dresseur! Un petit"
	cont "combat en tête à"
	cont "tête?"
	done

Kimono_girlKuniBeatenText:
	text "Tu es plus cool"
	line "que tu n'en n'as"
	cont "pas l'air."
	done

Kimono_girlMikiSeenText:
	text "Tu aimes mes pas"
	line "de danse? La pure"
	cont "classe, non?"
	cont "Mais je suis aussi"
	cont "forte en #mon."
	done

Kimono_girlMikiBeatenText:
	text ".... Heu... T'es"
	line "pas naze non"
	cont "plus toi!"
	done

SurfGuyNeverLeftAScratchText:
	text "Les Kimono ne sont"
	line "pas seulement de"

	para "bonnes danseuses,"
	line "elles sont aussi"
	cont "douées en #mon."

	para "Je les défie"
	line "souvent..."
	done

SurfGuyLikeADanceText:
	text "La façon dont tu"
	line "as combattu..."
	cont "C'était beau comme"
	cont "une danse."

	para "Beau comme une"
	line "pirouette!"

	para "Je veux que tu"
	line "acceptes ceci."
	cont "N'aie pas peur!"
	cont "Prends-le!"
	done

SurfGuyElegantKimonoGirlsText:
	text "I wish my #mon"
	line "were as elegant as"
	cont "the Kimono Girls."
	done

RhydonText:
	text "Rhinoferos: Ross!"
	line "Férrroosss!"
	done

DanceTheatreCooltrainerMText:
	text "Cet homme est"
	line "toujours avec son"
	cont "Rhinoferos."

	para "Il dit vouloir"
	line "un #mon sachant"
	cont "surfer et danser."

	para "Est-ce qu'il veut"
	line "faire de la"
	cont "natation de #-"
	cont "mon synchronisée?"
	done

DanceTheatreGrannyText:
	text "Les Kimono sont"
	line "très belles..."

	para "Mais elles doivent"
	line "suivre un"
	cont "entraînement de"
	cont "titan."

	para "Elles doivent"
	line "apprendre à suivre"

	para "des règles avant"
	line "de se montrer en"
	cont "public."

	para "Mais quand tu"
	line "aimes quelque"
	cont "chose, tout est"
	cont "possible."
	done

DanceTheatreLadyText:
	text "Eevee can evolve"
	line "into Leafeon, Gla-"
	cont "ceon, or Sylveon,"

	para "but I don't see"
	line "any of them here."

	para "I wonder if the"
	line "Kimono Girls who"

	para "use them are"
	line "somewhere else?"
	done
