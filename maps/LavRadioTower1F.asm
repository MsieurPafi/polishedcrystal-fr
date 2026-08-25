LavRadioTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, LavRadioTower1FUpstairsScript

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7
	warp_event 15,  0, LAV_RADIO_TOWER_2F, 255

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_JUMPTEXT, LavRadioTower1FDirectoryText
	bg_event  5,  0, BGEVENT_JUMPTEXT, LavRadioTower1FPokeFluteSignText

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FReceptionistText, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FOfficerText, -1
	object_event  1,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FSuperNerd1Text, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1

LavRadioTower1FUpstairsScript:
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iftruefwd .Exorcised
	warpmod 1, HAUNTED_RADIO_TOWER_2F
	endcallback

.Exorcised:
	warpmod 1, LAV_RADIO_TOWER_2F
	endcallback

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue_jumpopenedtext .GotExpnCardText
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumpopenedtext .OffTheAirText
	writetext .ReturnedMachinePartText
	promptbutton
	givespecialitem EXPN_CARD
	setflag ENGINE_EXPN_CARD
	jumpthisopenedtext

.GotExpnCardText:
	text "Avec ceci, tu peux"
	line "écouter la radio"
	cont "depuis Kanto."

	para "Gahahahaha!"
	done

.OffTheAirText:
	text "Oh, non, non, non!"

	para "Nous ne sommes"
	line "plus à l'antenne"

	para "depuis la fermetu-"
	line "re de la centrale."

	para "Je cours à la ca-"
	line "tastrophe si je ne"
	cont "peux plus émettre!"

	para "J'suis ruiné!"
	done

.ReturnedMachinePartText:
	text "Ah! C'est toi"
	line "<PLAYER> qui a"

	para "réparé la"
	line "centrale?"

	para "Grâce à toi, j'ai"
	line "pu garder mon job."
	cont "Tu es trop cool!"

	para "Prends ça!"
	done

LavRadioTower1FSuperNerd2Script:
	checkflag ENGINE_EXPN_CARD
	iftrue_jumptextfaceplayer LavRadioTower1FSuperNerd2Text_GotExpnCard
	jumpthistextfaceplayer

	text "Hey there!"

	para "I am the super"
	line "Music Director!"

	para "Huh? Your #gear"
	line "can't tune into my"

	para "music programs."
	line "How unfortunate!"

	para "If you get a Expn."
	line "Card upgrade, you"

	para "can tune in. You'd"
	line "better get one!"
	done

LavRadioTower1FReceptionistText:
	text "Bienvenue!"
	line "Tu peux visiter"

	para "cet étage tant que"
	line "tu le veux."
	done

LavRadioTower1FOfficerText:
	text "Seul le rez-de-"
	line "chaussée est à"
	cont "visiter."

	para "Depuis l'attaque"
	line "de la Tour Radio"

	para "de Johto par un"
	line "gang criminel, on"

	para "a renforcé les me-"
	line "sures de sécurité."
	done

LavRadioTower1FSuperNerd1Text:
	text "Les gens travail-"
	line "lent dur ici, à"
	cont "la Tour Radio."

	para "Ils se donnent à"
	line "fond pour faire"
	cont "de bonnes émis-"
	cont "sions."
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Hé toi!"

	para "Je suis le"
	line "Directeur Musical!"

	para "Je suis à l'origi-"
	line "ne des belles mé-"

	para "lodies diffusées"
	line "à l'antenne."

	para "Alors écoute bien"
	line "nos belles"
	cont "émissions!"
	done

LavRadioTower1FDirectoryText:
	text "Rdc  réception"
	line "1Er  ventes"

	para "2Eme personnel"
	line "3Eme Production"

	para "4Eme bureau"
	line "     direction"
	done

LavRadioTower1FPokeFluteSignText:
	text "Animez vos #mon"
	line "avec des sons de"

	para "# flûte sur"
	line "l'Antenne 20"
	done

; TODO: use this text
LavRadioTower1FReferenceLibraryText:
	text "Whoa! Plein de"
	line "cassettes et de"
	cont "Cd #mon!"

	para "Ça doit être une"
	line "librairie offi-"
	cont "cielle."
	done
