BrunosRoom_MapScriptHeader:
	def_scene_scripts
	scene_script BrunosRoomLockDoorScene, SCENE_BRUNOSROOM_LOCK_DOOR
	scene_const SCENE_BRUNOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, BrunosRoomDoorCallback

	def_warp_events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BrunoScript, -1

BrunosRoomLockDoorScene:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, WalkIntoEliteFourRoomMovement
	reanchormap
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a
	refreshmap
	closetext
	setscene SCENE_BRUNOSROOM_NOOP
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunosRoomDoorCallback:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

BrunoScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer BRUNO, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer BRUNO, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_BRUNO
	waitsfx
	end

.SeenText:
	text "Je suis Aldo du"
	line "conseil des 4."

	para "Mon truc à moi"
	line "c'est de m'entraî-"
	cont "ner comme un méga"
	cont "dingue."

	para "Et c'est comme ça"
	line "que je suis devenu"
	cont "si fort et beau."

	para "... Ho!"
	line "Tu m'écoutes?"

	para "T'as pas peur ou"
	line "quoi? Très bien..."

	para "Comme on peut pas"
	line "discuter, on va"
	cont "s'battre."

	para "OK, <PLAYER>?"
	line "Tu vas... Quoi?"

	para "Tu veux que j'ar-"
	line "rête de parler?"

	para "combat!"
	done

.BeatenText:
	text "Moi? Perdre?"
	line "Pourquoi?"
	done

.AfterText:
	text "J'ai perdu, alors"
	line "je vais me taire."
	cont "Heu..."

	para "Va dans la pro-"
	line "chaine salle!"
	done

.SeenRematchText:
	text "Hello again."

	para "As one of the"
	line "Elite Four, I will"
	cont "stand up to your"
	cont "challenge!"

	para "It would disturb"
	line "me for you to"
	cont "underestimate my"
	cont "fighting #mon."

	para "Get ready!"
	done

.AfterRematchText:
	text "We tried hard."

	para "Continue on!"
	done
