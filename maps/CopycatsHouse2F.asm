CopycatsHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CopycatsHouse2FCallback

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, CopycatScript, -1
	object_event  6,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODRIO, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsDodrioScript, -1
	object_event  6,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CLEFAIRY, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, GENGAR, -1, PAL_MON_PURPLE, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, -1
	object_event  7,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, MURKROW, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, -1
	pokemon_event  0,  4, DITTO, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PURPLE, CopycatsHouse2FDittoText, -1

	object_const_def
	const COPYCATSHOUSE2F_COPYCAT

CopycatsHouse2FCallback:
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	endcallback

CopycatScript:
	readvar VAR_PLAYERGENDER
	ifequalfwd PLAYER_FEMALE, CopycatFemaleScript
	ifequalfwd PLAYER_ENBY, CopycatEnbyScript
	ifequalfwd PLAYER_BETA, CopycatBetaScript
	; fallthrough

CopycatMaleScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting1Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll1Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special RefreshSprites
	showtext CopycatThanks1Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatFemaleScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatEnbyScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CRYS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CRYS
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatBetaScript:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftruefwd CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_BETA
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_BETA
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatRetortScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	jumpthistext

	text "Copycat: Hmm?"
	line "Quit mimicking?"

	para "But that's my"
	line "favorite hobby!"
	done

CopycatWorriedScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	jumpthistext

	text "Copycat: Pardon?"

	para "I shouldn't decide"
	line "what you should"
	cont "do?"

	para "But I'm really"
	line "worried… What if"
	cont "someone finds it?"
	done

CopycatFoundLostItemScript:
	opentext
	writetext .FoundDollText
	promptbutton
	takekeyitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjumpfwd CopycatGivePassScript

.FoundDollText:
	text "Copieuse: Hé!"
	line "C'est ma #"
	cont "poupée Melofee!"

	para "Elle est un peu"
	line "déchirée près de"

	para "la jambe! C'est la"
	line "mienne!"
	done

CopycatReturnedLostItemScript:
	opentext
CopycatGivePassScript:
	writetext .GivePassText
	promptbutton
	verbosegivekeyitem PASS
	iffalse_endtext
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	jumpthisopenedtext

	text "Copycat: That's"
	line "the pass for the"
	cont "Magnet Train."

	para "The rail company"
	line "man gave me that"

	para "when they tore"
	line "down our old house"
	cont "for the station."
	done

.GivePassText:
	text "OK. Voilà le"
	line "passe du train"
	cont "comme promis!"
	done

CopycatFinalScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	jumpthistext

	text "Copycat: You bet!"
	line "It's a scream!"
	done

CopycatGreeting1Text:
	text "<PLAYER>: Salut! Tu"
	line "aimes les #mon?"

	para "<PLAYER>: Non. Toi."
	line "Tu les aimes?"

	para "<PLAYER>: Hein?"
	line "Tu m'cherches?"
	done

CopycatLostDoll1Text:
	text "<PLAYER>: Salut!"
	line "On dit que tu as"

	para "perdu ta #"
	line "poupée préférée."

	para "<PLAYER>: Si je la"
	line "trouves, tu me"
	cont "donnes un passe?"

	para "<PLAYER>: Je vais"
	line "la chercher."

	para "Tu l'as perdue en"
	line "allant à Carmin"
	cont "sur mer?"
	done

CopycatThanks1Text:
	text "<PLAYER>: Salut!"
	line "Merci pour le"
	cont "passe!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: Tu vas"
	line "t'arrêter de répé-"
	cont "ter c'que je dis!"
	done

CopycatGreeting2Text:
	text "<PLAYER>: Salut!"
	line "Tu aimes les"
	cont "#mon, non?"

	para "<PLAYER>: Non, pas"
	line "moi. Toi."

	para "<PLAYER>: Quoi?"
	line "T'es bizarre!"
	done

CopycatLostDoll2Text:
	text "<PLAYER>: Salut!"
	line "On dit que tu as"

	para "perdu ta #"
	line "poupée préférée."

	para "<PLAYER>: Si je la"
	line "trouve, tu me"
	cont "donnes un passe?"

	para "<PLAYER>: Je vais"
	line "la chercher."

	para "Tu l'as perdue en"
	line "allant à Carmin"
	cont "sur mer?"
	done

CopycatThanks2Text:
	text "<PLAYER>: Merci"
	line "pour le passe!"

	para "<PLAYER>: ...Quoi?"

	para "<PLAYER>: T'en as"
	line "jamais marre de"

	para "répéter tout ce"
	line "que je dis?"
	done

CopycatSpinMovement:
rept 2
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
endr
	turn_head_down
	step_end

CopycatsDodrioScript:
	opentext
	writetext .Text1
	cry DODRIO
	promptbutton
	jumpthisopenedtext

	text "Mirror, mirror on"
	line "the wall, who's"

	para "the fairest one of"
	line "all?"
	done

.Text1:
	text "Dodrio: Driii!"
	done

CopycatsHouse2FDollScript:
	jumpthistext

	text "This is a rare"
	line "#mon! Huh?"

	para "It's only a doll…"
	done

CopycatsHouse2FDittoText:
	text "Ditto: Dii…"
	done
