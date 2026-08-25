Route34_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE34_NOOP
	scene_const SCENE_ROUTE34_LYRA_DAYCARE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route34EggCheckCallback

	def_warp_events
	warp_event 13, 37, ROUTE_34_ILEX_FOREST_GATE, 1
	warp_event 14, 37, ROUTE_34_ILEX_FOREST_GATE, 2
	warp_event 11, 14, DAYCARE, 1
	warp_event 11, 15, DAYCARE, 2
	warp_event 13, 15, DAYCARE, 3

	def_coord_events
	coord_event  8, 17, SCENE_ROUTE34_LYRA_DAYCARE, Route34LyraTrigger1
	coord_event  9, 17, SCENE_ROUTE34_LYRA_DAYCARE, Route34LyraTrigger2
	coord_event 10, 17, SCENE_ROUTE34_LYRA_DAYCARE, Route34LyraTrigger3

	def_bg_events
	bg_event 12,  6, BGEVENT_JUMPTEXT, Route34SignText
	bg_event 13, 33, BGEVENT_JUMPTEXT, Route34TrainerTipsText
	bg_event 18, 23, BGEVENT_JUMPTEXT, Route34AdvancedTipsSignText
	bg_event 10, 13, BGEVENT_JUMPTEXT, DayCareSignText
	bg_event  8, 32, BGEVENT_ITEM + RARE_CANDY, EVENT_ROUTE_34_HIDDEN_RARE_CANDY
	bg_event 17, 19, BGEVENT_ITEM + SUPER_POTION, EVENT_ROUTE_34_HIDDEN_SUPER_POTION

	def_object_events
	object_event 11, 20, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route34RichBoyIrvingScript, -1
	object_event 10, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAYCARE_MAN_ON_ROUTE_34
	object_event  8, 12, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_ROUTE_34
	object_event 13,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerCamperTodd1, -1
	object_event 15, 32, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederJulie, -1
	object_event 10, 26, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerPicnickerGina1, -1
	object_event  6, 10, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficerfMaraScript, -1
	object_event 18, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmBrandon, -1
	object_event 14, 18, SPRITE_DAYCARE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAYCARE_MON_1
	object_event 17, 19, SPRITE_DAYCARE_MON_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAYCARE_MON_2
	object_event 11, 48, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfIrene, -1
	object_event  3, 48, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event  6, 51, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKate, -1
	itemball_event  7, 30, NUGGET, 1, EVENT_ROUTE_34_NUGGET

	object_const_def
	const ROUTE34_RICH_BOY
	const ROUTE34_GRAMPS
	const ROUTE34_LYRA

Route34EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftruefwd .PutDayCareManOutside
	checkscene
	iftruefwd .PutDayCareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	sjumpfwd .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	; fallthrough

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalsefwd .HideMon1
	clearevent EVENT_DAYCARE_MON_1
	sjumpfwd .CheckMon2

.HideMon1:
	setevent EVENT_DAYCARE_MON_1
	; fallthrough

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalsefwd .HideMon2
	clearevent EVENT_DAYCARE_MON_2
	endcallback

.HideMon2:
	setevent EVENT_DAYCARE_MON_2
	endcallback

Route34LyraTrigger1:
	applyonemovement PLAYER, step_right
	sjumpfwd Route34LyraTrigger2

Route34LyraTrigger3:
	applyonemovement PLAYER, step_left
Route34LyraTrigger2:
	turnobject PLAYER, UP
	special Special_FadeOutMusic
	showtext Route34LyraText_Grandpa
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	appear ROUTE34_LYRA
	turnobject ROUTE34_GRAMPS, UP
	pause 10
	applymovement ROUTE34_LYRA, Route34MovementData_LyraComesDown
	turnobject ROUTE34_GRAMPS, LEFT
	showtext Route34LyraGoodWorkText
	showemote EMOTE_SHOCK, ROUTE34_LYRA, 15
	pause 15
	turnobject ROUTE34_LYRA, DOWN
	showtext Route34LyraGreetingText
	applyonemovement PLAYER, step_up
	pause 10
	turnobject ROUTE34_LYRA, RIGHT
	showtext Route34LyraIntroductionText
	turnobject ROUTE34_LYRA, DOWN
	pause 10
	showtext Route34LyraChallengeText
	setevent EVENT_LYRA_ROUTE_34
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext Route34LyraWinText, Route34LyraLossText
	setlasttalked ROUTE34_LYRA
	loadtrainer LYRA1, LYRA1_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	sjumpfwd .AfterBattle

