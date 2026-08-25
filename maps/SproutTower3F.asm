SproutTower3F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER
	scene_const SCENE_SPROUTTOWER3F_NOOP

	def_callbacks

	def_warp_events
	warp_event  8, 14, SPROUT_TOWER_2F, 4

	def_coord_events
	coord_event  9,  9, SCENE_SPROUTTOWER3F_RIVAL_ENCOUNTER, SproutTower3FRivalScene

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPTEXT, SproutTower3FStatueText
	bg_event  9,  1, BGEVENT_JUMPTEXT, SproutTower3FStatueText
	bg_event  7,  0, BGEVENT_JUMPTEXT, SproutTower3FPaintingText
	bg_event  8,  0, BGEVENT_JUMPTEXT, SproutTower3FPaintingText
	bg_event  3, 15, BGEVENT_JUMPTEXT, SproutTower3FStatueText
	bg_event 12, 15, BGEVENT_JUMPTEXT, SproutTower3FStatueText

	def_object_events
	object_event  8,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
	object_event  6, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSageJin, -1
	object_event  6,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageTroy, -1
	object_event  9, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSageNeal, -1
	object_event  8,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ElderLiScript, -1
	itemball_event  4, 14, POTION, 1, EVENT_SPROUT_TOWER_3F_POTION
	itemball_event 12,  1, ESCAPE_ROPE, 1, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE

	object_const_def
	const SPROUTTOWER3F_RIVAL

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	playsound SFX_TACKLE
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	earthquake 79
	applymovement PLAYER, SproutTower3FPlayerApproachesRivalMovement
	applyonemovement SPROUTTOWER3F_RIVAL, step_up
	showtext SproutTowerElderLecturesRivalText
	showemote EMOTE_SHOCK, SPROUTTOWER3F_RIVAL, 15
	turnobject SPROUTTOWER3F_RIVAL, DOWN
	pause 15
	applymovement SPROUTTOWER3F_RIVAL, SproutTower3FRivalLeavesElderMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext SproutTowerRivalOnlyCareAboutStrongText
	turnobject SPROUTTOWER3F_RIVAL, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_RIVAL
	waitsfx
	special Special_FadeInQuickly
	setscene SCENE_SPROUTTOWER3F_NOOP
	special RestartMapMusic
	end

ElderLiScript:
	checkevent EVENT_GOT_TM70_FLASH
	iftrue_jumptextfaceplayer SageLiAfterBattleText
	faceplayer
	showtext SageLiSeenText
	winlosstext SageLiBeatenText, 0
	loadtrainer ELDER, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	promptbutton
	verbosegivetmhm TM_FLASH
	setevent EVENT_GOT_TM70_FLASH
	setevent EVENT_BEAT_ELDER_LI
	jumpthisopenedtext

	text "Flash illuminates"
	line "even the darkest"
	cont "of all places."

	para "You need not teach"
	line "it to your #mon"

	para "unless you wish"
	line "to use Flash in"
	cont "battle."

	para "Simply press A in"
	line "the darkness, and"

	para "if any of your"
	line "#mon can use"
	cont "Flash, they will."
	done

GenericTrainerSageJin:
	generictrainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText

	text "As #mon grow"
	line "stronger, so does"
	cont "the trainer."

	para "No, wait. As the"
	line "trainer grows"

	para "stronger, so do"
	line "the #mon."
	done

GenericTrainerSageTroy:
	generictrainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText

	text "It is not far to"
	line "the Elder."
	done

GenericTrainerSageNeal:
	generictrainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText

	text "Let there be light"
	line "on your journey."
	done

SproutTower3FPlayerApproachesRivalMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

SproutTower3FRivalLeavesElderMovement:
	step_right
	step_down
	step_end

SproutTowerElderLecturesRivalText:
	text "Elder: You are in-"
	line "deed skilled as a"
	cont "trainer."

	para "As promised, here"
	line "is your TM."

	para "But let me say"
	line "this: You should"

	para "treat your"
	line "#mon better."

	para "The way you battle"
	line "is far too harsh."

	para "#mon are not"
	line "tools of war…"
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "..."
	line "...Pfeuh!"

	para "On l'appelle"
	line "l'ancien mais il"
	cont "est super nul!"

	para "Et il raconte"
	line "n'importe quoi..."

	para "Je ne me ferai"
	line "jamais battre par"

	para "un crétin qui"
	line "conseille d'être"

	para "gentil avec les"
	line "#mon."

	para "Seuls les #mon"
	line "puissants sont"
	cont "importants."

	para "Je me contrefiche"
	line "des #mon mi-"
	cont "gnons et faibles."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> utilise"
	line "une Corde sortie!"
	done

SageLiSeenText:
	text "Bienvenue à toi,"
	line "mon poussin!"

	para "La Tour Chetiflor"
	line "est un lieu"
	cont "d'entraînement."

	para "Humains et #mon"
	line "y renforcent leurs"

	para "liens pour des"
	line "lendemains qui"
	cont "chantent."

	para "Je serai ton"
	line "adversaire final."

	para "Permets-moi de"
	line "mettre à l'épreuve"

	para "ton amitié envers"
	line "tes #mon!"
	done

SageLiBeatenText:
	text "Ah, excellent!"
	done

SageLiTakeThisFlashText:
	text "You and your #-"
	line "mon should have"

	para "no problem using"
	line "this move."

	para "Take this Flash"
	line "TM."
	done

SageLiAfterBattleText:
	text "Va, vole et"
	line "apprends la vie"
	cont "grâce aux #mon."
	done

SageJinSeenText:
	text "Je m'entraîne pour"
	line "trouver la voie du"
	cont "#mon!"
	done

SageJinBeatenText:
	text "Mon entraînement"
	line "est insuffisant."
	done

SageTroySeenText:
	text "Montre-moi à quel"
	line "point tu fais"
	cont "confiance à tes"
	cont "#mon."
	done

SageTroyBeatenText:
	text "Ta confiance est"
	line "totale! Bien!"
	done

SageNealSeenText:
	text "The Elder's TM"
	line "lights even pitch-"
	cont "black darkness."
	done

SageNealBeatenText:
	text "J'en ai pris plein"
	line "la tête!"
	done

SproutTower3FPaintingText:
	text "Une belle peinture"
	line "d'un majestueux"
	cont "Chetiflor."
	done

SproutTower3FStatueText:
	text "Une statue de"
	line "#mon..."

	para "Ça a l'air cher"
	line "et raffiné."
	done
