AzaleaTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_AZALEATOWN_NOOP
	scene_const SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_const SCENE_AZALEATOWN_CELEBI_EVENT

	def_callbacks
	callback MAPCALLBACK_NEWMAP, AzaleaTownFlypointCallback
	callback MAPCALLBACK_TILES, AzaleaTownRainScript

	def_warp_events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_ENTRANCE, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	def_coord_events
	coord_event  5, 10, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleTrigger1
	coord_event  5, 11, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleTrigger2
	coord_event  9,  6, SCENE_AZALEATOWN_CELEBI_EVENT, AzaleaTown_CelebiTrigger

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, AzaleaTownSignText
	bg_event 10,  9, BGEVENT_JUMPTEXT, KurtsHouseSignText
	bg_event 11, 15, BGEVENT_JUMPTEXT, AzaleaGymSignText
	bg_event 29,  8, BGEVENT_JUMPTEXT, SlowpokeWellSignText
	bg_event 19, 13, BGEVENT_JUMPTEXT, CharcoalKilnSignText
	bg_event  3,  9, BGEVENT_JUMPTEXT, AzaleaTownIlexForestSignText
	bg_event 29, 14, BGEVENT_JUMPTEXT, AzaleaTownAdvancedTipsSignText
	bg_event 31,  6, BGEVENT_ITEM + FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

	def_object_events
	object_event 11, 10, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event  6,  5, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownKurtScript, EVENT_AZALEA_TOWN_KURT
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownYoungsterText, -1
	object_event 31,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownRocket1Text, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 10, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownRocket2Text, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  8, 17, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 30,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 14, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	pokemon_event 14, 12, WOOPER, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, AzaleaTownWoosterText, EVENT_SLOWPOKE_WELL_SLOWPOKES
	pokemon_event 14, 12, QUAGSIRE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, AzaleaTownWoosterText, EVENT_AZALEA_TOWN_SLOWPOKES
	fruittree_event  8,  2, FRUITTREE_AZALEA_TOWN, WHT_APRICORN, PAL_NPC_ENV_WHITE

	object_const_def
	const AZALEATOWN_RIVAL
	const AZALEATOWN_KURT

AzaleaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_AZALEA
	endcallback

AzaleaTownRainScript:
	special Special_GetOvercastIndex
	ifequalfwd AZALEA_OVERCAST, .rain
	changemapblocks AzaleaTown_BlockData
	endcallback

.rain
	changemapblocks AzaleaTownRaining_BlockData
	endcallback

AzaleaTownRivalBattleTrigger1:
	moveobject AZALEATOWN_RIVAL, 11, 11
AzaleaTownRivalBattleTrigger2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear AZALEATOWN_RIVAL
	applymovement AZALEATOWN_RIVAL, .ApproachMovement
	faceobject AZALEATOWN_RIVAL, PLAYER
	faceobject PLAYER, AZALEATOWN_RIVAL
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext .SeenText
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.Totodile:
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.Chikorita:
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.AfterBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext .AfterText
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_RIVAL, .ExitMovement
	playsound SFX_EXIT_BUILDING
	disappear AZALEATOWN_RIVAL
	setmapscene ROUTE_34, SCENE_ROUTE34_LYRA_DAYCARE
	setscene SCENE_AZALEATOWN_NOOP
	waitsfx
	playmapmusic
	end

.SeenText:
	text "...Dis-moi quelque"
	line "chose, p'tit"
	cont "bouchon..."

	para "Est-ce vrai que la"
	line "Team Rocket est de"
	cont "retour?"

	para "Quoi? Tu les as"
	line "battus? Hah!"
	cont "Arrête de mentir."

	para "Naan, t'aimes"
	line "pas crâner, toi!"
	cont "Allez, baston..."
	done

.WinText:
	text "…Humph! Useless"
	line "#mon!"

	para "Listen, you. You"
	line "only won because"

	para "my #mon were"
	line "weak."
	done

.LossText:
	text "...Humpff! Je me"
	line "doutais bien que"
	cont "tu pipotais..."
	done

.AfterText:
	text "Je déteste les"
	line "minus."

	para "#mon ou"
	line "dresseur, c'est"
	cont "du kif-kif."

	para "Je vais devenir"
	line "surpuissant et"
	cont "balayer les minus."

	para "Et c'est pareil"
	line "pour la Team"
	cont "Rocket."

	para "Ils sont redoutés"
	line "parce qu'ils agis-"

	para "sent en groupe,"
	line "mais un par un ils"
	cont "sont faibles."

	para "Je les déteste"
	line "tous!"

	para "Hors de ma vue"
	line "minus! Quelqu'un"

	para "comme toi"
	line "ne peut rien"
	cont "m'apporter..."
	done

.ApproachMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

.ExitMovement:
	step_left
	step_left
	step_left
	step_end

