CeladonMansionRoofHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1

CeladonMansionRoofHousePharmacistScript:
	checkevent EVENT_GOT_TM03_CURSE
	iftrue_jumptextfaceplayer .CurseText
	faceplayer
	opentext
	writetext .IntroText
	promptbutton
	checktime 1 << NITE
	iffalse_jumpopenedtext .NotNiteText
	writetext .StoryText
	promptbutton
	verbosegivetmhm TM_CURSE
	setevent EVENT_GOT_TM03_CURSE
	jumpthisopenedtext

.CurseText:
	text "CT03: Malediction."

	para "Une capacité"
	line "terrifiante qui"

	para "épuise doucement"
	line "les PV de la"
	cont "victime."
	done

.IntroText:
	text "Je vais te racon-"
	line "ter un truc terri-"
	cont "fiant..."
	done

.NotNiteText:
	text "...Il vaut mieux"
	line "attendre la fin"

	para "de la journée. Il"
	line "y a encore de la"
	cont "lumière dehors."

	para "Reviens la nuit"
	line "tombée, OK?"
	done

.StoryText:
	text "Il était une fois,"
	line "un petit garçon"

	para "qui reçut une nou-"
	line "velle Bicyclette."

	para "Il voulut l'essa-"
	line "yer tout de suite."

	para "Il s'amusait et"
	line "n'avait pas remar-"

	para "qué que la nuit"
	line "commençait à"
	cont "tomber..."

	para "Tout en pédalant"
	line "comme un furieux"

	para "pour rentrer chez"
	line "lui dans la nuit"
	cont "noire, son vélo"
	cont "ralentit!"

	para "Les pédales devin-"
	line "rent lourdes!"

	para "Epuisé, il s'arrê-"
	line "ta mais la bicy-"

	para "clette roula vers"
	line "l'arrière!"

	para "Il lui semblait"
	line "que le vélo était"

	para "maudit et tentait"
	line "de l'entraîner"
	cont "vers les ténèbres!"

	para "..."

	para "......."

	para "Yahaaaaaaha!"

	para "Il montait en fait"
	line "la pente de la"
	cont "Piste Cyclable!"

	para "..."
	line "Super histoire!"

	para "Merci. Merci."
	line "Tu aimes tant ma"
	cont "belle histoire,"
	cont "voilà pour toi:"
	cont "la CT03!"
	done