.Totodile:
	winlosstext Route34LyraWinText, Route34LyraLossText
	setlasttalked ROUTE34_LYRA
	loadtrainer LYRA1, LYRA1_5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	sjumpfwd .AfterBattle

.Chikorita:
	winlosstext Route34LyraWinText, Route34LyraLossText
	setlasttalked ROUTE34_LYRA
	loadtrainer LYRA1, LYRA1_6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
.AfterBattle
	showtext Route34LyraFollowMeText
	applyonemovement ROUTE34_GRAMPS, slow_step_right
	playsound SFX_EXIT_BUILDING
	disappear ROUTE34_GRAMPS
	follow ROUTE34_LYRA, PLAYER
	applymovement ROUTE34_LYRA, Route34MovementData_LyraEntersDayCare
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear ROUTE34_LYRA
	applyonemovement PLAYER, step_right
	setscene SCENE_ROUTE34_NOOP
	pause 15
	warpcheck
	warpsound
	newloadmap MAPSETUP_DOOR
	end

DayCareManScript_Outside:
	faceplayer
	opentext
	special Special_DayCareManOutside
	waitbutton
	closetext
	ifequalfwd $1, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	setevent EVENT_BRED_AN_EGG
	readvar VAR_FACING
	ifequalfwd LEFT, .walk_around_player
	applyonemovement ROUTE34_GRAMPS, slow_step_right
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
	end

DayCareMon1Script:
	opentext
	special Special_DayCareMon1
	endtext

DayCareMon2Script:
	opentext
	special Special_DayCareMon2
	endtext

TrainerCamperTodd1:
	trainer CAMPER, TODD1, EVENT_BEAT_CAMPER_TODD, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_CAMPER_TODD
	opentext
	checkflag ENGINE_TODD_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue_jumpopenedtext CamperToddSaleText
	checkcellnum PHONE_CAMPER_TODD
	iftruefwd .NumberAccepted
	checkevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext CamperTodd1AfterText
	promptbutton
	setevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .FinishAsk

.AskAgain:
	callstd asknumber2m
.FinishAsk:
	askforphonenumber PHONE_CAMPER_TODD
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername CAMPER, TODD1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.Rematch:
	callstd rematchm
	winlosstext CamperTodd1BeatenText, 0
	readmem wToddFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer CAMPER, TODD1
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 1
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer CAMPER, TODD2
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 2
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer CAMPER, TODD3
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 3
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer CAMPER, TODD4
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 4
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer CAMPER, TODD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

TrainerPicnickerGina1:
	trainer PICNICKER, GINA1, EVENT_BEAT_PICNICKER_GINA, PicnickerGina1SeenText, PicnickerGina1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_GINA
	opentext
	checkflag ENGINE_GINA_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftruefwd .LeafStone
	checkcellnum PHONE_PICNICKER_GINA
	iftruefwd .NumberAccepted
	checkevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext PicnickerGina1AfterText
	promptbutton
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1f
	sjumpfwd .FinishAsk

.AskAgain:
	callstd asknumber2f
.FinishAsk:
	askforphonenumber PHONE_PICNICKER_GINA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername PICNICKER, GINA1, STRING_BUFFER_3
	callstd registerednumberf
	jumpstd numberacceptedf

.Rematch:
	callstd rematchf
	winlosstext PicnickerGina1BeatenText, 0
	readmem wGinaFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, GINA1
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 1
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, GINA2
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 2
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, GINA3
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 3
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, GINA4
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 4
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, GINA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LeafStone:
	callstd giftf
	verbosegiveitem LEAF_STONE
	iffalsefwd .BagFull
	clearflag ENGINE_GINA_HAS_LEAF_STONE
	setevent EVENT_GINA_GAVE_LEAF_STONE
	jumpstd numberacceptedf

.BagFull:
	jumpstd packfullf

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

OfficerfMaraScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer OfficerfMaraDaytimeText
	checkevent EVENT_BEAT_OFFICERF_MARA
	iftrue_jumptextfaceplayer OfficerfMaraAfterText
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerfMaraSeenText
	waitbutton
	closetext
	winlosstext OfficerfMaraWinText, 0
	loadtrainer OFFICERF, MARA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERF_MARA
	endtext

GenericTrainerBreederJulie:
	generictrainer BREEDER, JULIE, EVENT_BEAT_BREEDER_JULIE, BreederJulieSeenText, BreederJulieBeatenText

	text "One of my #mon"
	line "has an Adamant"

	para "nature. Another"
	line "has a Lax nature."

	para "It seems to make"
	line "a difference in"
	cont "battle."
	done