AzaleaTown_CelebiTrigger:
	applymovement PLAYER, .WalkOutOfKurtsHouseMovement
	opentext
	writethistext
		text "Ilex Forest is"
		line "restless!"

		para "What is going on?"
		done
	promptbutton
	turnobject AZALEATOWN_KURT, RIGHT
	writethistext
		text "<PLAYER>, here's"
		line "your GS Ball back!"
		done
	promptbutton
	writetext AzaleaTownKurtText
	waitbutton
	verbosegivekeyitem GS_BALL
	turnobject AZALEATOWN_KURT, LEFT
	setflag ENGINE_HAVE_EXAMINED_GS_BALL
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	setscene SCENE_AZALEATOWN_NOOP
	endtext

.WalkOutOfKurtsHouseMovement:
	step_left
	step_left
	step_up
	turn_head_left
	step_end

AzaleaTownSignText:
	text "Écorcia"
	line "La ville où les"

	para "gens et les petits"
	line "#mon sont"
	cont "bien contents"
	cont "d'habiter"
	done

KurtsHouseSignText:
	text "maison de Fargas"
	done

AzaleaGymSignText:
	text "champion d'Arène"
	line "d'Écorcia: Hector"

	para "l'expert des"
	line "#mon insecte!"
	done

SlowpokeWellSignText:
	text "Puits Ramoloss"

	para "Aussi connu sous"
	line "le nom de..."
	cont "Puits de pluie."

	para "Les gens du coin"
	line "pensent que le"
	cont "baillement du"
	cont "Ramoloss invoque"
	cont "la pluie."

	para "Les archives"
	line "montrent qu'un"

	para "baillement de"
	line "Ramoloss a mis fin"
	cont "à 400 ans de"
	cont "sécheresse."
	done

CharcoalKilnSignText:
	text "Four A charbon"
	done

AzaleaTownIlexForestSignText:
	text "Bois aux Chênes"

	para "On y entre par la"
	line "porte."
	done

AzaleaTownAdvancedTipsSignText:
	text "Advanced Tips!"

	para "The Switch battle"
	line "style lets you"

	para "know which #-"
	line "mon an opponent is"
	cont "about to send out,"

	para "but the Predict"
	line "style does not!"
	done

AzaleaTownGrampsScript:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "The Slowpoke have"
	line "disappeared from"
	cont "town…"

	para "I heard their"
	line "Tails are being"
	cont "sold somewhere."
	done

.Text2:
	text "Les Ramoloss sont"
	line "de retour."

	para "A mon avis, ils"
	line "devaient traîner"
	cont "quelque part."
	done

AzaleaTownTeacherScript:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse_jumptextfaceplayer .Text1
	checkevent EVENT_GOT_CLEAR_AMULET_IN_AZALEA
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text3
	promptbutton
	verbosegiveitem CLEAR_AMULET
	iffalse_endtext
	setevent EVENT_GOT_CLEAR_AMULET_IN_AZALEA
	jumpthisopenedtext

.Text2:
	text "He has changed,"
	line "but he'll always be"

	para "my little Wooster"
	line "to me."
	done

.Text1:
	text "It hasn't rained"
	line "since the Slow-"
	cont "poke vanished."

	para "My poor Wooster"
	line "can't thrive in"
	cont "this weather…"
	done

.Text3:
	text "In a sudden down-"
	line "pour, my Wooster"
	cont "evolved!"

	para "Oh? You brought"
	line "the Slowpoke back?"

	para "They brought the"
	line "rain with them!"

	para "Thank you so"
	line "much!"

	para "Please take this,"
	line "you deserve it!"
	done

AzaleaTownWoosterText:
	text "Kiki: Gaaahh..."
	done

AzaleaTownYoungsterText:
	text "Passe par Écorcia"
	line "et tu te retrou-"
	cont "veras au Bois aux"
	cont "Chênes."

	para "Mais ces petits"
	line "arbustes bloquent"
	cont "le passage."

	para "Le #mon du"
	line "Charbonnier peut"
	cont "couper les arbres."
	done

AzaleaTownRocket1Text:
	text "C'est dangereux"
	line "d'entrer ici, je"
	cont "monte la garde."

	para "J'suis trop cool,"
	line "tu ne trouves pas?"
	done

AzaleaTownRocket2Text:
	text "Que sais-tu sur la"
	line "Queueramolos? On"
	cont "dit que c'est"
	cont "goûtu!"

	para "C'est trop bien"
	line "de savoir ça, non?"
	done

AzaleaTownSlowpokeScript:
	opentext
	writethistext
		text "Slowpoke: …"

		para "…… …… ……"
		done
	pause 60
	writethistext
		text "…… ……Yawn?"
		done
	cry SLOWPOKE
	waitendtext

AzaleaTownKurtScript:
	showtextfaceplayer AzaleaTownKurtText
	turnobject LAST_TALKED, LEFT
	end

AzaleaTownKurtText:
	text "Peux-tu voir pour-"
	line "quoi le Bois aux"
	cont "Chênes est si"
	cont "agité?"
	done
