FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SSAquaGranddaughterHadFunText, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND

	object_const_def
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2

SSAquaCaptain:
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptextfaceplayer SSAquaCaptainHowDoYouLikeText
	jumpthistextfaceplayer

	text "Whew! Thanks for"
	line "coming along."

	para "Keeping that lit-"
	line "tle girl amused"
	cont "was exhausting."
	done

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	showtext SSAquaGranddaughterCaptainPlayWithMeText
	showtextfaceplayer SSAquaGranddaughterHasToFindGrandpaText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	callasm DisableDynPalUpdates
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, SSAquaCaptainsCabinWarpsToGrandpasCabinMovement
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	loadmem wObject1Palette, 1
	callasm SetBlackObjectPals
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	callasm FadeInPalettes_EnableDynNoApply
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, SSAquaGranddaughterEntersCabinMovement
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	showtext SSAquaGranddaughterWasPlayingText
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applyonemovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, step_down
	opentext
	writetext SSAquaEntertainedGranddaughterText
	promptbutton
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	sjumpfwd SSAquaMachoBraceAndDocking

SSAquaGrandpa:
	checkevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	iftrue_jumptextfaceplayer SSAquaGrandpaTravellingText
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftruefwd SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	end

SSAquaMachoBraceAndDocking:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem MACHO_BRACE
	iffalsefwd .FailedMachoBrace
	setevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	sjumpfwd .ContinueDocking
.FailedMachoBrace:
	writetext .NoRoomForMachoBrace
	waitbutton
.ContinueDocking:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	endtext

.NoRoomForMachoBrace:
	text "But you can't carry"
	line "it! I'll keep it"
	cont "for another trip."
	done

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem MACHO_BRACE
	iffalse_endtext
	setevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	endtext

GenericTrainerPokefanmColin:
	generictrainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText

	text "You're traveling"
	line "all alone?"

	para "Isn't your mom"
	line "worried?"
	done

GenericTrainerTwinsMegandpeg1:
	generictrainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText

	text "Baby is a rude"
	line "name to call us"
	cont "girls!"
	done

GenericTrainerTwinsMegandpeg2:
	generictrainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText

	text "Sometimes, kids"
	line "are smarter than"
	cont "grown-ups!"
	done

GenericTrainerPsychicRodney:
	generictrainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText

	text "I get it. You can"
	line "hear Johto's radio"
	cont "on the Fast Ship."
	done

GenericTrainerPokefanmJeremy:
	generictrainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText

	text "I must go to the"
	line "#mon Salon and"
	cont "fix them up nice!"
	done

GenericTrainerPokefanfGeorgia:
	generictrainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText

	text "Oh, yes! I have to"
	line "get my #mon out"
	cont "of Day-Care!"
	done

GenericTrainerSupernerdShawn:
	generictrainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText

	text "You should use the"
	line "right Balls to fit"
	cont "the situation."
	done

SSAquaCaptainsCabinWarpsToGrandpasCabinMovement:
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

SSAquaGranddaughterEntersCabinMovement:
	step_up
	step_up
	turn_head_left
	step_end


SSAquaCaptainHowDoYouLikeText:
	text "Tu aimes bien"
	line "l'Aquaria?"

	para "Il vole sur les"
	line "vagues..."
	done

SSAquaCantFindGranddaughterText:
	text "Oh, bonjour..."

	para "Je ne trouve tou-"
	line "jours pas ma"
	cont "petite-fille."

	para "Elle peut être"
	line "assez soûlante,"

	para "j'espère qu'elle"
	line "n'embête personne."
	done

SSAquaEntertainedGranddaughterText:
	text "<PLAYER>, c'est ça?"
	line "On m'a dit que tu"
	cont "as pris soin de ma"
	cont "petite-fille."

	para "Je tiens à te"
	line "remercier."
	done

SSAquaGrandpaHaveThisText:
	text "Je tiens à ce que"
	line "tu acceptes ceci!"
	done

SSAquaGrandpaTravellingText:
	text "Nous voyageons"
	line "autour du monde."
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "Hé Capitaine! Tu"
	line "joues avec moi?"

	para "Vazy steuplait!"
	line "Vazy m'sieur!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "Tu viens jouer"
	line "avec moi?"

	para "...Oh!"

	para "Pépé s'inquiète"
	line "pour moi?"

	para "J'y vais!"

	para "J'dois trouver mon"
	line "p'tit pépé!"
	done

SSAquaGranddaughterWasPlayingText:
	text "Grandpa, here I"
	line "am! I was playing"

	para "with the Captain"
	line "and this big kid!"
	done

SSAquaGranddaughterHadFunText:
	text "Je me suis"
	line "super amusée!"
	done

PokefanmColinSeenText:
	text "Toi! Veux-tu te"
	line "battre avec moi?"
	done

PokefanmColinBeatenText:
	text "T'es balèze!"
	done

TwinsMegandpeg1SeenText:
	text "Tu me prends pour"
	line "un bébé?"
	cont "Ouiiiin!"
	done

TwinsMegandpeg1BeatenText:
	text "Oh! Perdu!"
	done

TwinsMegandpeg2SeenText:
	text "On n'est pas des"
	line "bébés mais des"
	cont "belles dames!"
	done

TwinsMegandpeg2BeatenText:
	text "Oh! Perdu!"
	done

PsychicRodneySeenText:
	text "Silence! Mon cer-"
	line "veau capte un"
	cont "signal radio!"
	done

PsychicRodneyBeatenText:
	text "... J'entends"
	line "quelque chose!"
	done

PokefanmJeremySeenText:
	text "Qu'en penses-tu?"
	line "Mes #mon sont"
	cont "beaux, non?"
	done

PokefanmJeremyBeatenText:
	text "Oh, non! Mes beaux"
	line "#mon!"
	done

PokefanfGeorgiaSeenText:
	text "Je vais faire mes"
	line "courses au grand"
	cont "Magasin et puis..."
	done

PokefanfGeorgiaBeatenText:
	text "Qu'est-ce que je"
	line "devais faire?"
	done

SupernerdShawnSeenText:
	text "Quels types de"
	line "# Balls as-tu"
	cont "sur toi?"
	done

SupernerdShawnBeatenText:
	text "Attends! Stop!"
	line "Pitié!"
	done

SSAquaHasArrivedVermilionText:
	text "Le bateau Express"
	line "Aquaria est arrivé"
	cont "à Carmin sur mer."
	done
