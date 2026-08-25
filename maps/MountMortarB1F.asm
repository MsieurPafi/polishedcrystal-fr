MountMortarB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, MOUNT_MORTAR_1F_INSIDE, 5
	warp_event 19, 29, MOUNT_MORTAR_1F_OUTSIDE, 7

	def_coord_events

	def_bg_events
	bg_event  4,  6, BGEVENT_ITEM + MAX_REVIVE, EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE

	def_object_events
	object_event 11, 31, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FHikerScript, -1
	object_event 16,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FKiyoScript, -1
	strengthboulder_event  9, 10
	itemball_event 29, 12, HYPER_POTION, 1, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	itemball_event  4, 16, CARBOS, 1, EVENT_MOUNT_MORTAR_B1F_CARBOS
	itemball_event 34, 24, PROTECTOR, 1, EVENT_MOUNT_MORTAR_B1F_PROTECTOR
	itemball_event 32,  3, MAX_ETHER, 1, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	itemball_event 21, 26, PP_UP, 1, EVENT_MOUNT_MORTAR_B1F_PP_UP

MountMortarB1FHikerScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DEFENSE_CURL_INTRO
	iftruefwd MountMortarB1FTutorDefenseCurlScript
	writetext MountMortarB1FHikerText
	waitbutton
	setevent EVENT_LISTENED_TO_DEFENSE_CURL_INTRO
MountMortarB1FTutorDefenseCurlScript:
	writetext Text_MountMortarB1FTutorDefenseCurl
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_MountMortarB1FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DEFENSE_CURL
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "I'll be right here"
	line "waiting."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Shucks, you don't"
	line "have a Silver"
	cont "Leaf."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "There! Now your"
	line "#mon can use"
	cont "Defense Curl!"
	done

MountMortarB1FKiyoScript:
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue_jumptextfaceplayer MountMortarB1FKiyoGotTyrogueText
	faceplayer
	checkevent EVENT_BEAT_KIYO
	iftruefwd .BeatKiyo
	showtext MountMortarB1FKiyoIntroText
	winlosstext MountMortarB1FKiyoWinText, 0
	loadtrainer KARATE_KING, KIYO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIYO
.BeatKiyo:
	opentext
	writetext MountMortarB1FTyrogueRewardText
	promptbutton
	waitsfx
	givepoke TYROGUE, PLAIN_FORM, 10, NO_ITEM, PREMIER_BALL
	iffalse_jumpopenedtext MountMortarB1FKiyoFullPartyAndBoxText
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
	jumpthisopenedtext

MountMortarB1FKiyoGotTyrogueText:
	text "Debugant est du"
	line "type combat."

	para "Il évolue en un"
	line "puissant #mon."

	para "Alors fais comme"
	line "moi..."
	cont "Entraîne-toi!"

	para "Adieu!"
	done

MountMortarB1FHikerText:
	text "My #mon used"
if DEF(FAITHFUL)
	line "Rock Smash on a"
else
	line "Brick Break on a"
endc

	para "boulder, but it"
	line "was undamaged."

	para "It turned out to"
	line "be a Geodude that"
	cont "used Defense Curl!"
	done

Text_MountMortarB1FTutorDefenseCurl:
	text "I can teach your"
	line "#mon to use"

	para "Defense Curl for"
	line "one Silver Leaf."
	done


Text_MountMortarB1FTutorQuestion:
	text "Should I teach"
	line "your #mon"
	cont "Defense Curl?"
	done



MountMortarB1FKiyoIntroText:
	text "Hé!"

	para "Je suis le roi du"
	line "karaté!"

	para "Je m'entraîne seul"
	line "dans le noir!"

	para "Toi! Moi!"
	line "Combat!"

	para "Yaaaaaah!"
	done

MountMortarB1FKiyoWinText:
	text "Waaaarggh!"
	line "Perdu!"
	done

MountMortarB1FTyrogueRewardText:
	text "J'suis...mauvais."

	para "Mon entraînement"
	line "n'est pas encore"
	cont "suffisant."

	para "Mais j'admets ma"
	line "défaite."

	para "En gage de récom-"
	line "pense, je vais te"

	para "donner un #mon"
	line "de combat rare."
	done

MountMortarB1FKiyoFullPartyAndBoxText:
	text "You have no room"
	line "in your party"
	line "or Box!"
	done
