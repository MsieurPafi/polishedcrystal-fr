PewterGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperJerry, -1
	object_event  7,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerEdwin, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftruefwd .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	setevent EVENT_BEAT_HIKER_EDWIN
	opentext
	givebadge BOULDERBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM48_ROCK_SLIDE
	iftrue_jumpopenedtext BrockFightDoneText
	writetext BrockBoulderBadgeText
	promptbutton
	verbosegivetmhm TM_ROCK_SLIDE
	setevent EVENT_GOT_TM48_ROCK_SLIDE
	jumpthisopenedtext

	text "It can sometimes"
	line "cause your foe to"
	cont "flinch."
	done

GenericTrainerCamperJerry:
	generictrainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText

	text "Hey, you! Trainer"
	line "from Johto! Brock"

	para "is tough. He'll"
	line "punish you if you"

	para "don't take him"
	line "seriously."
	done

GenericTrainerHikerEdwin:
	generictrainer HIKER, EDWIN, EVENT_BEAT_HIKER_EDWIN, HikerEdwinSeenText, HikerEdwinBeatenText

	text "Phew… Broken"
	line "in pieces."
	done

PewterGymGuyScript:
	checkevent EVENT_BEAT_BROCK
	iftrue_jumptextfaceplayer PewterGymGuyWinText
	jumpthistextfaceplayer

	text "Yo! Champ in"
	line "making! You're"

	para "really rocking."
	line "Are you battling"

	para "the Gym Leaders of"
	line "Kanto?"

	para "They're strong and"
	line "dedicated people,"

	para "just like Johto's"
	line "Gym Leaders."
	done

PewterGymStatue:
	gettrainername BROCK, 1, STRING_BUFFER_4
	checkflag ENGINE_BOULDERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

BrockIntroText:
	text "pierre: C'est pas"
	line "tous les jours"

	para "qu'on reçoit de la"
	line "visite de quelqu'"
	cont "un de Johto."

	para "Moi c'est pierre,"
	line "le champion de"

	para "l'Arène d'Argenta."
	line "J'adore les #-"
	cont "mon de la roche."

	para "Mes #mon sont"
	line "insensibles à la"

	para "plupart des atta-"
	line "ques physiques. Tu"

	para "vas en baver pour"
	line "leur faire des"
	cont "dégâts."

	para "C'est parti!"
	done

BrockWinLossText:
	text "pierre: Tes #-"
	line "mon ont pu passer"
	cont "ma défense de"
	cont "pierre..."

	para "Tu es plus balèze"
	line "que je ne le"
	cont "pensais..."

	para "Tiens... Prends"
	line "ce Badge."
	done

BrockBoulderBadgeText:
	text "Brock: <PLAYER>,"
	line "thanks. I enjoyed"

	para "battling you, even"
	line "though I am a bit"
	cont "upset."

	para "I'll give you the"
	line "TM for Rock Slide,"
	cont "too."
	done

BrockFightDoneText:
	text "pierre: Grand est"
	line "le monde. Beaucoup"

	para "de dresseurs tu"
	line "rencontreras."
	cont "Oh que oui."

	para "Tu verras..."
	line "Je vais devenir"
	cont "super balèze."
	done

CamperJerrySeenText:
	text "Les dresseurs de"
	line "cette Arène utili-"
	cont "sent des #mon"
	cont "du type roche."

	para "Cet élément a une"
	line "grande défense."

	para "Les combats ris-"
	line "quent de durer"
	cont "super longtemps."
	done

CamperJerryBeatenText:
	text "Il faut que je"
	line "gagne..."
	done

HikerEdwinSeenText: ; text > text
	text "R-r-r-R-R--CRASH!"
	done

HikerEdwinBeatenText: ; text > text
	text "BOOM!"
	done


PewterGymGuyWinText:
	text "Hé! Graine de"
	line "star! Cette"

	para "Arène ne t'a pas"
	line "posé trop de"
	cont "problèmes..."

	para "Tu m'as bluffé."
	line "Sérieusement."
	done
