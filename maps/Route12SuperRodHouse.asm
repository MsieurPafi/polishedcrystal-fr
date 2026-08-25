Route12SuperRodHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_12_SOUTH, 1
	warp_event  3,  7, ROUTE_12_SOUTH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1

Route12SuperRodHouseFishingGuruScript:
	checkevent EVENT_GOT_SUPER_ROD
	iftrue_jumptextfaceplayer .GaveSuperRodText
	faceplayer
	opentext
	writetext OfferSuperRodText
	yesorno
	iffalsefwd .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegivekeyitem SUPER_ROD
	iffalsefwd .NoRoom
	setevent EVENT_GOT_SUPER_ROD
	jumpthisopenedtext

.GaveSuperRodText:
	text "Essaie de pêcher"
	line "un peu partout où"
	cont "il y a de l'eau."

	para "Souviens-toi: tu"
	line "peux attraper plu-"

	para "sieurs #mon"
	line "grâce à différen-"
	cont "tes Cannes."
	done

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	endtext

OfferSuperRodText:
	text "Je suis le petit"
	line "frère du maître"
	cont "pêcheur."

	para "Tu aimes la pêche,"
	line "toi! Ça se voit."

	para "J'ai raison, hein?"
	line "Bien sûr que oui!"
	done

GiveSuperRodText:
	text "Crénom de là!"
	line "C'est ben vrai!"

	para "Tiens boudiou!"
	line "Prends ça: c'est"
	cont "la méga canne."
	done

DontWantSuperRodText:
	text "Hein? On m'aurait"
	line "trompé?"
	done
