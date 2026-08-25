Route26DayofWeekSiblingsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_26, 4
	warp_event  3,  7, ROUTE_26, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalsefwd .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalsefwd .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	endtext

DayOfWeekSiblingsHousePokedexText1:
	text "Il y a quelque"
	line "chose d'écrit."

	para "Lire?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "A mes frères et"
	line "soeurs:"

	para "Nous devons aider"
	line "les dresseurs de"
	cont "#mon."

	para "Quand un dresseur"
	line "vient vous parler,"
	cont "donnez-lui un"
	cont "objet."

	para "Bisous,"
	line "Lucie"

	para "Continuer à lire?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "Lundi, Lucie"
	line "route 40"

	para "Mardi, Marie"
	line "route 29"

	para "Mercredi, Homer"
	line "Lac Colère"

	para "Jeudi, Jerome"
	line "route 36"

	para "Vendredi, Vanessa"
	line "route 32"

	para "Samedi, Samuel"
	line "Ébènelle"

	para "Dimanche, Dimitri"
	line "route 37"
	done
