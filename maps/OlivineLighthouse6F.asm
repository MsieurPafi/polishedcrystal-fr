OlivineLighthouse6F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_5F, 1
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_5F, 6
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_5F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  8, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseJasmine, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event  9,  8, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, AMPHAROS, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, OlivineLighthouseAmphy, -1
	itemball_event  3,  4, WIDE_LENS, 1, EVENT_OLIVINE_LIGHTHOUSE_6F_WIDE_LENS

	object_const_def
	const OLIVINELIGHTHOUSE6F_JASMINE
	const OLIVINELIGHTHOUSE6F_AMPHAROS

OlivineLighthouseJasmine:
	faceplayer
	opentext
	checkkeyitem SECRETPOTION
	iftruefwd .BroughtSecretpotion
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iftruefwd .ExplainedSickness
	writetext JasmineCianwoodPharmacyText
	promptbutton
	setevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
.ExplainedSickness:
	jumpthisopenedtext

	text "…May I ask you to"
	line "get some medicine"
	cont "for me? Please?"
	done

.BroughtSecretpotion:
	writetext JasmineCureAmphyText
	yesorno
	iffalsefwd .Refused
	writetext PlayerHandedSecretpotionText
	promptbutton
	takekeyitem SECRETPOTION
	writetext JasmineDontBeOffendedText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	opentext
	playmusic MUSIC_HEAL
	writetext JasmineAmphyHowAreYouFeelingText
	pause 60
	promptbutton
	closetext
	special RestartMapMusic
	cry AMPHAROS
	special FadeOutPalettes
	special LoadMapPalettes
	pause 10
	special FadeInPalettes_EnableDynNoApply
	showtext AmphyPaluPaluluText
	showemote EMOTE_BOLT, OLIVINELIGHTHOUSE6F_AMPHAROS, 15
	setlasttalked OLIVINELIGHTHOUSE6F_JASMINE
	showtextfaceplayer JasmineThankYouText
	setevent EVENT_JASMINE_RETURNED_TO_GYM
	clearevent EVENT_OLIVINE_GYM_JASMINE
	readvar VAR_FACING
	ifequalfwd DOWN, .FacingDown
	ifequalfwd RIGHT, .FacingRight
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesUpMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingDown:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesDownMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingRight:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesRightMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.Refused:
	writetext JasmineISeeText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	jumpthistext

	text "…Amphy, hang on!"
	done

OlivineLighthouseAmphy:
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftruefwd .HealthyNow
	faceplayer
	opentext
	writetext AmphyPalPalooText
	setmonval AMPHAROS
	special PlaySlowCry
	promptbutton
	jumpthisopenedtext

	text "Its breathing is"
	line "terribly labored…"
	done

.HealthyNow:
	showcrytext AmphyPaluPaluluText, AMPHAROS
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInPalettes_EnableDynNoApply
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInPalettes_EnableDynNoApply
	end

OlivineLighthouseJasmineLeavesUpMovement:
	slow_step_up
	slow_step_up
	slow_step_right
	slow_step_up
	slow_step_up
	step_sleep_8
	step_sleep_8
	step_end

OlivineLighthouseJasmineLeavesDownMovement:
	slow_step_down
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_up
	slow_step_right
	slow_step_right
	slow_step_right
	step_end

OlivineLighthouseJasmineLeavesRightMovement:
	slow_step_up
	slow_step_up
	slow_step_right
	slow_step_up
	slow_step_up
	slow_step_up
	step_sleep_8
	step_end

JasmineCianwoodPharmacyText:
	text "Jasmine: …This"
	line "#mon always"

	para "kept the sea lit"
	line "at night."

	para "…But it suddenly"
	line "got sick… It's"
	cont "gasping for air…"

	para "…I understand"
	line "that there is a"

	para "wonderful Pharmacy"
	line "in Cianwood…"

	para "But that's across"
	line "the sea…"

	para "And I can't leave"
	line "Amphy unattended…"
	done


JasmineCureAmphyText:
	text "Jasmine: ...Ce mé-"
	line "dicament va-t-il"
	cont "soigner Phary?"
	done

PlayerHandedSecretpotionText:
	text "<PLAYER> donne"
	line "la Potionsecret à"
	cont "Jasmine."
	done

JasmineDontBeOffendedText:
	text "Jasmine: Heu..."
	line "Le prends pas mal"
	cont "mais..."

	para "Phary n'accepte"
	line "que ce que je lui"
	cont "donne..."
	done

JasmineAmphyHowAreYouFeelingText:
	text "Jasmine: ..."

	para "Phary, comment te"
	line "sens-tu?"
	done

JasmineThankYouText:
	text "Jasmine: Oh, je"
	line "suis si soulagée!"

	para "C'est... C'est"
	line "fantastique..."

	para "Merci beaucoup,"
	line "mon poussin."

	para "Je vais retourner"
	line "à l'Arene..."
	done

JasmineISeeText:
	text "Jasmine: Je vois."
	done


AmphyPalPalooText:
	text "Phary: ..."
	line "...Pha! Phaaa..."
	done


AmphyPaluPaluluText:
	text "Phary: Phapha!"
	line "Phaaaaaa!"
	done
