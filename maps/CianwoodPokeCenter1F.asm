CianwoodPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CIANWOOD_CITY, 3
	warp_event  6,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalChuckScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  6,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event  1,  5, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FLassText, -1
	object_event  9,  7, SPRITE_JUGGLER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FSuperNerdText, -1
	object_event 11,  5, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodPokeCenter1FRichBoyText, -1

PokemonJournalChuckScript:
	setflag ENGINE_READ_CHUCK_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Chuck!"

	para "Chuck is said to"
	line "really like sweet"
	cont "desserts."

	para "However, he has"
	line "also been seen"

	para "training under a"
	line "heavy waterfall"
	cont "to work them off."
	done

CianwoodGymGuyScript:
	checkevent EVENT_GOT_HM04_STRENGTH
	iffalsefwd .no_strength
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptextfaceplayer .WinText
	jumptextfaceplayer .Text

.no_strength
	faceplayer
	opentext
	writetext .Text
	waitbutton
	writetext .StrengthText1
	promptbutton
	verbosegivetmhm HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
	writetext .StrengthText2
	waitendtext

.Text:
	text "Les dresseurs de"
	line "l'Arène sont des"
	cont "grosses brutes."

	para "Je veux pas qu'ils"
	line "s'en prennent à"
	cont "moi."

	para "Un conseil: le"
	line "champion utilise"
	cont "le type combat."

	para "Tu devrais donc"
	line "utiliser des"
	cont "#mon psy."

	para "Mets son équipe"
	line "K.O. avant qu'elle"

	para "n'utilise la"
	line "force."

	para "Et les rochers au"
	line "milieu de l'Arène?"

	para "Bouge-les correc-"
	line "tement pour accé-"
	cont "der au champion."

	para "Si tu ne peux plus"
	line "progresser, sors."
	done

.StrengthText1:
	text "You can't move the"
	line "boulders aside?"

	para "Here, use this"
	line "and teach your"
	cont "#mon Strength!"
	done

.StrengthText2:
	text "Good luck!"
	done

.WinText:
	text "<PLAYER>!"
	line "Tu as gagné!"
	cont "Je le savais rien"
	cont "qu'en te voyant!"
	done

CianwoodPokeCenter1FLassText:
	text "As-tu rencontré le"
	line "#maniac?"

	para "Il se vante sans"
	line "cesse sur ses"
	cont "#mon rares."
	done

CianwoodPokeCenter1FSuperNerdText:
	text "J'adore frimer"
	line "avec mes #mon."

	para "Et toi?"
	line "C'est ton truc?"

	para "Je vais faire"
	line "plein de combats"

	para "et frimer avec"
	line "mes jolis #mon!"
	done

CianwoodPokeCenter1FRichBoyText:
	text "There's no #"
	line "Mart in this town,"

	para "so we have to im-"
	line "port products from"
	cont "across the sea."
	done
