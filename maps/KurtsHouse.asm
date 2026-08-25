KurtsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, KurtsHouseKurtCallback

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, radio2
	bg_event  8,  0, BGEVENT_JUMPTEXT, KurtsHouseOakPhotoText
	bg_event  9,  0, BGEVENT_JUMPTEXT, KurtsHouseOakPhotoText
	bg_event  5,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  2,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  3,  1, BGEVENT_READ, PokemonJournalProfWestwoodScript
	bg_event  4,  1, BGEVENT_JUMPTEXT, KurtsHouseCelebiStatueText

	def_object_events
	object_event  3,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event  5,  3, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter1, EVENT_KURTS_HOUSE_GRANDDAUGHTER_1
	object_event 14,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event 11,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter2, EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
	pokemon_event  6,  3, SLOWPOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, KurtsHouseSlowpokeText, EVENT_KURTS_HOUSE_SLOWPOKE

	object_const_def
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_TWIN1
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_TWIN2

KurtsHouseKurtCallback:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalsefwd .Done
	checkevent EVENT_FOREST_IS_RESTLESS
	iftruefwd .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	disappear KURTSHOUSE_TWIN2
	appear KURTSHOUSE_TWIN1
	endcallback

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
	disappear KURTSHOUSE_TWIN1
	appear KURTSHOUSE_TWIN2
.Done:
	endcallback

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_APRICORN_BOX
	iftruefwd .GotApricornBox
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftruefwd .ClearedSlowpokeWell
	writetext KurtsHouseKurtMakingBallsMustWaitText
	waitbutton
	closetext
	special Special_FadeOutMusic
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	readvar VAR_FACING
	ifequalfwd UP, .RunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.RunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.ClearedSlowpokeWell:
	writetext KurtsHouseKurtHonoredToMakeBallsText
	promptbutton
	verbosegivekeyitem APRICORN_BOX
	setevent EVENT_KURT_GAVE_YOU_APRICORN_BOX
.GotApricornBox:
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftruefwd .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftruefwd .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftruefwd .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftruefwd .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue .CanGiveGSBallToKurt
.NoGSBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .CheckApricorns
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftruefwd .CheckApricorns
	writetext KurtsHouseKurtBallsFromApricornsText
	waitbutton
.CheckApricorns:
	callasm .CheckHaveAnyApricorns
	iftruefwd .AskApricorn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue_jumpopenedtext KurtsHouseKurtTurnedOutGreatText
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue_jumpopenedtext KurtsHouseKurtBallsFromApricornsText
	endtext

.CheckHaveAnyApricorns:
	xor a
	ld hl, wApricorns
	or [hl]
rept NUM_APRICORNS - 1
	inc hl
	or [hl]
endr
	ldh [hScriptVar], a
	ret

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special Special_SelectApricornForKurt
	iffalse_jumpopenedtext KurtsHouseKurtThatsALetdownText
	ifequalfwd BLU_APRICORN, .Blu
	ifequalfwd YLW_APRICORN, .Ylw
	ifequalfwd GRN_APRICORN, .Grn
	ifequalfwd WHT_APRICORN, .Wht
	ifequalfwd BLK_APRICORN, .Blk
	ifequalfwd PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjumpfwd .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjumpfwd .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjumpfwd .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjumpfwd .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjumpfwd .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjumpfwd .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	writetext KurtsHouseKurtGetStartedText
	waitbutton
	closetext
	follow KURTSHOUSE_KURT1, PLAYER
	applymovement KURTSHOUSE_KURT1, KurtsHouseFollowKurt_MovementData
	stopfollow
	pause 15
	turnobject KURTSHOUSE_KURT1, DOWN
	showtext KurtsHouseKurtItWillTakeADayText
	applymovement PLAYER, KurtsHouseStepAwayFromKurt_MovementData
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	pause 35
	warpfacing UP, KURTS_HOUSE, 3, 3
	sjump Kurt1

.ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	jumpopenedtext KurtsHouseKurtTurnedOutGreatText

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LEVEL_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LURE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar MOON_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FRIEND_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FAST_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar HEAVY_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftruefwd KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LOVE_BALL, VAR_KURT_APRICORNS
	iffalse_endtext
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .ThatTurnedOutGreat

