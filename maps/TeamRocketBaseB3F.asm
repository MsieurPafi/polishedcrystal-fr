TeamRocketBaseB3F_MapScriptHeader:
	def_scene_scripts
	scene_script TeamRocketBaseB3FLanceGetsPasswordScene, SCENE_TEAMROCKETBASEB3F_LANCE_GETS_PASSWORD
	scene_const SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_const SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_const SCENE_TEAMROCKETBASEB3F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TeamRocketBaseB3FCheckGiovanniDoor

	def_warp_events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	def_coord_events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossLeft
	coord_event 11,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossRight
	coord_event  8, 10, SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER, RocketBaseRival

	def_bg_events
	bg_event 10,  9, BGEVENT_IFNOTSET, BossDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, BossDoor
	bg_event 10,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 11,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 12,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 13,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  4, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  5, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  6, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  7, 13, BGEVENT_JUMPSTD, teamrocketoath

	def_object_events
	object_event 25, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	object_event  8,  3, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_PETREL
	object_event  7,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MURKROW, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event 21,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 23, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerRocketScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRocketScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TeamRocketBaseB3FRocketText, EVENT_TEAM_ROCKET_BASE_POPULATION
	itemball_event  1, 12, PROTEIN, 1, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	itemball_event  3, 12, X_SP_DEF, 1, EVENT_TEAM_ROCKET_BASE_B3F_X_SP_DEF
	itemball_event 28,  9, FULL_HEAL, 1, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	itemball_event 17,  2, ICE_HEAL, 1, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	itemball_event 14, 10, ULTRA_BALL, 1, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL

	object_const_def
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_PETREL
	const TEAMROCKETBASEB3F_MURKROW
	const TEAMROCKETBASEB3F_RIVAL

TeamRocketBaseB3FLanceGetsPasswordScene:
	sdefer LanceGetPasswordScript
	end

TeamRocketBaseB3FCheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftruefwd .OpenSesame
	endcallback

.OpenSesame:
	changeblock 10, 8, $0d
	endcallback

LanceGetPasswordScript:
	turnobject PLAYER, LEFT
	pause 5
	turnobject TEAMROCKETBASEB3F_MURKROW, RIGHT
	pause 20
	applyonemovement TEAMROCKETBASEB3F_LANCE, step_right
	showtext LanceGetPasswordText
	applymovement TEAMROCKETBASEB3F_LANCE, RocketBaseLanceLeavesMovement
	disappear TEAMROCKETBASEB3F_LANCE
	setscene SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	end

RocketBaseRival:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear TEAMROCKETBASEB3F_RIVAL
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalEnterMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext RocketBaseRivalText
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalLeaveMovement
	disappear TEAMROCKETBASEB3F_RIVAL
	setscene SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	special RestartMapMusic
	end

RocketBaseBossLeft:
	applymovement PLAYER, RocketBasePlayerApproachesBossLeftMovement
	sjumpfwd RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, RocketBasePlayerApproachesBossRightMovement
RocketBaseBoss:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_PETREL, 15
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_PETREL, DOWN
	showtext ExecutiveM4BeforeText
	applyonemovement TEAMROCKETBASEB3F_PETREL, step_down
	winlosstext ExecutiveM4BeatenText, 0
	setlasttalked TEAMROCKETBASEB3F_PETREL
	loadtrainer PETREL, PETREL2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PETREL_2
	showtext ExecutiveM4AfterText
	applymovement TEAMROCKETBASEB3F_PETREL, RocketBaseBossHitsTableMovement
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_PETREL, RocketBaseBossLeavesMovement
	disappear TEAMROCKETBASEB3F_PETREL
	setscene SCENE_TEAMROCKETBASEB3F_NOOP
	end

RocketBaseMurkrow:
	showtext RocketBaseMurkrowText
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer GRUNTF, 5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	endifjustbattled
	showtext GruntF5AfterBattleText
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer GRUNTM, 28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	endifjustbattled
	showtext GruntM28AfterBattleText
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

GenericTrainerRocketScientistRoss:
	generictrainer ROCKET_SCIENTIST, ROSS, EVENT_BEAT_ROCKET_SCIENTIST_ROSS, RocketScientistRossSeenText, RocketScientistRossBeatenText

	text "A radio signal"
	line "that drives #-"
	cont "mon mad…"

	para "My experiment is a"
	line "complete success."

	para "My promotion is"
	line "assured. This loss"

	para "means absolutely"
	line "nothing."
	done

GenericTrainerRocketScientistMitch:
	generictrainer ROCKET_SCIENTIST, MITCH, EVENT_BEAT_ROCKET_SCIENTIST_MITCH, RocketScientistMitchSeenText, RocketScientistMitchBeatenText

	text "If we turn up the"
	line "power of our radio"

	para "signal for broad-"
	line "cast nationwide…"

	para "The very thought"
	line "excites me!"
	done

BossDoor:
	dw EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalsefwd .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalsefwd .NeedsPassword
	sjumpfwd .OpenSesame

.NeedsPassword:
	jumpthisopenedtext

	text "The door's closed…"

	para "It needs two"
	line "passwords to open."
	done

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $0d
	refreshmap
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

