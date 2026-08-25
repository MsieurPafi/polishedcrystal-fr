SafariZoneWardensHome_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, FUCHSIA_CITY, 5
	warp_event  5,  7, FUCHSIA_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  5,  0, BGEVENT_JUMPTEXT, WardenPhotoText
	bg_event  7,  0, BGEVENT_JUMPTEXT, SafariZonePhotoText
	bg_event  8,  1, BGEVENT_JUMPTEXT, WardensHouseCuriosText
	bg_event  9,  1, BGEVENT_JUMPTEXT, WardensHouseCuriosText

	def_object_events
	object_event  2,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftruefwd .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	jumpthisopenedtext

	text "Many people were"
	line "disappointed that"

	para "Safari Zone closed"
	line "down, but Grandpa"
	cont "is so stubborn…"
	done

WardensGranddaughterText1:
	text "Mon pépé est le"
	line "gardien du Parc"
	cont "Safari."

	para "Enfin..."
	line "Il l'était."

	para "Il a décidé de"
	line "prendre des vacan-"

	para "ces et de voyager"
	line "tout seul."

	para "Il a démissionné"
	line "juste comme ça."
	done


WardenPhotoText:
	text "C'est la photo"
	line "d'un vieil homme"

	para "entouré de"
	line "#mon."
	done

SafariZonePhotoText:
	text "C'est la photo"
	line "d'une grande plai-"

	para "ne verdoyante avec"
	line "des #mon rares"
	cont "tout partout."
	done

WardensHouseCuriosText:
	text "It's a curio"
	line "cabinet full of"

	para "fossils and old"
	line "#mon merchan-"
	cont "dise."
	done