Route34RichBoyIrvingScript:
	checkevent EVENT_GOT_BIG_NUGGET_FROM_ROUTE_34_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_RICH_BOY_IRVING
	iftruefwd .Beaten
	checkevent EVENT_BEAT_CAMPER_TODD
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PICNICKER_GINA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_OFFICERF_MARA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANM_BRANDON
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BREEDER_JULIE
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE34_RICH_BOY
	loadtrainer RICH_BOY, IRVING
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RICH_BOY_IRVING
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem BIG_NUGGET
	iffalse_endtext
	setevent EVENT_GOT_BIG_NUGGET_FROM_ROUTE_34_LEADER
	jumpthisopenedtext

.AfterText2:
	text "There are some"
	line "things that money"
	cont "can't buy."
	done

.IntroText:
	text "I don't need to"
	line "gamble for Coins."

	para "I'm rich, so I"
	line "bought my #-"
	cont "mon with cash!"

	para "They're strong"
	line "enough that we"
	cont "beat Azalea's Gym!"

	para "You want to battle"
	line "them? Fine--just"

	para "beat everyone else"
	line "here first!"

	para "Even the Officer,"
	line "although she may"

	para "not battle you"
	line "until night."
	done

.QuestionText:
	text "You really did it!"
	line "Well then,"
	cont "noblesse oblige."

	para "Are you ready to"
	line "fight my top-shelf"
	cont "team?"
	done

.RefusedText:
	text "Not so desperate"
	line "for prize money"
	cont "after all?"
	done

.SeenText:
	text "I'm a cut above"
	line "the commoners"
	cont "you beat here!"
	done

.BeatenText:
	text "No! My money"
	line "wasn't enough…"
	done

.AfterText1:
	text "You've clearly"
	line "earned this item."

	para "Sell it and go on"
	line "a shopping spree,"

	para "or keep it as a"
	line "memento of our"
	cont "battle."
	done

GenericTrainerPokefanmBrandon:
	generictrainer POKEFANM, BRANDON, EVENT_BEAT_POKEFANM_BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText

	text "My #mon knew"
	line "moves I didn't"
	cont "know it had."

	para "That confounded me"
	line "to no end!"
	done

TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_GOT_POWER_HERB_FROM_KATE
	iftrue_jumptext CooltrainerfIreneAfterText2
	jumpthistext

	text "Irene: My sister"
	line "Kate will get you"
	cont "for this!"
	done

TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_GOT_POWER_HERB_FROM_KATE
	iftrue_jumptext CooltrainerfJennAfterText2
	jumpthistext

	text "Jenn: Don't get"
	line "cocky! My sister"
	cont "Kate is tough!"
	done

TrainerCooltrainerfKate:
	trainer COOLTRAINERF, KATE, EVENT_BEAT_COOLTRAINERF_KATE, CooltrainerfKateSeenText, CooltrainerfKateBeatenText, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_GOT_POWER_HERB_FROM_KATE
	iftrue_jumptext CooltrainerfKateAfterText
	opentext
	writetext CooltrainerfKateOfferPowerHerbText
	promptbutton
	verbosegiveitem POWER_HERB
	iffalse_endtext
	setevent EVENT_GOT_POWER_HERB_FROM_KATE
	jumpthisopenedtext

CooltrainerfKateAfterText:
	text "Irène: Désolée de"
	line "t'avoir sauté"
	cont "dessus."

	para "On ne pensait pas"
	line "que quelqu'un"

	para "nous trouverait"
	line "ici. Tu nous as"
	cont "bien surprises!"
	done

Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step_up
	slow_step_right
	step_end

Route34MovementData_LyraComesDown:
	step_down
	step_down
	step_down
	step_right
	step_end

Route34MovementData_LyraEntersDayCare:
	step_right
	step_right
	step_end

Route34LyraText_Grandpa:
	text "Lyra: Grandpa!"
	done

Route34LyraGoodWorkText:
	text "Lyra: Good work,"
	line "Grandpa!"

	para "The #mon you"
	line "raised for me is"
	cont "healthy as can be!"

	para "You look fit,"
	line "too!"
	done

Route34LyraGreetingText:
	text "Lyra: Hi, <PLAYER>!"
	done

Route34LyraIntroductionText:
	text "Grandpa, this is"
	line "my friend!"

	para "<PLAYER> is quite"
	line "good at raising"
	cont "#mon."

	para "Well, not as good"
	line "as you, of course!"
	done