RocketBaseLanceLeavesMovement:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RocketBasePlayerApproachesBossLeftMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

RocketBasePlayerApproachesBossRightMovement:
	step_up
	step_up
	step_left
	step_up
	step_left
	step_left
	turn_head_up
	step_end

RocketBaseBossHitsTableMovement:
	run_step_right
	run_step_right
	step_end

RocketBaseBossLeavesMovement:
	fix_facing
	fast_jump_step_left
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	slow_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	step_end

RocketBaseRivalEnterMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

RocketBaseRivalLeaveMovement:
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "Peter: Il faut 2"
	line "mots de passe pour"

	para "entrer chez le"
	line "boss."

	para "Seuls certains"
	line "Rockets les con-"
	cont "naissent."

	para "Ce Rocket m'a ap-"
	line "pris tout ça très"
	cont "gentiment."

	para "<PLAYER>, allons"
	line "trouver les mots"
	cont "de passe."
	done

TeamRocketBaseB3FRocketText:
	text "Gueuuh... Le type"
	line "avec la cape est"
	cont "trop balèze!"
	done

RocketBaseRivalText:
	text "..."

	para "J'te l'avais dit"
	line "que j'allais la"

	para "casser la Team"
	line "Rocket, non?"

	para "Au fait, kissé le"
	line "type avec la cape"

	para "qui a plein de"
	line "#mon dragons?"

	para "Mes #mon se"
	line "sont fait éclater."

	para "Mais c'est pas"
	line "grave. Je pourrai"

	para "le battre dans pas"
	line "longtemps."

	para "Ce qu'il a dit"
	line "me perturbe..."

	para "Il raconte que je"
	line "n'aime ni ne res-"

	para "pecte mes #mon."
	line "Tu le crois ça?"

	para "Comment j'ai pu"
	line "perdre face à un"
	cont "crétin pareil."

	para "...Pfff..."
	line "Vous me faites"
	cont "tous pitié!"
	done

ExecutiveM4BeforeText:
	text "Quoi? Qui es-tu?"
	line "C'est le bureau de"

	para "notre chef vénéré,"
	line "Giovanni."

	para "Depuis la dissolu-"
	line "tion de la Team il"

	para "y a 3 ans, il"
	line "s'entraîne à fond."

	para "Mais il reviendra"
	line "prendre le pouvoir"

	para "un jour, c'est"
	line "sûr!"

	para "C'est pourquoi"
	line "nous sommes fidè-"
	cont "les au poste."

	para "Je ne laisserai"
	line "passer aucun"
	cont "intrus!"
	done

ExecutiveM4BeatenText:
	text "Je...comment..."
	line "Trop balèze."

	para "Giovanni, pitié."
	line "Pardonne-moi!"
	done

ExecutiveM4AfterText:
	text "Je dois m'en"
	line "remettre et..."

	para "Je dois vite pré-"
	line "venir les autres!"
	done

RocketBaseMurkrowText:
	text "Cornebre: Le mot"
	line "de passe est..."

	para "Vive Giovanni."
	done

GruntF5SeenText:
	text "Si je connais le"
	line "mot de passe?"

	para "Peut-être."

	para "Mais j'le donnerai"
	line "pas!"
	done

GruntF5BeatenText:
	text "OK. Arrête."
	line "Je vais parler."
	done

GruntF5AfterBattleText:
	text "Le mot de passe de"
	line "la salle du chef"
	cont "est..."

	para "Queueramolos."

	para "Mais ça te sert à"
	line "rien sans l'autre"
	cont "mot de passe."
	done

GruntM28SeenText:
	text "Gnyark Gnyark!"

	para "Tu me lances un"
	line "défi? A moi? T'es"

	para "débile ou quoi?"
	line "J'vais te bouffer!"

	para "Gnyark Gnyark!"

	para "Bats-moi et je te"
	line "donne un des"

	para "mots de passe pour"
	line "la salle du chef!"
	done

GruntM28BeatenText:
	text "Gnyark!"
	line "Alors toi!"
	done

GruntM28AfterBattleText:
	text "Gnyark Gnyark!"

	para "Le mot de passe"
	line "est..."

	para "Heu...c'est..."
	line "queue Rattatac."
	done

RocketScientistRossSeenText:
	text "Je travaillais"
	line "pour la Sylphe"

	para "mais maintenant je"
	line "suis pour la"
	cont "Team Rocket."

	para "Une petite peste"
	line "comme toi doit"
	cont "être punie."
	done

RocketScientistRossBeatenText:
	text "Petite erreur"
	line "de calcul..."
	done

RocketScientistMitchSeenText:
	text "Blesser des #-"
	line "mon pendant les"
	cont "expériences n'est"
	cont "pas un problème."
	done

RocketScientistMitchBeatenText:
	text "Moi, j'suis un"
	line "cérébral, pas un"
	cont "combattant."
	done


TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "La porte est"
	line "fermée..."

	para "<PLAYER> tape les"
	line "deux mots de"
	cont "passe."

	para "La porte est"
	line "ouverte!"
	done
