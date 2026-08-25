PokemonFanClub_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, VERMILION_CITY, 3
	warp_event  5,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, PokemonFanClubListenSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, PokemonFanClubBraggingSignText
	bg_event  0,  1, BGEVENT_READ, PokemonJournalGreenScript

	def_object_events
	object_event  2,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CLEFAIRY, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, NO_FORM, ClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  4,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  6,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubReceptionistText, -1
	object_event  2,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubTeacherText, -1
	pokemon_event  7,  3, ODDISH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GREEN, FanClubOddishText, -1

	object_const_def
	const POKEMONFANCLUB_CLEFAIRY_DOLL

PokemonFanClubChairmanScript:
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue_jumptextfaceplayer PokemonFanClubChairmanMoreTalesToTellText
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftruefwd .HeardSpeech
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse_jumpopenedtext PokemonFanClubChairmanHowDisappointingText
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeech:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	jumpthisopenedtext

	text "It's a Rare Candy"
	line "that makes #mon"
	cont "stronger."

	para "I prefer making my"
	line "#mon stronger"

	para "by battling, so"
	line "you can have it."
	done

PokemonFanClubClefairyGuyScript:
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue_jumptextfaceplayer PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	faceplayer
	opentext
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftruefwd .FoundClefairyDoll
	waitendtext
.FoundClefairyDoll:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	disappear POKEMONFANCLUB_CLEFAIRY_DOLL
	verbosegivekeyitem LOST_ITEM
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	endtext

PokemonJournalGreenScript:
	setflag ENGINE_READ_GREEN_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "<PK><MN> Trainer Leaf!"

	para "In addition to"
	line "being a powerful"
	cont "trainer, Leaf is"

	para "said to be fascin-"
	line "ated by legendary"
	cont "#mon."
	done

ClefairyDollScript:
	jumpthistext

	text "It's a Clefairy!"
	line "Huh?"

	para "Oh, right. It's a"
	line "Clefairy #"
	cont "Doll."
	done

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Je suis le Prési-"
	line "dent du fan Club"
	cont "#mon."

	para "J'ai élevé plus de"
	line "150 #mon."

	para "Je suis très dif-"
	line "ficile quand il"
	cont "s'agit de"
	cont "#mon."

	para "Tu es ici pour"
	line "en apprendre plus"
	cont "sur mes #mon?"
	done

PokemonFanClubChairmanRapidashText:
	text "Bien!"
	line "Alors, écoute!"

	para "Mon préféré..."
	line "Galopa..."

	para "Il est mignon..."
	line "beau...rapide..."
	cont "élégant...en feu."
	cont "Il fait pataclop,"
	cont "pataclop...quand"
	cont "il court...c'est"
	cont "super non?"
	cont "Je l'aime...!"

	para "Je lui fais...des"
	line "câlins...des..."
	cont "poutoux...des..."
	cont "gnangnans...des"
	cont "zigouzigoux..."
	cont "...Oups! Regarde"
	cont "l'heure! Je crois"
	cont "qu'il est temps"
	cont "d'y aller!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "Merci de m'avoir"
	line "écouté..."
	cont "Voilà pour toi!"
	done


PokemonFanClubChairmanMoreTalesToTellText:
	text "Salut, <PLAYER>!"

	para "Tu es ici pour en"
	line "apprendre encore"
	cont "sur mes #mon?"

	para "Non? Oh..."
	line "J'avais de belles"
	cont "histoires..."
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Dommage..."

	para "Reviens me voir"
	line "vite."
	done

PokemonFanClubReceptionistText:
	text "Notre Président"
	line "parle un peu trop"
	cont "de ses #mon..."
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "J'aime quand"
	line "Melofee gigote son"

	para "doigt quand il"
	line "utilise son"

	para "Metronome."
	line "C'est adorable!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "J'aime Melofee,"
	line "mais je ne pourrai"

	para "jamais en attraper"
	line "un... Alors je"

	para "m'amuse avec cette"
	line "# poupée."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Oh, je vois. La"
	line "fille qui a perdu"

	para "sa # poupée"
	line "est triste..."

	para "OK. Peux-tu porter"
	line "cette # poupée"

	para "à la pauvre petite"
	line "fille triste?"

	para "Je trouverai un"
	line "vrai Melofee..."
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "J'attraperai un"
	line "Melofee et il sera"

	para "mon ami pour la"
	line "vie."
	done

PokemonFanClubTeacherText:
	text "Look at my darling"
	line "Oddish!"

	para "The leaves on its"
	line "head are so cute!"
	done

FanClubOddishText:
	text "Oddish: Diish!"
	done

PokemonFanClubListenSignText:
	text "Ecoutons tous"
	line "les autres"
	cont "dresseurs."
	done

PokemonFanClubBraggingSignText:
	text "Si quelqu'un se"
	line "vante, vante-toi"
	cont "à ton tour!"
	done
