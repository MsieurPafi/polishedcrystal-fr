WillsRoom_MapScriptHeader:
	def_scene_scripts
	scene_script WillsRoomLockDoorScene, SCENE_WILLSROOM_LOCK_DOOR
	scene_const SCENE_WILLSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, WillsRoomDoorCallback

	def_warp_events
	warp_event  5, 17, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, WillScript, -1

WillsRoomLockDoorScene:
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
	setscene SCENE_WILLSROOM_NOOP
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

WillsRoomDoorCallback:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

WillScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer WILL, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer WILL, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_WILL
	waitsfx
	end

.SeenText:
	text "Welcome to the"
	line "#mon League,"
	cont "<PLAYER>."

	para "Allow me to intro-"
	line "duce myself. I am"
	cont "Will."

	para "I have trained all"
	line "around the world,"

	para "making my Psychic"
	line "#mon powerful."

	para "And, at last, I've"
	line "been accepted into"
	cont "the Elite Four."

	para "I can only keep"
	line "getting better!"

	para "Losing is not an"
	line "option!"
	done

.BeatenText:
	text "C'est..."
	line "Incroyable..."
	done

.AfterText:
	text "J'ai peut-être"
	line "perdu comme un"
	cont "criquet mais..."

	para "Je continuerai à"
	line "combattre tant que"

	para "je ne serai pas le"
	line "plus grand!"

	para "<PLAYER>..."
	line "Continue ta route"

	para "et découvre la"
	line "force du conseil"
	cont "des 4!"
	done

.SeenRematchText:
	text "So, you have"
	line "finally appeared."

	para "I have observed"
	line "your battle"
	cont "techniques."

	para "I'm ready for you!"

	para "All right."

	para "Prepare for"
	line "battle!"
	done

.AfterRematchText:
	text "I've expended all"
	line "my power."

	para "I have no regrets"
	line "about losing"
	cont "this way."
	done