.CanGiveGSBallToKurt:
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftruefwd .GaveGSBallToKurt
	checkkeyitem GS_BALL
	iffalse .NoGSBall
	writetext KurtsHouseKurtWhatIsThatText
	waitbutton
	closetext
	setevent EVENT_GAVE_GS_BALL_TO_KURT
	takekeyitem GS_BALL
	setflag ENGINE_KURT_MAKING_BALLS
	end

.GaveGSBallToKurt:
	checkflag ENGINE_KURT_MAKING_BALLS
	iffalsefwd .NotMakingBalls
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	jumpopenedtext KurtsHouseKurtAhHaISeeText

.NotMakingBalls:
	writetext KurtsHouseKurtThisBallStartedToShakeText
	waitbutton
	closetext
	setevent EVENT_FOREST_IS_RESTLESS
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	clearevent EVENT_GAVE_GS_BALL_TO_KURT
	special Special_FadeOutMusic
	pause 20
	showemote EMOTE_SHOCK, KURTSHOUSE_KURT1, 30
	readvar VAR_FACING
	ifequalfwd UP, .GSBallRunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	sjumpfwd .KurtHasLeftTheBuilding

.GSBallRunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
.KurtHasLeftTheBuilding:
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	clearevent EVENT_AZALEA_TOWN_KURT
	waitsfx
	special RestartMapMusic
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_CELEBI_EVENT
	end

Kurt2:
	faceplayer
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftruefwd KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalsefwd Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

Script_FirstTimeBuggingKurt:
	writetext KurtsHouseKurtGranddaughterHelpingWorkFasterText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end

KurtScript_ImCheckingItNow:
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	turnobject LAST_TALKED, UP
	jumpopenedtext KurtsHouseKurtAhHaISeeText

KurtsGranddaughter1:
	faceplayer
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd KurtsGranddaughter2Subscript
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue_jumptext KurtsGranddaughterFunText
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue_jumptext KurtsGranddaughterLonelyText
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptext KurtsGranddaughterDadText
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptext KurtsGranddaughterSlowpokeBackText
	checkevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	iftrue_jumptext KurtsGranddaughterLonelyText
	jumpthistext

	text "The Slowpoke are"
	line "gone… Were they"

	para "taken away by bad"
	line "people?"
	done

KurtsGranddaughter2:
	faceplayer
KurtsGranddaughter2Subscript:
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftruefwd .GSBall
	writetext KurtsGranddaughterHelpText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

.GSBall:
	writetext KurtsGranddaughterGSBallText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

PokemonJournalProfWestwoodScript:
	setflag ENGINE_READ_PROF_WESTWOOD_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Prof.Westwood!"

	para "Prof.Westwood V"
	line "teaches at Celadon"
	cont "University."

	para "His ancestor's re-"
	line "search in 1925 led"

	para "to the development"
	line "of modern #"
	cont "Balls."
	done

KurtsHouseKurtGoAroundPlayerThenExitHouseMovement:
	big_step_right
KurtsHouseKurtExitHouseMovement:
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

KurtsHouseFollowKurt_MovementData:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end

KurtsHouseStepAwayFromKurt_MovementData:
	step_down
	step_left
	step_left
	step_end

KurtsHouseKurtMakingBallsMustWaitText:
	text "Hum? Qui es-tu?"

	para "<PLAYER>? Tu"
	line "voudrais que je"
	cont "fabrique quelques"
	cont "Balls?"

	para "Désolé mais ça"
	line "devra attendre."

	para "Connais-tu la Team"
	line "Rocket? Je vais"

	para "t'en toucher deux"
	line "mots."

	para "La Team Rocket est"
	line "plus redoutée que"

	para "la peste! Ils"
	line "utilisent les"
	cont "#mon à des"
	cont "fins crapuleuses."

	para "Ils ont cessé d'o-"
	line "pérer il y a de ça"
	cont "trois ans."

	para "Mais ils sont de"
	line "retour et frappent"

	para "de plus belle en"
	line "coupant les"
	cont "Queueramolos pour"
	cont "les revendre!"

	para "Je m'en vais donc"
	line "leur montrer de"
	cont "quel bois je me"
	cont "chauffe, moi!"

	para "Tenez bon les"
	line "petits Ramoloss!"
	cont "Le bon vieux"
	cont "Fargas arrive à"
	cont "la rescousse!"
	done

