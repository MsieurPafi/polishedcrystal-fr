ManiasHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, radio2
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftruefwd .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftruefwd .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckie
	yesorno
	iffalsefwd .refusetotakeshuckie
	givepoke SHUCKLE, MALE | PLAIN_FORM, 25, BERRY_JUICE, NET_BALL, POISON_JAB, ShuckieName, ShuckieOTName, KIRK_SHUCKIE_ID
	iffalse_jumpopenedtext ManiaText_PartyAndBoxFull
	writetext ManiaText_TakeCareOfShuckie
	promptbutton
	waitsfx
	writetext ManiaText_GotShuckie
	playsound SFX_KEY_ITEM
	waitsfx
	ifequalfwd 1, .shuckieinparty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	writetext ManiaText_ShuckieSentToPC
	promptbutton
.shuckieinparty
	closetext
	setevent EVENT_GOT_SHUCKIE
	setflag ENGINE_GOT_SHUCKIE_TODAY
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalsefwd .returnshuckie
	jumpopenedtext ManiaText_TakeCareOfShuckie

.refusetotakeshuckie
	jumpthisopenedtext

	text "Oh, no… What'll"
	line "I do if he comes"
	cont "back?"
	done

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalsefwd .refused
	special ReturnShuckie
	ifequalfwd $0, .wrong
	ifequalfwd $1, .refused
	ifequalfwd $3, .superhappy
	ifequalfwd $4, .default_postevent
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	jumpthisopenedtext

	text "Hey, you don't"
	line "have my #mon"
	cont "with you."
	done

.superhappy
	writetext ManiaText_ShuckieLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	jumpthisopenedtext

	text "Oh, no, no… That's"
	line "the same as being"
	cont "robbed."
	done

.nothingleft
	jumpthisopenedtext

	text "If I take my #-"
	line "mon back, what are"

	para "you going to use"
	line "in battle?"
	done

.default_postevent
	jumpthisopenedtext

	text "For #mon, hap-"
	line "piness is being"

	para "with a person who"
	line "treats them well."
	done

ShuckieName:
	rawchar "Shuckie@"

ShuckieOTName:
	rawchar "Kirk@"

ManiaText_AskLookAfterShuckie:
	text "Je suis choqué!"

	para "Un garnement de"
	line "ton âge avec"

	para "l'oeil mauvais"
	line "et des cheveux"
	cont "longs, s'est in-"
	cont "filtré chez moi."

	para "Il m'a fait grand-"
	line "peur et chapardé"
	cont "mon #mon"
	cont "adoré!"

	para "Il m'en reste un"
	line "mais que faire"
	cont "s'il revient?"

	para "Tu as l'air"
	line "fort. Peux-tu"

	para "t'occuper de"
	line "mon #mon"
	cont "un petit moment?"
	done

ManiaText_TakeCareOfShuckie:
	text "Oh, bien le merci!"

	para "Prends-en bien"
	line "soin, pitié!"
	done

ManiaText_GotShuckie:
	text "<PLAYER> reçoit un"
	line "#mon."
	done

ManiaText_ShuckieSentToPC:
	text "The #mon was"
	line "sent to "
	text_ram wStringBuffer1
	text "."
	done

ManiaText_PartyAndBoxFull:
	text "Your #mon party"
	line "and Box are full."
	done


ManiaText_CanIHaveMyMonBack:
	text "Salut! Comment va"
	line "mon #mon?"

	para "Je pense être en"
	line "sécurité main-"
	cont "tenant, serait-il"
	cont "possible de le"
	cont "récupérer?"
	done

ManiaText_ThankYou:
	text "Merci mon petit!"
	done


ManiaText_ShuckieLikesYou:
	text "Mon #mon a"
	line "l'air de t'appré-"
	cont "cier."

	para "Très bien! Tu"
	line "peux le garder."

	para "Mais promets-moi"
	line "d'être sympa avec"
	cont "lui!"
	done
