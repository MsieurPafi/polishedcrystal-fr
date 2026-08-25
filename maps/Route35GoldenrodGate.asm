Route35GoldenrodGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_BREEDER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route35GoldenrodGateFisherText, -1

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftruefwd .gothpup
	checkevent EVENT_GAVE_KENYA
	iftruefwd .questcomplete
	checkevent EVENT_GOT_KENYA
	iftruefwd .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalsefwd .refused
	readvar VAR_PARTYCOUNT
	ifequalfwd PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGateRandyThanksText
	promptbutton
	waitsfx
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, FEMALE | PLAIN_FORM, 10, NO_ITEM, NET_BALL, NO_MOVE, GiftSpearowName, GiftSpearowOTName, 01001
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	jumpthisopenedtext

	text "You can read it,"
	line "but don't lose it!"
	cont "Route 31!"

	para "Oh, yeah. There"
	line "was a weird tree"
	cont "blocking the road."

	para "I wonder if it's"
	line "been cleared?"
	done

.partyfull
	jumpthisopenedtext

	text "You can't carry"
	line "another #mon…"
	done

.refused
	jumpthisopenedtext

	text "Oh… Never mind,"
	line "then…"
	done

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	promptbutton
	verbosegiveitem HP_UP
	iffalsefwd .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	endtext

GiftSpearowMail:
	db   FLOWER_MAIL
	setcharmap no_ngrams
	db   "Dark Cave leads"
	next "to another road@"
	setcharmap default

GiftSpearowName:
	rawchar "Kenya@"

GiftSpearowOTName:
	rawchar "Randy@"

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .aftersudowoodo
	jumpthisopenedtext

	text "A strange tree is"
	line "blocking the road."

	para "It wriggles around"
	line "if you talk to it."

	para "I heard it became"
	line "wild when someone"

	para "watered it with a"
	line "SquirtBottle."
	done

.aftersudowoodo
	jumpthisopenedtext

	text "I like the #mon"
	line "Lullaby they play"
	cont "on the radio."
	done

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Minute papillon!"
	line "Tu peux me rendre"
	cont "service?"

	para "Tu peux apporter"
	line "ce #mon et sa"
	cont "lettre à mon pote?"

	para "Il est sur la"
	line "route 31."
	done

Route35GoldenrodGateRandyThanksText:
	text "Tu veux bien?"
	line "Merci!"

	para "Mon pote est gras"
	line "et il pionce tout"
	cont "le temps."

	para "Tu vas le recon-"
	line "naître, c'est sûr!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> reçoit"
	line "un #mon avec"
	cont "une lettre."
	done




Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "Merci bien! Tu"
	line "as bien fait la"
	cont "livraison!"

	para "Voilà pour toi!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "Mon pote pionce"
	line "comme un fou, non?"
	cont "Quelle classe!"
	done



Route35GoldenrodGateFisherText:
	text "Je me demande"
	line "combien de types"

	para "de #mon il y a"
	line "dans le monde."

	para "Il y a trois ans,"
	line "le Prof.Chen"

	para "disait qu'il y"
	line "avait 150 types"
	cont "différents."
	done
