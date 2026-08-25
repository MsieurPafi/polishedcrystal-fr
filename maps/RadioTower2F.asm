DEF BLUE_CARD_POINT_CAP EQU 30

RadioTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower2FSalesSignText
	bg_event  5,  0, BGEVENT_JUMPTEXT, RadioTower2FOaksPKMNTalkSignText
	bg_event 13,  0, BGEVENT_JUMPTEXT, RadioTower2FPokemonRadioSignText

	def_object_events
	object_event 14,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event  6,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FSuperNerdText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FBlackBelt1Text, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FBlackBelt2Text, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	pokemon_event 12,  1, JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, RadioTowerJigglypuffText, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  3,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FRockerText, EVENT_GOLDENROD_CITY_CIVILIANS

	object_const_def
	const RADIOTOWER2F_BUENA

RadioTower2FTeacherScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower2FTeacherText_Rockets
	jumpthistextfaceplayer

	text "Lullabies on the"
	line "radio may make"
	cont "#mon sleep."
	done

GenericTrainerGruntM4:
	generictrainer GRUNTM, 4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText

	text "We won't let you"
	line "ruin our plans"
	cont "for our comeback!"
	done

GenericTrainerGruntM5:
	generictrainer GRUNTM, 5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText

	text "We're not always"
	line "evil. We just do"
	cont "whatever we like."
	done

GenericTrainerGruntM6:
	generictrainer GRUNTM, 6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText

	text "Our Executives are"
	line "trying to take"
	cont "this place over."

	para "They have some big"
	line "plan. I wonder"
	cont "what that is?"
	done

GenericTrainerGruntF2:
	generictrainer GRUNTF, 2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText

	text "You beat me, and"
	line "I won't forget it!"
	done

Buena:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower2FBuenaPasswordIsHelpText
	faceplayer
	opentext
	checkevent EVENT_MET_BUENA
	iffalsefwd .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftruefwd .PlayedAlready
	readvar VAR_HOUR
	ifless EVE_HOUR, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalsefwd .TuneIn
	checkkeyitem BLUE_CARD
	iffalsefwd .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequalfwd BLUE_CARD_POINT_CAP, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalsefwd .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	showtext RadioTower2FBuenaEveryoneSayPasswordText
	turnobject RADIOTOWER2F_BUENA, DOWN
	reanchormap
	special SpecialBuenasPassword
	closetext
	iffalsefwd .WrongAnswer
	showtext RadioTower2FBuenaCorrectAnswerText
	readvar VAR_BLUECARDBALANCE
	addval $1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	showtext RadioTower2FBuenaThanksForComingText
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequalfwd BLUE_CARD_POINT_CAP, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegivekeyitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	showtext RadioTower2FBuenaDidYouForgetText
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	showtext RadioTower2FBuenaThanksForComingText
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftruefwd .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjumpfwd .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	checkkeyitem BLUE_CARD
	iffalse_jumptextfaceplayer RadioTower2FBuenaReceptionistNoCardText
	pokemart MARTTYPE_BLUECARD, 0

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step_down
	slow_step_right
	step_end

RadioTower2FSuperNerdText:
	text "Ecoutez la radio"
	line "n'importe où!"
	cont "A bientôt!"
	done

RadioTower2FRockerText:
	text "I have a radio"
	line "interview to pro-"

	para "mote my latest"
	line "song."

	para "I've performed in"
	line "front of big"
	cont "crowds before,"

	para "but boy am I"
	line "nervous."
	done

RadioTower2FTeacherText_Rockets:
	text "Pourquoi veulent-"
	line "ils contrôler la"
	cont "Tour Radio?"
	done

RadioTowerJigglypuffText:
	text "Rondoudou:"
	line "Douuu..."
	done

RadioTower2FBlackBelt1Text:
	text "Cet accès est ré-"
	line "servé au personnel"
	cont "autorisé."

	para "Cette mesure vient"
	line "d'être appliquée."

	para "Le Directeur ne"
	line "va pas bien..."
	done

RadioTower2FBlackBelt2Text:
	text "Vous pouvez vous"
	line "balader."

	para "Le Directeur est"
	line "agréable. Comme"
	cont "avant, quoi."
	done

GruntM4SeenText:
	text "Il y a trois ans,"
	line "la Team Rocket a"
	cont "été obligée de se"
	cont "dissoudre."

	para "Mais nous revenons"
	line "en force!"
	done

GruntM4BeatenText:
	text "Gueuh! T'es pas"
	line "cool, toi!"
	done

GruntM5SeenText:
	text "On est la Team"
	line "Rocket, on est les"
	cont "exploiteurs de"
	cont "#mon!"

	para "On est des pas"
	line "beaux méchants qui"
	cont "font peur! Grrr."
	cont "T'as peur, là?"
	done

