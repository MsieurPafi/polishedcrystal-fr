FuchsiaGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, FUCHSIA_CITY, 2
	warp_event  5, 17, FUCHSIA_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, FuchsiaGymStatue
	bg_event  6, 15, BGEVENT_READ, FuchsiaGymStatue

	def_object_events
	object_event  5,  7, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaGymJanineScript, -1
	object_event  1, 10, SPRITE_FUCHSIA_GYM_1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LassAmandaScript, -1
	object_event  5, 11, SPRITE_FUCHSIA_GYM_2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LassLindaScript, -1
	object_event  9,  4, SPRITE_FUCHSIA_GYM_3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PicnickerCindyScript, -1
	object_event  4,  2, SPRITE_FUCHSIA_GYM_4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, CamperBarryScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymGuyScript, -1

	object_const_def
	const FUCHSIAGYM_JANINE
	const FUCHSIAGYM_FUCHSIA_GYM_1
	const FUCHSIAGYM_FUCHSIA_GYM_2
	const FUCHSIAGYM_FUCHSIA_GYM_3
	const FUCHSIAGYM_FUCHSIA_GYM_4

FuchsiaGymJanineScript:
	checkflag ENGINE_MARSHBADGE
	iftruefwd .FightDone
	applymovement FUCHSIAGYM_JANINE, Movement_NinjaSpin
	showtextfaceplayer JanineText_DisappointYou
	winlosstext JanineText_ToughOne, 0
	loadtrainer JANINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_LASS_AMANDA
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_PICNICKER_CINDY
	setevent EVENT_BEAT_CAMPER_BARRY
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_CUTE_GIRL
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_CUTE_GIRL
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_CUTE_GIRL
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_SCHOOLBOY
	special RefreshSprites
	opentext
	givebadge MARSHBADGE, KANTO_REGION
	callstd kantopostgymevents
	sjumpfwd .AfterBattle
.FightDone:
	faceplayer
	opentext
.AfterBattle:
	checkevent EVENT_GOT_TM66_POISON_JAB
	iftrue_jumpopenedtext JanineText_ApplyMyself
	writetext JanineText_ToxicSpeech
	promptbutton
	verbosegivetmhm TM_POISON_JAB
	setevent EVENT_GOT_TM66_POISON_JAB
	jumpthisopenedtext

	text "It's Poison Jab,"
	line "a powerful Poison-"

	para "type move that"
	line "may poison its"
	cont "victim."
	done

LassAmandaScript:
	checkevent EVENT_BEAT_LASS_AMANDA
	iftruefwd .AmandaUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_1, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	special RefreshSprites
.AmandaUnmasked:
	checkevent EVENT_BEAT_LASS_AMANDA
	iftrue_jumptextfaceplayer LassAmandaAfterText
	faceplayer
	showtext LassAmandaBeforeText
	winlosstext LassAmandaBeatenText, 0
	loadtrainer LASS, AMANDA
	startbattle
	iftruefwd .AmandaBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_AMANDA
	end

.AmandaBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	reloadmapafterbattle
	end

LassLindaScript:
	checkevent EVENT_BEAT_LASS_LINDA
	iftruefwd .LindaUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_2, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	special RefreshSprites
.LindaUnmasked:
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue_jumptextfaceplayer LassLindaAfterText
	faceplayer
	showtext LassLindaBeforeText
	winlosstext LassLindaBeatenText, 0
	loadtrainer LASS, LINDA
	startbattle
	iftruefwd .LindaBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_LINDA
	end

.LindaBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	reloadmapafterbattle
	end

PicnickerCindyScript:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftruefwd .CindyUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_3, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_PICNICKER
	special RefreshSprites
.CindyUnmasked:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue_jumptextfaceplayer PicnickerCindyAfterText
	faceplayer
	showtext PicnickerCindyBeforeText
	winlosstext PicnickerCindyBeatenText, 0
	loadtrainer PICNICKER, CINDY
	startbattle
	iftruefwd .CindyBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_CINDY
	end

.CindyBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	reloadmapafterbattle
	end

CamperBarryScript:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftruefwd .BarryUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_4, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_SCHOOLBOY
	special RefreshSprites
.BarryUnmasked:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue_jumptextfaceplayer CamperBarryAfterText
	faceplayer
	showtext CamperBarryBeforeText
	winlosstext CamperBarryBeatenText, 0
	loadtrainer CAMPER, BARRY
	startbattle
	iftruefwd .BarryBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_BARRY
	end

.BarryBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	reloadmapafterbattle
	end

FuchsiaGymGuyScript:
	checkevent EVENT_BEAT_JANINE
	iftrue_jumptextfaceplayer FuchsiaGymGuyWinText
	jumpthistextfaceplayer

	text "Yo, Champ in"
	line "making!"

	para "Whoops! Take a"
	line "good look around"

	para "you. The trainers"
	line "all look like the"
	cont "Leader, Janine."

	para "Which of them is"
	line "the real Janine?"
	done

FuchsiaGymStatue:
	gettrainername JANINE, 1, STRING_BUFFER_4
	checkflag ENGINE_MARSHBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

Movement_NinjaSpin:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

JanineText_DisappointYou:
	text "Gnah ha ha ha ha!"

	para "Désolée de te dé-"
	line "cevoir mais..."

	para "En fait..."

	para "C'est moi la"
	line "vraie!"

	para "Je suis Jeannine"
	line "de l'Arene de"
	cont "Parmanie!"
	done

JanineText_ToughOne:
	text "Janine: You're a"
	line "tough one. You"
	cont "definitely won…"

if DEF(FAITHFUL)
	para "Here's the Soul"
else
	para "Here's the Marsh"
endc
	line "Badge. Take it."
	done

JanineText_ToxicSpeech:
	text "Janine: You're so"
	line "tough! I have a"
	cont "special gift!"
	done

JanineText_ApplyMyself:
	text "Jeannine: Je vais"
	line "encore m'entraîner"
	cont "et m'améliorer."

	para "Je serai plus for-"
	line "te que toi et mon"
	cont "petit papa!"
	done

LassAmandaBeforeText:
	text "Gnah ha ha ha!"

	para "Je suis Jeannine"
	line "de l'Arene de"
	cont "Parmanie!"

	para "..."
	line "Même pas vrai!"
	done

LassAmandaBeatenText:
	text "Tu m'as crue,"
	line "hein?"
	done

LassAmandaAfterText:
	text "Comment vas-tu"
	line "reconnaître la"
	cont "vraie Championne?"
	done

LassLindaBeforeText:
	text "Tu m'as crue!"
	line "Hahaha! Débile!"
	done

LassLindaBeatenText:
	text "Pfff..."
	line "Même pas mal."
	done

LassLindaAfterText:
	text "Il est pas bien"
	line "mon déguisement?"
	done

PicnickerCindyBeforeText:
	text "Je suis Jeannine!"

	para "..."
	line "Tu me crois, non?"

	para "combat!"
	done

PicnickerCindyBeatenText:
	text "Zut!"
	line "Presque!"
	done

PicnickerCindyAfterText:
	text "Alors?"
	line "Tu fatigues?"
	done

CamperBarryBeforeText:
	text "Wahahaha!"

	para "J'suis Jeannine!"
	line "J'te jure!"
	done

CamperBarryBeatenText:
	text "C'est trop bien de"
	line "se déguiser!"
	done

CamperBarryAfterText:
	text "Alors je suis mimi"
	line "en fille?"
	done


FuchsiaGymGuyWinText:
	text "C'était un beau"
	line "combat, dresseur"
	cont "de Johto!"
	done
