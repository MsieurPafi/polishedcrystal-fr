KarensRoom_MapScriptHeader:
	def_scene_scripts
	scene_script KarensRoomLockDoorScene, SCENE_KARENSROOM_LOCK_DOOR
	scene_const SCENE_KARENSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KarensRoomDoorCallback

	def_warp_events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KarenScript, -1

KarensRoomLockDoorScene:
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
	setscene SCENE_KARENSROOM_NOOP
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarensRoomDoorCallback:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

KarenScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer KAREN, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer KAREN, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_KAREN
	waitsfx
	end

.SeenText:
	text "Je suis Marion du"
	line "conseil des 4."

	para "C'est toi <PLAYER>?"
	line "C'est marrant."

	para "Moi j'aime les"
	line "#mon des"
	cont "ténèbres."

	para "Leur look noir"
	line "et méchant est"

	para "trop cool. Et ils"
	line "sont forts aussi!"

	para "Tu crois pouvoir"
	line "les battre? Allez,"
	cont "essaie pour voir."

	para "C'est parti."
	done

.BeatenText:
	text "Mmmm..."
	line "C'est bien."
	done

.AfterText:
	text "#mon puissants."

	para "#mon faibles."

	para "Cette vision est"
	line "faite pour les"
	cont "simples d'esprit."

	para "Les bons dresseurs"
	line "gagnent avec leurs"
	cont "#mon favoris."

	para "J'aime ton style."
	line "Tu as du"
	cont "talent..."

	para "Allez, va..."
	line "Le maître attend."
	done

.SeenRematchText:
	text "You fought through"
	line "the ranks to reach"
	cont "me. I'm impressed."

	para "You've assembled a"
	line "charming team."

	para "Our battle should"
	line "be a good one."

	para "Let's begin!"
	done

.AfterRematchText:
	text "I will not stray"
	line "from my chosen"
	cont "path."

	para "Lance is looking"
	line "forward to meeting"
	cont "you again."
	done