KurtsHouseKurtHonoredToMakeBallsText:
	text "Kurt: Hi, <PLAYER>!"

	para "You handled your-"
	line "self like a real"
	cont "hero at the well."

	para "I like your style!"

	para "I would be honored"
	line "to make Balls for"

	para "a trainer like"
	line "you."

	para "But first, you'll"
	line "need Apricorns."

	para "Here, take this"
	line "Apricorn Box!"
	done

KurtsHouseKurtBallsFromApricornsText:
	text "Fargas: Je fais"
	line "des Balls à partir"
	cont "des Noigrumes."

	para "Décroches-en"
	line "des arbres et"
	cont "rapporte-les moi."

	para "Je fabriquerai"
	line "alors des Balls."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	text "Fargas: As-tu un"
	line "Noigrume pour moi?"

	para "Excellent! Je vais"
	line "en faire une Ball."
	done

KurtsHouseKurtGetStartedText:
	text "Kurt: I'll get"
	line "started right now!"
	done

KurtsHouseKurtItWillTakeADayText:
	text "Kurt: It'll take a"
	line "while to make you"

	para "a Ball. Come back"
	line "for it later."
	done

KurtsHouseKurtThatsALetdownText:
	text "Fargas: Oh,oh...!"
	line "Quel dommage."
	done

KurtsHouseKurtDontBotherMeText:
	text "Fargas: Je bosse!"
	line "Qu'on me laisse"
	cont "tranquille!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "Fargas: Ah,"
	line "<PLAYER>! Je viens"
	cont "de finir ta Ball!"
	cont "Tiens!"
	done

KurtsHouseKurtTurnedOutGreatText:
	text "Fargas: Je suis"
	line "content du résul-"
	cont "tat."

	para "Va attraper"
	line "des #mon!"
	done

KurtsHouseKurtGranddaughterHelpingWorkFasterText:
	text "Fargas: Avec"
	line "l'aide de ma"

	para "petite-fille, je"
	line "travaille plus"
	cont "vite."
	done

KurtsHouseKurtWhatIsThatText:
	text "C'est quoi donc?"

	para "Je n'avais jamais"
	line "vu ça."

	para "On dirait bien une"
	line "# Ball, mais"

	para "ça doit être autre"
	line "chose."

	para "Je vais regarder"
	line "ça."
	done

KurtsHouseKurtImCheckingItNowText:
	text "Je fais mes"
	line "recherches."
	done

KurtsHouseKurtAhHaISeeText:
	text "Ah-ha! Je vois!"
	line "Donc..."
	done

KurtsHouseKurtThisBallStartedToShakeText:
	text "<PLAYER>!"

	para "La Ball s'est mise"
	line "à bouger quand je"
	cont "la regardais."

	para "Y'a du mystère"
	line "dans l'air!"
	done


KurtsGranddaughterLonelyText:
	text "Pépé a filé..."
	line "Je suis si seule!"
	done

KurtsGranddaughterSlowpokeBackText:
	text "Le Ramoloss que"
	line "mon pôpa m'a"

	para "donné est de"
	line "retour! Et sa"
	cont "queue a repoussé!"
	done

KurtsGranddaughterDadText:
	text "Pôpa travaille à"
	line "la Sylphe SARL où"
	cont "il étudie les"
	cont "# Balls."

	para "Je dois rester à"
	line "la maison avec mon"
	cont "pépé et mon"
	cont "Ramoloss."
	done

KurtsGranddaughterHelpText:
	text "J'aide mon joli"
	line "petit pépé!"

	para "On va en faire des"
	line "belles Balls pour"
	cont "ta fraise!"
	done

KurtsGranddaughterFunText:
	text "C'est rigolo de"
	line "faire des Balls!"
	done

KurtsGranddaughterGSBallText:
	text "Pépé examine une"
	line "Ball."

	para "Alors moi..."
	line "J'attends."
	done

KurtsHouseSlowpokeText:
	text "Ramoloss: ...."
	line "...(baille)..."
	done

KurtsHouseOakPhotoText:
	text "...Un jeune Prof."
	line "Chen?"
	done

KurtsHouseCelebiStatueText:
	text "C'est une statue"
	line "du protecteur de"
	cont "la forêt."
	done
