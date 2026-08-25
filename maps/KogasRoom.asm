KogasRoom_MapScriptHeader:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_const SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorCallback

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KogaScript, -1

KogasRoomLockDoorScene:
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
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogasRoomDoorCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

KogaScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer KOGA, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer KOGA, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_KOGA
	waitsfx
	end

.SeenText:
	text "Fwahahahaha!"

	para "Moi c'est Koga du"
	line "conseil des 4."

	para "J'suis un ninja!"
	line "Comme à la télé!"

	para "Je saute, je lance"
	line "des shurikens..."
	cont "J'suis trop fort!"

	para "Mais c'est pas"
	line "tout..."

	para "Tu vas voir ce que"
	line "c'est la technique"
	cont "de maître!"

	para "Fwahahahaha!"

	para "La force c'est"
	line "bien, mais le poi-"

	para "son, le sommeil et"
	line "la folie, c'est"
	cont "terrible!"
	done

.BeatenText:
	text "Ah! Toi être"
	line "adversaire"
	cont "honorable!"
	done

.AfterText:
	text "J'ai combattu de"
	line "toutes mes forces"
	cont "mais..."

	para "Y'a pas moyen."
	line "Je ne suis pas"
	cont "assez fort."

	para "Va dans la pro-"
	line "chaine salle."
	cont "Bonne chance!"
	done

.SeenRematchText:
	text "Your arrival is"
	line "indeed impressive,"
	cont "as is your look of"
	cont "resolve."

	para "Fwahahahaha!"

	para "My skill will be"
	line "hard to overcome!"

	para "Let me show you"
	line "what I mean!"
	done

.AfterRematchText:
	text "Never have I met"
	line "the likes of you."

	para "I must devote"
	line "myself to my"
	cont "training."
	done
