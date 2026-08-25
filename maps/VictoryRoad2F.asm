VictoryRoad2F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_VICTORYROAD2F_RIVAL_BATTLE
	scene_const SCENE_VICTORYROAD2F_NOOP

	def_callbacks

	def_warp_events
	warp_event 25,  9, ROUTE_23_NORTH, 2
	warp_event  3, 11, VICTORY_ROAD_1F, 2
	warp_event  3,  4, VICTORY_ROAD_3F, 1
	warp_event 15,  7, VICTORY_ROAD_3F, 2
	warp_event 19,  9, VICTORY_ROAD_3F, 3

	def_coord_events
	coord_event 25,  9, SCENE_VICTORYROAD2F_RIVAL_BATTLE, VictoryRoadRivalLeft

	def_bg_events
	bg_event  5,  5, BGEVENT_ITEM + MAX_POTION, EVENT_VICTORY_ROAD_2F_HIDDEN_MAX_POTION

	def_object_events
	object_event 20,  9, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	object_event 11, 11, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerVeteranfJoanne, -1
	object_event  5,  3, SPRITE_VETERAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerVeteranfJonet, -1
	tmhmball_event  8,  4, TM_EARTHQUAKE, EVENT_VICTORY_ROAD_2F_TM_EARTHQUAKE
	itemball_event 20,  5, FULL_RESTORE, 1, EVENT_VICTORY_ROAD_2F_FULL_RESTORE
	itemball_event  9, 14, HP_UP, 1, EVENT_VICTORY_ROAD_2F_HP_UP

	object_const_def
	const VICTORYROAD2F_RIVAL

VictoryRoadRivalLeft:
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	special Special_FadeOutMusic
	pause 15
	appear VICTORYROAD2F_RIVAL
	applymovement VICTORYROAD2F_RIVAL, VictoryRoadRivalBattleApproachMovement1
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext VictoryRoadRivalBeforeText
	setevent EVENT_RIVAL_VICTORY_ROAD
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .GotTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .GotChikorita
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_RIVAL
	loadtrainer RIVAL1, RIVAL1_15
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.GotTotodile:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_RIVAL
	loadtrainer RIVAL1, RIVAL1_13
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.GotChikorita:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_RIVAL
	loadtrainer RIVAL1, RIVAL1_14
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.AfterBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext VictoryRoadRivalAfterText
	applymovement VICTORYROAD2F_RIVAL, VictoryRoadRivalBattleExitMovement1
	disappear VICTORYROAD2F_RIVAL
	setscene SCENE_VICTORYROAD2F_NOOP
	playmapmusic
	end

GenericTrainerVeteranfJoanne:
	generictrainer VETERANF, JOANNE, EVENT_BEAT_VETERANF_JOANNE, VeteranfJoanneSeenText, VeteranfJoanneBeatenText

	text "You earned the"
	line "right to be on"
	cont "Victory Road!"
	done

GenericTrainerVeteranfJonet:
	generictrainer VETERANF, JONET, EVENT_BEAT_VETERANF_JONET, VeteranfJonetSeenText, VeteranfJonetBeatenText

	text "Did somebody"
	line "capture Moltres"
	cont "already?"
	done

VictoryRoadRivalBattleApproachMovement1:
	step_right
	step_right
	step_right
	step_right
	step_end

VictoryRoadRivalBattleExitMovement1:
	step_left
	step_left
	step_left
	step_left
	step_end

VictoryRoadRivalBeforeText:
	text "Minute."

	para "Vas-tu relever le"
	line "défi de la Ligue"
	cont "#mon?"

	para "Me fais pas rire!"
	line "T'es minable!"

	para "mi--na--ble!"
	line "Et moi... Tu sais"

	para "quoi? J'suis bien"
	line "meilleur que toi!"

	para "J'ai les meilleurs"
	line "#mon! Les"

	para "plus forts de"
	line "tous! Je suis in-"
	cont "vincible!"

	para "<PLAYER>!"
	line "J'vais t'briser!"
	done

VictoryRoadRivalDefeatText:
	text "J'pouvais pas"
	line "gagner..."

	para "Je me suis donné"
	line "à fond..."

	para "Tu as quelque cho-"
	line "se que je n'aurai"
	cont "jamais..."

	para "Je commence à com-"
	line "prendre ce que"

	para "voulait dire le"
	line "type aux dragons."
	done

VictoryRoadRivalAfterText:
	text "Je n'ai pas oublié"
	line "mon rêve: devenir"
	cont "le plus grand des"
	cont "dresseurs..."

	para "Je vais vite ap-"
	line "prendre ce qu'il"

	para "me manque pour"
	line "m'améliorer..."

	para "Et alors, ça va"
	line "être ta fête."

	para "Tu vas ramasser"
	line "tes dents avec tes"
	cont "doigts cassés."

	para "Alors à bientôt,"
	line "minable."
	done

VictoryRoadRivalVictoryText:
	text "Hmmmm!"

	para "Quand on y pense,"
	line "rien ne peut bat-"
	cont "tre la force"
	cont "brute."

	para "Je n'ai besoin de"
	line "rien d'autre."
	done

VeteranfJoanneSeenText:
	text "Victory Road is"
	line "the final test"
	cont "for trainers!"
	done

VeteranfJoanneBeatenText:
	text "Aiyah!"
	done

VeteranfJonetSeenText:
	text "There's supposed"
	line "to be a Moltres"
	cont "roosting here."

	para "I'm going to catch"
	line "it!"
	done

VeteranfJonetBeatenText:
	text "I'd have won if"
	line "I had a legendary"
	cont "#mon…"
	done
