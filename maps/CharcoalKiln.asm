CharcoalKiln_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 2
	warp_event  4,  7, AZALEA_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  9,  1, BGEVENT_JUMPTEXT, CharcoalKilnBucketText

	def_object_events
	object_event  1,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  4,  3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  8,  6, SPRITE_FARFETCH_D, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchdScript, EVENT_CHARCOAL_KILN_FARFETCH_D

CharcoalKilnBoss:
	checkevent EVENT_GOT_HM01_CUT
	iftrue_jumptextfaceplayer .Text3
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "All the Slowpoke"
	line "have disappeared"
	cont "from the town."

	para "The forest's pro-"
	line "tector may be"
	cont "angry with us…"

	para "It may be a bad"
	line "omen. We should"
	cont "stay in."
	done

.Text2:
	text "Les Ramoloss sont"
	line "de retour..."

	para "Mais mon Apprenti"
	line "n'est pas revenu"
	cont "du Bois aux"
	cont "Chenes."

	para "Où est donc ce"
	line "dresseur de"
	cont "troisième zone?"
	done

.Text3:
	text "Tu as chassé la"
	line "Team Rocket et tu"

	para "as visité le bois"
	line "aux Chenes en"
	cont "solitaire?"

	para "Pas mal!"
	line "J'aime ça. Viens"
	cont "donc t'entraîner"
	cont "avec nous."
	done

CharcoalKilnApprentice:
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue_jumptextfaceplayer .Text3
	checkevent EVENT_GOT_HM01_CUT
	iffalse_jumptextfaceplayer .Text1
	faceplayer
	opentext
	writetext .Text2
	promptbutton
	verbosegiveitem CHARCOAL
	iffalse_endtext
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	endtext

.Text1:
	text "Où sont passés"
	line "les Ramoloss?"

	para "Sont-ils dehors en"
	line "train de traîner?"
	done

.Text2:
	text "Pardonne-moi, j'ai"
	line "oublié de te re-"
	cont "mercier."

	para "J'ai produit ce"
	line "charbon."

	para "Les #mon de feu"
	line "seront contents"
	cont "d'en tenir un."
	done

.Text3:
	text "Les Ramoloss sont"
	line "de retour et tu as"
	cont "même retrouvé"
	cont "Canarticho."
	cont "T'es trop cool!"
	done

CharcoalKilnFarfetchdScript:
	faceplayer
	showcrytext .Text, FARFETCH_D
	end

.Text:
	text "Farfetch'd: Kwaa!"
	done

CharcoalKilnBucketText:
	text "It's a bucket."
	done