Route34LyraChallengeText:
	text "<PLAYER>, why don't"
	line "we show Grandpa"
	cont "how good you are?"
	done

Route34LyraWinText:
	text "You're even better"
	line "than I thought!"
	done

Route34LyraLossText:
	text "Well, you're still"
	line "getting better…"
	done

Route34LyraFollowMeText:
	text "Lyra: Let me"
	line "introduce you to"
	cont "Grandma, too!"
	done

BreederJulieSeenText:
	text "This is where I"
	line "train my baby"
	cont "#mon!"
	done

BreederJulieBeatenText:
	text "Battu par toi???"
	done

CamperTodd1SeenText:
	text "J'ai foi en mon"
	line "talent de dresseur"
	cont "de #mon."

	para "Tu veux voir?"
	done

CamperTodd1BeatenText:
	text "J'ai raté mon en-"
	line "traînement?"
	done

CamperTodd1AfterText:
	text "Je devrais en"
	line "mettre un en Pen-"

	para "sion. Ou peut-"
	line "être utiliser des"
	cont "objets..."
	done

CamperToddSaleText:
	text "Faire des courses"
	line "sous le ciel!"

	para "Ça c'est la super"
	line "classe."
	done

PicnickerGina1SeenText:
	text "Tu t'entraînes?"

	para "On se fait un duel"
	line "d'entraînement?"
	done

PicnickerGina1BeatenText:
	text "Ne gagnerai-je"
	line "donc jamais?"
	done

PicnickerGina1AfterText:
	text "Tu es trop balèze"
	line "pour qu'on s'en-"
	cont "traîne ensemble."
	done

OfficerfMaraSeenText:
	text "Qui va là?"
	line "Pour quelle"
	cont "raison?"
	done

OfficerfMaraWinText:
	text "T'es coriace toi!"
	done

OfficerfMaraAfterText:
	text "Yes, I see nothing"
	line "wrong today. You"

	para "be good and stay"
	line "out of trouble."
	done

OfficerfMaraDaytimeText:
	text "Je contrôle tous"
	line "ceux qui ont l'air"
	cont "louche."
	done

PokefanmBrandonSeenText:
	text "Mon #mon vient"
	line "de rentrer de la"
	cont "Pension."

	para "Voyons s'il est"
	line "plus fort!"
	done

PokefanmBrandonBeatenText:
	text "Pourquoi?"
	done

CooltrainerfIreneSeenText:
	text "Amy: Kyaaah! On"
	line "nous a trouvées!"
	done

CooltrainerfIreneBeatenText:
	text "Amy: Ohhh!"
	done

CooltrainerfIreneAfterText2:
	text "Amy: Elle est"
	line "pas excellente"
	cont "cette plage?"

	para "C'est notre"
	line "cachette secrète!"
	done

CooltrainerfJennSeenText:
	text "Maria: Tu ne peux"
	line "battre Amy comme"
	cont "ça! Attends!"
	done

CooltrainerfJennBeatenText:
	text "Maria: Pardon Amy!"
	done

CooltrainerfJennAfterText2:
	text "Maria: Le soleil"
	line "rend le corps"
	cont "plus fort."
	done

CooltrainerfKateSeenText:
	text "Irène: T'as pas"
	line "été sympa avec mes"
	cont "petites soeurs!"
	done

CooltrainerfKateBeatenText:
	text "Irène: Non! J'ai"
	line "perdu! Incroyable!"
	done

CooltrainerfKateOfferPowerHerbText:
	text "Irène: Tu es trop"
	line "balèze. Je n'avais"
	cont "aucune chance."

	para "Tiens, tu mérites"
	line "bien ceci."
	done

Route34SignText:
	text "route 34"

	para "Doublonville -"
	line "Écorcia"

	para "Bois aux Chênes"
	line "Sur la route"
	done

Route34TrainerTipsText:
	text "Astuce"

	para "Les arbres à Baies"
	line "donnent des Baies"
	cont "tous les jours."

	para "Notez quel arbre"
	line "donne quelle Baie."
	done

Route34AdvancedTipsSignText:
	text "Advanced Tips!"

	para "Some #mon have"
	line "inherent potential"

	para "to be stronger"
	line "than others!"

	para "But all #mon"
	line "can put in effort"
	cont "during battle, or"

	para "take vitamins,"
	line "to gain strength!"
	done

DayCareSignText:
	text "Pension"

	para "On élève votre"
	line "#mon pour vous!"
	done
