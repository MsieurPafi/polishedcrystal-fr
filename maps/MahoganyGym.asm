MahoganyGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftruefwd .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	givebadge GLACIERBADGE, JOHTO_REGION
	; Begin Team Rocket takeover of Radio Tower
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	specialphonecall SPECIALCALL_WEIRDBROADCAST
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	setmapscene MAHOGANY_TOWN, SCENE_MAHOGANYTOWN_NOOP
.FightDone:
	checkevent EVENT_GOT_TM67_AVALANCHE
	iftrue_jumpopenedtext PryceText_CherishYourPokemon
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegivetmhm TM_AVALANCHE
	setevent EVENT_GOT_TM67_AVALANCHE
	jumpthisopenedtext

	text "That TM contains"
	line "Avalanche."

	para "It deals more"
	line "damage if the user"
	cont "was hurt first."

	para "It demonstrates"
	line "the harshness of"
	cont "winter."
	done

GenericTrainerSkierRoxanne:
	generictrainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText

	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this Gym."
	done

GenericTrainerSkierClarissa:
	generictrainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText

	text "I shouldn't have"
	line "been bragging"
	cont "about my skiing…"
	done

GenericTrainerBoarderRonald:
	generictrainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText

	text "I think there's a"
	line "move a #mon"

	para "can use while it's"
	line "frozen."
	done

GenericTrainerBoarderBrad:
	generictrainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText

	text "This Gym is great."
	line "I love boarding"
	cont "with my #mon!"
	done

GenericTrainerBoarderDouglas:
	generictrainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText

	text "The secret behind"
	line "Pryce's power…"

	para "He meditates under"
	line "a waterfall daily"

	para "to strengthen his"
	line "mind and body."
	done

MahoganyGymGuyScript:
	checkevent EVENT_BEAT_PRYCE
	iftrue_jumptextfaceplayer MahoganyGymGuyWinText
	jumpthistextfaceplayer

	text "Pryce is a veteran"
	line "who has trained"

	para "#mon for some"
	line "50 years."

	para "He's said to be"
	line "good at freezing"

	para "opponents with"
	line "ice-type moves."

	para "That means you"
	line "should melt him"

	para "with your burning"
	line "ambition!"
	done

MahoganyGymStatue:
	gettrainername PRYCE, 1, STRING_BUFFER_4
	checkflag ENGINE_GLACIERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 14, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

PryceText_Intro:
	text "#mon have many"
	line "experiences in"

	para "their lives, just"
	line "like we do."

	para "I, too, have seen"
	line "and suffered much"
	cont "in my life."

	para "Since I am your"
	line "elder, let me show"
	cont "you what I mean."

	para "I have been with"
	line "#mon since"

	para "before you were"
	line "born."

	para "I do not lose"
	line "easily."

	para "I, Pryce--the"
	line "winter trainer--"

	para "shall demonstrate"
	line "my power!"
	done

PryceText_Impressed:
	text "Ah, je suis très"
	line "impressionné par"
	cont "ta prouesse."

	para "Avec un tempé-"
	line "rament comme le"

	para "tien, tu surmon-"
	line "teras tous les"
	cont "obstacles de la"
	cont "vie."

	para "Tu mérites ce"
	line "Badge!"
	done

PryceText_GlacierBadgeSpeech:
	text "That Badge will"
	line "let your #mon"

	para "use Whirlpool to"
	line "cross whirlpools."

	para "And this… This is"
	line "a gift from me!"
	done

PryceText_CherishYourPokemon:
	text "Lorsque la glace"
	line "et la neige"
	cont "fondent, le"
	cont "printemps arrive."

	para "Toi et tes #-"
	line "mon serez ensemble"
	cont "pendant des"
	cont "années."

	para "Profitez bien de"
	line "ces instants!"
	done

BoarderRonaldSeenText:
	text "Je vais geler tes"
	line "#mon et tu ne"
	cont "pourras plus rien"
	cont "faire!"
	done

BoarderRonaldBeatenText:
	text "Saperlipopette!"
	line "Je n'ai rien pu"
	cont "faire."
	done

BoarderBradSeenText:
	text "Cette Arène a le"
	line "sol glissant."

	para "C'est délire, pas"
	line "vrai?"

	para "Mais..."
	line "Fini de jouer!"
	done

BoarderBradBeatenText:
	text "Tu vois à quel"
	line "point on est"
	cont "sérieux ici?"
	done

BoarderDouglasSeenText:
	text "Je connais le"
	line "secret de Frédo."
	done

BoarderDouglasBeatenText:
	text "OK. Je vais te"
	line "le dire."
	done

SkierRoxanneSeenText:
	text "Pour vaincre"
	line "Frédo, notre"

	para "champion d'Arène,"
	line "tu dois penser"
	cont "avant de patiner."
	done

SkierRoxanneBeatenText:
	text "Enfin, moi j'te"
	line "bats en ski!"
	done

SkierClarissaSeenText:
	text "Sors de mon"
	line "slalom!"
	done

SkierClarissaBeatenText:
	text "Non! Tu m'as fait"
	line "déraper!"
	done


MahoganyGymGuyWinText:
	text "Frédo, c'est quel-"
	line "qu'un, mais toi"
	cont "t'es pas naze"
	cont "non plus!"

	para "C'était un combat"
	line "chaud qui a soudé"

	para "l'écart entre deux"
	line "générations!"
	done
