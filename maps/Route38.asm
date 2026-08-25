Route38_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35, 10, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35, 11, ROUTE_38_ECRUTEAK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 33,  8, BGEVENT_JUMPTEXT, Route38SignText
	bg_event  5, 13, BGEVENT_JUMPTEXT, Route38TrainerTipsText
	bg_event 17,  5, BGEVENT_JUMPTEXT, Route38AdvancedTipsText

	def_object_events
	object_event  4,  1, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyChad1, -1
	object_event 15,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 12, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperToby, -1
	object_event 26,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyValencia, -1
	object_event 24,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	fruittree_event 12, 10, FRUITTREE_ROUTE_38, SITRUS_BERRY, PAL_NPC_BROWN
	object_event  5,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyOlivia, -1

GenericTrainerBird_keeperToby:
	generictrainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, Bird_keeperTobySeenText, Bird_keeperTobyBeatenText

	text "I plan to train in"
	line "the Yellow Forest"

	para "to teach my #-"
	line "mon how to Fly."
	done

TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script, TRAINERPAL_DARK_SAILOR

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "All kinds of peo-"
	line "ple around the"

	para "world live happily"
	line "with #mon."
	done

TrainerLassDana1:
	trainer LASS, DANA1, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .script

.script
	loadvar VAR_CALLERID, PHONE_LASS_DANA
	opentext
	checkflag ENGINE_DANA_READY_FOR_REMATCH
	iftruefwd .DanaRematch
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftruefwd .TryGiveThunderstone
	checkcellnum PHONE_LASS_DANA
	iftruefwd .NumberAccepted
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftruefwd .SecondTimeAsking
	writetext LassDanaMoomooMilkText
	promptbutton
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1f
	sjumpfwd .AskForPhoneNumber

.SecondTimeAsking:
	callstd asknumber2f
.AskForPhoneNumber:
	askforphonenumber PHONE_LASS_DANA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .DeclinedPhoneNumber
	gettrainername LASS, DANA1, STRING_BUFFER_3
	callstd registerednumberf
	jumpstd numberacceptedf

.DanaRematch:
	callstd rematchf
	winlosstext LassDana1BeatenText, 0
	readmem wDanaFightCount
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
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer LASS, DANA1
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 1
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer LASS, DANA2
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 2
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer LASS, DANA3
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 3
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer LASS, DANA4
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 4
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer LASS, DANA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.TryGiveThunderstone:
	callstd giftf
	verbosegiveitem THUNDERSTONE
	iffalsefwd .NoRoomForThunderstone
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	jumpstd numberacceptedf

.NoRoomForThunderstone:
	jumpstd packfullf

.NumberAccepted:
	jumpstd numberacceptedf

.DeclinedPhoneNumber:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .script

.script
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	opentext
	checkflag ENGINE_CHAD_READY_FOR_REMATCH
	iftruefwd .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftruefwd .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftruefwd .SecondTimeAsking
	writetext SchoolboyChadSoManyTestsText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .AskToRegisterNumber

.SecondTimeAsking:
	callstd asknumber2m
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .SaidNo
	gettrainername SCHOOLBOY, CHAD1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.ChadRematch:
	callstd rematchm
	winlosstext SchoolboyChad1BeatenText, 0
	readmem wChadFightCount
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
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 1
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 2
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 3
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 4
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.HaveChadsNumber:
	jumpstd numberacceptedm

.SaidNo:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

GenericTrainerBeautyValencia:
	generictrainer BEAUTY, VALENCIA, EVENT_BEAT_BEAUTY_VALENCIA, BeautyValenciaSeenText, BeautyValenciaBeatenText

	text "When I see #-"
	line "mon, it seems to"
	cont "soothe my nerves."
	done

GenericTrainerBeautyOlivia:
	generictrainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText

	text "Moomoo Milk is"
	line "good for beauty"
	cont "and health."

	para "I like to buy a"
	line "dozen bottles at"
	cont "a time!"
	done

Bird_keeperTobySeenText:
	text "Volez, mes jolis"
	line "petits #mon!"
	done

Bird_keeperTobyBeatenText:
	text "Chplof!"
	done

SchoolboyChad1SeenText:
	text "J'vais te montrer"
	line "ce que j'ai appris"
	cont "aujourd'hui."
	done

SchoolboyChad1BeatenText:
	text "Faut que j'étudie"
	line "encore un peu."
	done

SchoolboyChadSoManyTestsText:
	text "Les études ça me"
	line "prend la tête."

	para "Je préfère les"
	line "#mon."

	para "Alors moi, jouer,"
	line "c'est mon truc."
	done

LassDana1SeenText:
	text "Tu as l'air de t'y"
	line "connaître en"
	cont "#mon."

	para "Tu veux bien me"
	line "donner des"
	cont "conseils?"
	done

LassDana1BeatenText:
	text "Je vois. C'est pas"
	line "mal."
	done

LassDanaMoomooMilkText:
	text "Je vais te dire"
	line "un truc..."

	para "Le lait du Ranch"
	line "Meumeu est super"
	cont "bon."
	done

BeautyValenciaSeenText:
	text "Hé! T'es mimi"
	line "comme dresseur!"

	para "Je peux voir tes"
	line "#mon?"
	done

BeautyValenciaBeatenText:
	text "Merci."
	line "Sympa!"
	done

SailorHarrySeenText:
	text "Moi j'ai voyagé!"
	line "Je connais tous"
	cont "les #mon!"
	done

SailorHarryBeatenText:
	text "T'es cool!"
	done

BeautyOliviaSeenText:
	text "Tu ne trouves pas"
	line "que mes #mon et"
	cont "moi-même avons une"
	cont "classe folle?"
	done

BeautyOliviaBeatenText:
	text "On boit du lait"
	line "Meumeu tous les"
	cont "jours."
	done

Route38SignText:
	text "route 38"

	para "Oliville -"
	line "Rosalia"
	done

Route38TrainerTipsText:
	text "Astuce"

	para "Vous pouvez arrê-"
	line "ter l'évolution d'"
	cont "un #mon."

	para "Appuyez sur B pen-"
	line "dant l'évolution."

	para "Cela surprendra le"
	line "#mon et le"
	cont "fera s'arrêter."
	done

Route38AdvancedTipsText:
	text "Advanced Tips!"

	para "Press Start in the"
	line "PC Storage System"

	para "to quickly focus"
	line "on the Box name!"

	para "You can change the"
	line "name and theme of"
	cont "each Box!"

	para "Press Select to"
	line "change what the"

	para "A button does"
	line "for #mon!"
	done