GruntM5BeatenText:
	text "Tu te crois"
	line "balèze?"
	done

GruntM6SeenText:
	text "Hé! Dégage!"
	done

GruntM6BeatenText:
	text "Pfff. J'abandonne."
	done

GruntF2SeenText:
	text "Hahaha!"

	para "Très ennuyeux."
	line "C'était trop fa-"

	para "cile d'envahir cet"
	line "endroit!"

	para "Allez les petits!"
	line "Faites-moi encore"
	cont "rire!"
	done

GruntF2BeatenText:
	text "Qu-qui t'es toi?"
	done

RadioTower2FBuenaShowIntroductionText:
	text "Buena: Salut!"
	line "Je suis Buena!"

	para "Connais-tu l'émis-"
	line "sion le mot de"
	cont "passe?"

	para "Si tu peux me"
	line "donner le mot de"

	para "passe de l'émis-"
	line "sion, tu remportes"
	cont "des points."

	para "Gagné plein de"
	line "points et échange-"

	para "les à la jolie"
	line "fille à côté con-"

	para "tre de fabuleux"
	line "prix!"

	para "Voilà!"

	para "Ta carte à points"
	line "personnelle!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "Buena: Ecoutez"
	line "tous l'émission"
	cont "du mot de passe!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "Buena: Bonjour!"
	line "As-tu écouté mon"
	cont "émission?"

	para "Te souviens-tu du"
	line "mot de passe d'au-"
	cont "jourd'hui?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "Buena: Oh!"
	line "Merci!"

	para "Quel est ton nom,"
	line "déjà?"

	para "...<PLAYER>, OK!"

	para "Viens, <PLAYER>."
	line "Tu es en direct."
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "Buena: Tout le"
	line "monde est prêt?"

	para "Il faut crier le"
	line "mot de passe d'au-"

	para "jourd'hui pour"
	line "<PLAYER>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "Buena: Reviens"
	line "après avoir écouté"

	para "mon émission, OK?"
	line "A plus tard!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "Buena: Désolée..."

	para "Tu n'as qu'un"
	line "essai par jour."

	para "Reviens donc"
	line "demain!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "Buena: Ouaiiis!"
	line "C'est exact!"

	para "Tu as donc écouté"
	line "mon émission!"

	para "Tu as gagné un"
	line "point! Bravo!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "Buena: ..."
	line "Pas du tout."

	para "Tu as oublié le"
	line "mot de passe?"
	done

RadioTower2FBuenaThanksForComingText:
	text "Buena: Notre"
	line "candidat était"

	para "<PLAYER>."
	line "Merci!"

	para "Suivez tous ma"
	line "super émission!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "Buena: De quoi?"
	line "Le mot de passe?"

	para "au secours!"
	done

RadioTower2FBuenaCardIsFullText:
	text "Buena: Ta carte"
	line "est pleine."

	para "Va donc empocher"
	line "un prix!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "Buena: Tune in to"
	line "Password every"

	assert EVE_HOUR == 12 + 5
	para "night from five"
	line "to midnight!"

	para "Tune in, then drop"
	line "in for a visit!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "Buena: Oh? Tu n'as"
	line "pas amené ta"
	cont "carte bleue?"

	para "Je ne peux pas te"
	line "donner de points"
	cont "dans ce cas."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "Buena: Oh! Ta"
	line "carte bleue a un"

	para "total de {d:BLUE_CARD_POINT_CAP} pts"
	line "aujourd'hui!"

	para "Hmmm... Il n'y a"
	line "pas de prix spé-"
	cont "cial mais..."

	para "Tu viens si sou-"
	line "vent, <PLAYER>."

	para "Je dois faire"
	line "quelque chose!"

	para "Tu veux mon numéro"
	line "de téléphone?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "Buena: <PLAYER>,"
	line "veux-tu mon numéro"
	cont "de téléphone?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> enregistre"
	line "le No. de Buena."
	done

RadioTower2FBuenaCallMeText:
	text "Buena: Appelle-moi"
	line "vite!"
	done

RadioTower2FBuenaSadRejectedText:
	text "Buena:..."
	line "C'est spécial..."
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "Buena: <PLAYER>,"
	line "il n'y a plus de"

	para "place sur ton"
	line "téléphone..."
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "Tu ne peux pas"
	line "échanger tes"
	cont "points sans ta"
	cont "carte bleue."

	para "N'oublie pas ta"
	line "carte bleue!"
	done

RadioTower2FSalesSignText:
	text "1Er ventes"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "Chronique #mon"
	line "du Prof.Chen"

	para "l'émission star"
	line "à l'antenne!"
	done

RadioTower2FPokemonRadioSignText:
	text "Pour chacune"
	line "Pour chacun"
	cont "Le soir"
	cont "Comme le matin"
	cont "radio #mon"
	cont "C'est bien..."
	done
