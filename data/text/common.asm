SECTION "_FruitBearingTreeText", ROMX
_FruitBearingTreeText::
	text "C'est un arbre à"
	line "fruits."
	done

SECTION "_HeyItsFruitText", ROMX
_HeyItsFruitText::
	text "Hey! It's"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedOneFruitText", ROMX
_ObtainedOneFruitText::
	text "Obtained a"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedTwoFruitText", ROMX
_ObtainedTwoFruitText::
	text "Obtained two"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedThreeFruitText", ROMX
_ObtainedThreeFruitText::
	text "Obtained three"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_FruitPackIsFullText", ROMX
_FruitPackIsFullText::
	text "But the Bag is"
	line "full…"
	done

SECTION "_NoApricornBoxText", ROMX
_NoApricornBoxText::
	text "But there's nothing"
	line "to put it in…"
	done

SECTION "_ApricornBoxIsFullText", ROMX
_ApricornBoxIsFullText::
	text "But the Apricorn"
	line "Box is full…"
	done

SECTION "_PutAwayTheApricornText", ROMX
_PutAwayTheApricornText::
	text "<PLAYER> put the"
	line ""
	text_ram wStringBuffer3
	text " in"
	cont "the Apricorn Box."
	done

SECTION "_NothingHereText", ROMX
_NothingHereText::
	text "Il n'y a rien"
	line "ici..."
	done

SECTION "_WantToUseMulchText", ROMX
_WantToUseMulchText::
	text "Want to use"
	line "Mulch?"
	done

SECTION "_UsedMulchText", ROMX
_UsedMulchText::
	text "<PLAYER> used"
	line "Mulch!"

	para "The tree was"
	line "fertilized!"
	done

SECTION "_WhichApricornText", ROMX
_WhichApricornText::
	text "Quel Noigrume"
	line "dois-je utiliser?"
	done

SECTION "_HowManyShouldIMakeText", ROMX
_HowManyShouldIMakeText::
	text "Combien dois-je"
	line "en créer?"
	done

SECTION "_HowManyDoYouWantToSellText", ROMX
_HowManyDoYouWantToSellText::
	text "How many do you"
	line "want to sell?"
	done

SECTION "_RecoveredSomeHPText", ROMX
_RecoveredSomeHPText::
	text_ram wStringBuffer1
	line "recovered "
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "HP!"
	done

SECTION "_CuredOfPoisonText", ROMX
_CuredOfPoisonText::
	text_ram wStringBuffer1
	text "'s"
	line "cured of poison."
	done

SECTION "_RidOfParalysisText", ROMX
_RidOfParalysisText::
	text_ram wStringBuffer1
	text "'s"
	line "rid of paralysis."
	done

SECTION "_BurnWasHealedText", ROMX
_BurnWasHealedText::
	text_ram wStringBuffer1
	text "'s"
	line "burn was healed."
	done

SECTION "_WasDefrostedText", ROMX
_WasDefrostedText::
	text_ram wStringBuffer1
	line "was defrosted."
	done

SECTION "_WokeUpText", ROMX
_WokeUpText::
	text_ram wStringBuffer1
	line "woke up."
	done

SECTION "_HealthReturnedText", ROMX
_HealthReturnedText::
	text_ram wStringBuffer1
	text "'s"
	line "health returned."
	done

SECTION "_RevitalizedText", ROMX
_RevitalizedText::
	text_ram wStringBuffer1
	line "is revitalized."
	done

SECTION "_GrewToLevelText", ROMX
_GrewToLevelText::
	text_ram wStringBuffer1
	text " grew to"
	line "level "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end

SECTION "_CameToItsSensesText", ROMX
_CameToItsSensesText::
	text_ram wStringBuffer1
	text " came"
	line "to its senses."
	done

SECTION "_OakTimeWokeUpText", ROMX
_OakTimeWokeUpText::
	text "………………………………"
	line "………………………………"

	para "Zzz...Hm? Quoi...?"
	line "Tu m'as réveillé!"

	para "Mais quelle heure"
	line "est-il?"
	prompt

SECTION "_OakTimeWhatTimeIsItText", ROMX
_OakTimeWhatTimeIsItText::
	text "Quelle heure"
	line "est-il?"
	done

SECTION "_OakTimeHowManyMinutesText", ROMX
_OakTimeHowManyMinutesText::
	text "Combien de"
	line "minutes?"
	done

SECTION "_OakTimeWhoaText", ROMX
_OakTimeWhoaText::
	text "Whoa!"
	done

SECTION "_OakTimeQuestionMarkText", ROMX
_OakTimeQuestionMarkText::
	text "?"
	done

SECTION "_OakTimeOversleptText", ROMX
_OakTimeOversleptText::
	text "!"
	line "J'suis en retard!"
	done

SECTION "_OakTimeYikesText", ROMX
_OakTimeYikesText::
	text "!"
	line "Non! J'suis en"
	cont "retard!"
	done

SECTION "ProfElmNappedText", ROMX
ProfElmNappedText::
	text "!"
	line "I napped for"
	cont "too long!"
	done

SECTION "_OakTimeSoDarkText", ROMX
_OakTimeSoDarkText::
	text "!"
	line "C'est normal qu'il"
	cont "fasse nuit!"
	done

SECTION "_OakTimeWhatDayIsItText", ROMX
_OakTimeWhatDayIsItText::
	text "Quel jour?"
	done

SECTION "_OakTimeIsItText", ROMX
_OakTimeIsItText::
	text "?"
	done

SECTION "_NothingToChooseText", ROMX
_NothingToChooseText::
	text "Il n'y a rien"
	line "à choisir."
	prompt

SECTION "_WhichSidePutOnText", ROMX
_WhichSidePutOnText::
	text "Mettre de quel"
	line "côté?"
	done

SECTION "_WhichSidePutAwayText", ROMX
_WhichSidePutAwayText::
	text "Ranger de quel"
	line "côté?"
	done

SECTION "_PutAwayTheDecoText", ROMX
_PutAwayTheDecoText::
	text "Put away the"
	line ""
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_NothingToPutAwayText", ROMX
_NothingToPutAwayText::
	text "Il n'y a rien"
	line "à ranger."
	prompt

SECTION "_SetUpTheDecoText", ROMX
_SetUpTheDecoText::
	text "Set up the"
	line ""
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_PutAwayAndSetUpText", ROMX
_PutAwayAndSetUpText::
	text "Put away the"
	line ""
	text_ram wStringBuffer3

	para "and set up the"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

SECTION "_AlreadySetUpText", ROMX
_AlreadySetUpText::
	text "C'est déjà"
	line "installé."
	prompt

SECTION "_LookTownMapText", ROMX
_LookTownMapText::
	text "C'est la carte."
	done

SECTION "_LookPikachuPosterText", ROMX
_LookPikachuPosterText::
	text "C'est un poster du"
	line "mignon Pikachu."
	done

SECTION "_LookClefairyPosterText", ROMX
_LookClefairyPosterText::
	text "C'est un poster du"
	line "mignon Melofee."
	done

SECTION "_LookJigglypuffPosterText", ROMX
_LookJigglypuffPosterText::
	text "It's a poster of a"
	line "cute Marill."
	done

SECTION "_LookAdorableDecoText", ROMX
_LookAdorableDecoText::
	text "It's an adorable"
	line ""
	text_ram wStringBuffer3
	text "."
	done

SECTION "DecoConsoleText", ROMX
DecoConsoleText::
	text "It's a shiny"
	line ""
	text_ram wStringBuffer3
	text "."
	done

SECTION "_LookGiantDecoText", ROMX
_LookGiantDecoText::
	text "Une poupée géante!"
	line "C'est super doux."
	done

SECTION "_MomHiHowAreYouText", ROMX
_MomHiHowAreYouText::
	text "Salut, <PLAYER>!"
	line "Ça va bien?"
	prompt

SECTION "_MomFoundAnItemText", ROMX
_MomFoundAnItemText::
	text "J'ai trouvé un bel"
	line "objet à acheter..."
	prompt

SECTION "_MomBoughtWithYourMoneyText", ROMX
_MomBoughtWithYourMoneyText::
	text "Alors j'ai dépensé"
	line "tes sous. Désolée!"
	prompt

SECTION "_MomItsInPCText", ROMX
_MomItsInPCText::
	text "C'est dans ton PC."
	line "Ça va te plaire!"
	done

SECTION "_MomFoundADollText", ROMX
_MomFoundADollText::
	text "En faisant les"
	line "courses j'ai vu"
	cont "cette superbe"
	cont "poupée, alors..."
	prompt

SECTION "_MomItsInYourRoomText", ROMX
_MomItsInYourRoomText::
	text "Elle est dans ta"
	line "chambre!"
	done

SECTION "_MonWasSentToText", ROMX
_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " was"
	line "sent to "
	text_ram wOTTrademonSenderName
	text "."
	done

SECTION "_BidsFarewellToMonText", ROMX
_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " bids"
	line "farewell to"
	done

SECTION "_MonNameBidsFarewellText", ROMX
_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_TakeGoodCareOfMonText", ROMX
_TakeGoodCareOfMonText::
	text "Take good care of"
	line ""
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_ForYourMonSendsText", ROMX
_ForYourMonSendsText::
	text "For "
	text_ram wPlayerTrademonSenderName
	text "'s"
	line ""
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

SECTION "_OTSendsText", ROMX
_OTSendsText::
	text_ram wOTTrademonSenderName
	text " sends"
	line ""
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_WillTradeText", ROMX
_WillTradeText::
	text_ram wOTTrademonSenderName
	text " will"
	line "trade "
	text_ram wOTTrademonSpeciesName
	text_end

SECTION "_ForYourMonWillTradeText", ROMX
_ForYourMonWillTradeText::
	text "for "
	text_ram wPlayerTrademonSenderName
	text "'s"
	line ""
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

; Oak's Pokémon Talk

SECTION "_OPT_IntroText1", ROMX
_OPT_IntroText1::
	line "Mary: Prof.Oak's"
	done

SECTION "_OPT_IntroText2", ROMX
_OPT_IntroText2::
	line "#mon Talk!"
	done

SECTION "_OPT_IntroText3", ROMX
_OPT_IntroText3::
	line "With me, Mary!"
	done

SECTION "_OPT_OakText1", ROMX
_OPT_OakText1::
	line "Oak: "
	text_ram wMonOrItemNameBuffer
	done

SECTION "_OPT_OakText2", ROMX
_OPT_OakText2::
	line "may be seen around"
	done

SECTION "_OPT_OakText3", ROMX
_OPT_OakText3::
	line ""
	text_ram wStringBuffer1
	text "."
	done

SECTION "_OPT_MaryText1", ROMX
_OPT_MaryText1::
	line "Mary: "
	text_ram wStringBuffer1
	text "'s"
	done

SECTION "OPT_SweetAdorably", ROMX
OPT_SweetAdorably::
	line "sweet and adorably"
	done

SECTION "OPT_WigglySlickly", ROMX
OPT_WigglySlickly::
	line "wiggly and slickly"
	done

SECTION "OPT_AptlyNamed", ROMX
OPT_AptlyNamed::
	line "aptly named and"
	done

SECTION "OPT_UndeniablyKindOf", ROMX
OPT_UndeniablyKindOf::
	line "undeniably kind of"
	done

SECTION "OPT_Unbearably", ROMX
OPT_Unbearably::
	line "so, so unbearably"
	done

SECTION "OPT_WowImpressively", ROMX
OPT_WowImpressively::
	line "wow, impressively"
	done

SECTION "OPT_AlmostPoisonously", ROMX
OPT_AlmostPoisonously::
	line "almost poisonously"
	done

SECTION "OPT_Sensually", ROMX
OPT_Sensually::
	line "ooh, so sensually"
	done

SECTION "OPT_Mischievously", ROMX
OPT_Mischievously::
	line "so mischievously"
	done

SECTION "OPT_Topically", ROMX
OPT_Topically::
	line "so very topically"
	done

SECTION "OPT_Addictively", ROMX
OPT_Addictively::
	line "sure addictively"
	done

SECTION "OPT_LooksInWater", ROMX
OPT_LooksInWater::
	line "looks in water is"
	done

SECTION "OPT_EvolutionMustBe", ROMX
OPT_EvolutionMustBe::
	line "evolution must be"
	done

SECTION "OPT_Provocatively", ROMX
OPT_Provocatively::
	line "provocatively"
	done

SECTION "OPT_FlippedOut", ROMX
OPT_FlippedOut::
	line "so flipped out and"
	done

SECTION "OPT_HeartMeltingly", ROMX
OPT_HeartMeltingly::
	line "heart-meltingly"
	done

SECTION "OPT_Cute", ROMX
OPT_Cute::
	line "cute."
	done

SECTION "OPT_Weird", ROMX
OPT_Weird::
	line "weird."
	done

SECTION "OPT_Pleasant", ROMX
OPT_Pleasant::
	line "pleasant."
	done

SECTION "OPT_BoldSortOf", ROMX
OPT_BoldSortOf::
	line "bold, sort of."
	done

SECTION "OPT_Frightening", ROMX
OPT_Frightening::
	line "frightening."
	done

SECTION "OPT_SuaveDebonair", ROMX
OPT_SuaveDebonair::
	line "suave & debonair!"
	done

SECTION "OPT_Powerful", ROMX
OPT_Powerful::
	line "powerful."
	done

SECTION "OPT_Exciting", ROMX
OPT_Exciting::
	line "exciting."
	done

SECTION "OPT_Groovy", ROMX
OPT_Groovy::
	line "groovy!"
	done

SECTION "OPT_Inspiring", ROMX
OPT_Inspiring::
	line "inspiring."
	done

SECTION "OPT_Friendly", ROMX
OPT_Friendly::
	line "friendly."
	done

SECTION "OPT_HotHotHot", ROMX
OPT_HotHotHot::
	line "hot, hot, hot!"
	done

SECTION "OPT_Stimulating", ROMX
OPT_Stimulating::
	line "stimulating."
	done

SECTION "OPT_Guarded", ROMX
OPT_Guarded::
	line "guarded."
	done

SECTION "OPT_Lovely", ROMX
OPT_Lovely::
	line "lovely."
	done

SECTION "OPT_Speedy", ROMX
OPT_Speedy::
	line "speedy."
	done

SECTION "_OPT_PokemonChannelText", ROMX
_OPT_PokemonChannelText::
	text "#mon"
	done

; Pokémon Music Channel / Pokémusic

SECTION "_BenIntroText1", ROMX
_BenIntroText1::
	line "Ben: #mon Music"
	done

SECTION "_BenIntroText2", ROMX
_BenIntroText2::
	line "Channel! ♪"
	done

SECTION "_BenIntroText3", ROMX
_BenIntroText3::
	line "It's me, DJ Ben! ♪"
	done

SECTION "_FernIntroText1", ROMX
_FernIntroText1::
	line "Fern: #music! ♪"
	done

SECTION "_FernIntroText2", ROMX
_FernIntroText2::
	line "With DJ Fern! ♪"
	done

SECTION "_BenFernText1", ROMX
_BenFernText1::
	line "Today's "
	text_today
	text ","
	done

SECTION "_BenFernText2A", ROMX
_BenFernText2A::
	line "so let's jam to"
	done

SECTION "_BenFernText2B", ROMX
_BenFernText2B::
	line "so chill out to"
	done

SECTION "_BenFernText3A", ROMX
_BenFernText3A::
	line "#mon March!"
	done

SECTION "_BenFernText3B", ROMX
_BenFernText3B::
	line "#mon Lullaby!"
	done

; Lucky Channel

SECTION "_LC_Text1", ROMX
_LC_Text1::
	line "Reed: Yeehaw! How"
	done

SECTION "_LC_Text2", ROMX
_LC_Text2::
	line "y'all doin' now?"
	done

SECTION "_LC_Text3", ROMX
_LC_Text3::
	line "Whether you're up"
	done

SECTION "_LC_Text4", ROMX
_LC_Text4::
	line "or way down low,"
	done

SECTION "_LC_Text5", ROMX
_LC_Text5::
	line "don't you miss the"
	done

SECTION "_LC_Text6", ROMX
_LC_Text6::
	line "Lucky Number Show!"
	done

SECTION "_LC_Text7", ROMX
_LC_Text7::
	line "Today's Lucky"
	done

SECTION "_LC_Text8", ROMX
_LC_Text8::
	line "Number is "
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_LC_Text9", ROMX
_LC_Text9::
	line "I'll repeat that!"
	done

SECTION "_LC_Text10", ROMX
_LC_Text10::
	line "Match it and go to"
	done

SECTION "_LC_Text11", ROMX
_LC_Text11::
	line "the Radio Tower!"
	done

SECTION "_LC_DragText1", ROMX
_LC_DragText1::
	line "…Repeating myself"
	done

SECTION "_LC_DragText2", ROMX
_LC_DragText2::
	line "gets to be a drag…"
	done

; Places and People

SECTION "_PnP_Text1", ROMX
_PnP_Text1::
	line "Places and People!"
	done

SECTION "_PnP_Text2", ROMX
_PnP_Text2::
	line "Brought to you by"
	done

SECTION "_PnP_Text3", ROMX
_PnP_Text3::
	line "me, DJ Lily!"
	done

SECTION "_PnP_Text4", ROMX
_PnP_Text4::
	line ""
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	done

SECTION "_PnP_cute", ROMX
_PnP_cute::
	line "is cute."
	done

SECTION "_PnP_lazy", ROMX
_PnP_lazy::
	line "is sort of lazy."
	done

SECTION "_PnP_happy", ROMX
_PnP_happy::
	line "is always happy."
	done

SECTION "_PnP_noisy", ROMX
_PnP_noisy::
	line "is quite noisy."
	done

SECTION "_PnP_precocious", ROMX
_PnP_precocious::
	line "is precocious."
	done

SECTION "_PnP_bold", ROMX
_PnP_bold::
	line "is somewhat bold."
	done

SECTION "_PnP_picky", ROMX
_PnP_picky::
	line "is too picky!"
	done

SECTION "_PnP_sortofok", ROMX
_PnP_sortofok::
	line "is sort of OK."
	done

SECTION "_PnP_soso", ROMX
_PnP_soso::
	line "is just so-so."
	done

SECTION "_PnP_great", ROMX
_PnP_great::
	line "is actually great."
	done

SECTION "_PnP_mytype", ROMX
_PnP_mytype::
	line "is just my type."
	done

SECTION "_PnP_cool", ROMX
_PnP_cool::
	line "is so cool, no?"
	done

SECTION "_PnP_inspiring", ROMX
_PnP_inspiring::
	line "is inspiring!"
	done

SECTION "_PnP_weird", ROMX
_PnP_weird::
	line "is kind of weird."
	done

SECTION "_PnP_rightforme", ROMX
_PnP_rightforme::
	line "is right for me?"
	done

SECTION "_PnP_odd", ROMX
_PnP_odd::
	line "is definitely odd!"
	done

SECTION "_PnP_Text5", ROMX
_PnP_Text5::
	line ""
	text_ram wStringBuffer1
	done

SECTION "_RocketRadioText1", ROMX
_RocketRadioText1::
	line "… …Ahem, we are"
	done

SECTION "_RocketRadioText2", ROMX
_RocketRadioText2::
	line "Team Rocket!"
	done

SECTION "_RocketRadioText3", ROMX
_RocketRadioText3::
	line "After three years"
	done

SECTION "_RocketRadioText4", ROMX
_RocketRadioText4::
	line "of preparation, we"
	done

SECTION "_RocketRadioText5", ROMX
_RocketRadioText5::
	line "have risen again"
	done

SECTION "_RocketRadioText6", ROMX
_RocketRadioText6::
	line "from the ashes!"
	done

SECTION "_RocketRadioText7", ROMX
_RocketRadioText7::
	line "Giovanni! "
	text_pause
	text "Can you"
	done

SECTION "_RocketRadioText8", ROMX
_RocketRadioText8::
	line "hear?"
	text_pause
	text " We did it!"
	done

SECTION "_RocketRadioText9", ROMX
_RocketRadioText9::
	line ""
	text_pause
	text "Where is our boss?"
	done

SECTION "_RocketRadioText10", ROMX
_RocketRadioText10::
	line ""
	text_pause
	text "Is he listening?"
	done

SECTION "_BuenaRadioText1", ROMX
_BuenaRadioText1::
	line "Buena: Buena here!"
	done

SECTION "_BuenaRadioText2", ROMX
_BuenaRadioText2::
	line "Today's password!"
	done

SECTION "_BuenaRadioText3", ROMX
_BuenaRadioText3::
	line "Let me think… It's"
	done

SECTION "_BuenaRadioText4", ROMX
_BuenaRadioText4::
	line ""
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_BuenaRadioText5", ROMX
_BuenaRadioText5::
	line "Don't forget it!"
	done

SECTION "_BuenaRadioText6", ROMX
_BuenaRadioText6::
	line "I'm in Goldenrod's"
	done

SECTION "_BuenaRadioText7", ROMX
_BuenaRadioText7::
	line "Radio Tower!"
	done

SECTION "_BuenaRadioMidnightText1", ROMX
_BuenaRadioMidnightText1::
	line "Buena: Oh my…"
	done

SECTION "_BuenaRadioMidnightText2", ROMX
_BuenaRadioMidnightText2::
	line "It's midnight! I"
	done

SECTION "_BuenaRadioMidnightText3", ROMX
_BuenaRadioMidnightText3::
	line "have to shut down!"
	done

SECTION "_BuenaRadioMidnightText4", ROMX
_BuenaRadioMidnightText4::
	line "Thanks for tuning"
	done

SECTION "_BuenaRadioMidnightText5", ROMX
_BuenaRadioMidnightText5::
	line "in to the end! But"
	done

SECTION "_BuenaRadioMidnightText6", ROMX
_BuenaRadioMidnightText6::
	line "don't stay up too"
	done

SECTION "_BuenaRadioMidnightText7", ROMX
_BuenaRadioMidnightText7::
	line "late! Presented to"
	done

SECTION "_BuenaRadioMidnightText8", ROMX
_BuenaRadioMidnightText8::
	line "you by DJ Buena!"
	done

SECTION "_BuenaRadioMidnightText9", ROMX
_BuenaRadioMidnightText9::
	text "I'm outta here!"
	done

SECTION "_BuenaRadioMidnightText10", ROMX
_BuenaRadioMidnightText10::
	text "…"
	done

SECTION "_BuenaOffTheAirText", ROMX
_BuenaOffTheAirText::
	line ""
	done

SECTION "Text_EnemyUsed", ROMX
Text_EnemyUsed::
	text "<ENEMY>"
	line "used "
	text_ram wMonOrItemNameBuffer
	text "!"
	prompt

SECTION "Text_EnemyUsedOn", ROMX
Text_EnemyUsedOn::
	text "<ENEMY>"
	line "used "
	text_ram wMonOrItemNameBuffer
	cont "on "
	text_ram wEnemyMonNickname
	text "!"
	prompt

SECTION "_AskFloorElevatorText", ROMX
_AskFloorElevatorText::
	text "Quel étage?"
	done

SECTION "_BugCatchingContestTimeUpText", ROMX
_BugCatchingContestTimeUpText::
	text "Présentateur: bip!"

	para "Temps écoulé!"
	done

SECTION "_BugCatchingContestIsOverText", ROMX
_BugCatchingContestIsOverText::
	text "Présentateur: Le"
	line "concours est fini!"
	done

SECTION "_RepelWoreOffText", ROMX
_RepelWoreOffText::
	text "Effet du repousse"
	line "terminé."
	done

SECTION "UseAnotherRepelText", ROMX
UseAnotherRepelText::
	text "Repel's effect"
	line "wore off."

	para "Use another?"
	done

SECTION "_JustSawSomeRareMonText", ROMX
_JustSawSomeRareMonText::
	text "I just saw some"
	line "rare "
	text_ram wStringBuffer1
	text " in"
	cont ""
	text_ram wStringBuffer2
	text "."

	para "I'll call you if I"
	line "see another rare"
	cont "#mon, OK?"
	prompt

SECTION "_SavingRecordText", ROMX
_SavingRecordText::
	text "sauvegarde..."
	line "ne pas Éteindre!"
	done

SECTION "_NoCoinsText", ROMX
_NoCoinsText::
	text "Vous n'avez pas de"
	line "jetons."
	prompt

SECTION "_NoCoinCaseText", ROMX
_NoCoinCaseText::
	text "Vous n'avez pas de"
	line "boîte Jeton."
	prompt

SECTION "_NPCTradeCableText", ROMX
_NPCTradeCableText::
	text "OK, connectez le"
	line "Câble Game Link."
	prompt

SECTION "Text_NPCTraded", ROMX
Text_NPCTraded::
	text "<PLAYER> traded"
	line ""
	text_ram wMonOrItemNameBuffer
	text " for"
	cont ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_NPCTradeFanfareText", ROMX
_NPCTradeFanfareText::
	text_sound SFX_DEX_FANFARE_80_109
	text_pause
	text_end

SECTION "_NPCTradeIntroText1", ROMX
_NPCTradeIntroText1::
	text "I collect #mon."
	line "Do you have"
	cont ""
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText1", ROMX
_NPCTradeCancelText1::
	text "Pas d'échange?"
	line "Maiiiiiis!!!"
	done

SECTION "_NPCTradeWrongText1", ROMX
_NPCTradeWrongText1::
	text "Huh? That's not"
	line ""
	text_ram wStringBuffer1
	text "."
	cont "What a letdown…"
	done

SECTION "_NPCTradeCompleteText1", ROMX
_NPCTradeCompleteText1::
	text "Yay! I got myself"
	line ""
	text_ram wStringBuffer1
	text "!"
	cont "Thanks!"
	done

SECTION "_NPCTradeAfterText1", ROMX
_NPCTradeAfterText1::
	text "Hi, how's my old"
	line ""
	text_ram wStringBuffer2
	text " doing?"
	done

SECTION "_NPCTradeIntroText2", ROMX
_NPCTradeIntroText2::
	text "Hi, I'm looking"
	line "for this #mon."

	para "If you have"
	line ""
	text_ram wStringBuffer1
	text ", would"

	para "you trade it for"
	line "my "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText2", ROMX
_NPCTradeCancelText2::
	text "T'en as pas non"
	line "plus?"

	para "Pfff...."
	line "Et zut..."
	done

SECTION "_NPCTradeWrongText2", ROMX
_NPCTradeWrongText2::
	text "You don't have"
	line ""
	text_ram wStringBuffer1
	text "? That's"
	cont "too bad, then."
	done

SECTION "_NPCTradeCompleteText2", ROMX
_NPCTradeCompleteText2::
	text "Great! Thank you!"

	para "I finally got"
	line ""
	text_ram wStringBuffer1
	text "."
	done

SECTION "_NPCTradeAfterText2", ROMX
_NPCTradeAfterText2::
	text "Hi! The "
	text_ram wMonOrItemNameBuffer
	line "you traded me is"
	cont "doing great!"
	done

SECTION "_NPCTradeIntroText3", ROMX
_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text "'s cute,"
	line "but I don't have"

	para "it. Do you have"
	line ""
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText3", ROMX
_NPCTradeCancelText3::
	text "Tu veux pas échan-"
	line "ger? Bah mince..."
	done

SECTION "_NPCTradeWrongText3", ROMX
_NPCTradeWrongText3::
	text "That's not"
	line ""
	text_ram wStringBuffer1
	text "."

	para "Please trade with"
	line "me if you get one."
	done

SECTION "_NPCTradeCompleteText3", ROMX
_NPCTradeCompleteText3::
	text "Wow! Thank you!"
	line "I always wanted"
	cont ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done

SECTION "_NPCTradeAfterText3", ROMX
_NPCTradeAfterText3::
	text "How is that"
	line ""
	text_ram wStringBuffer2
	text " I"
	cont "traded you doing?"

	para "Your "
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "so cute!"
	done

SECTION "_NPCTradeCompleteText4", ROMX
_NPCTradeCompleteText4::
	text "Bah alors?"
	done

SECTION "_NPCTradeAfterText4", ROMX
_NPCTradeAfterText4::
	text "Échanger c'est"
	line "trop bizarre..."

	para "J'ai beaucoup à"
	line "apprendre."
	done

SECTION "_MomLeavingText1", ROMX
_MomLeavingText1::
	text "Oh! Quel joli"
	line "#mon."

	para "Où l'as-tu trouvé?"
	line "Hein? Où ça?"

	para "........."

	para "Alors t'aimes"
	line "l'aventure, quoi."

	para "OK!"
	line "J'vais t'aider."

	para "Mais..."
	line "Que faire?"

	para "Je sais! Je vais"
	line "économiser pour"
	cont "toi."

	para "l'argent, c'est"
	line "important."

	para "Veux-tu que j'éco-"
	line "nomise pour toi?"
	done

SECTION "_MomLeavingText2", ROMX
_MomLeavingText2::
	text "OK, je vais m'oc-"
	line "cuper de tes sous."

	para ".................."
	prompt

SECTION "_MomLeavingText3", ROMX
_MomLeavingText3::
	text "Fais attention."

	para "Les #mon sont"
	line "tes amis. Il faut"
	cont "les aimer aussi."

	para "En route!"
	done

SECTION "_MomIsThisAboutYourMoneyText", ROMX
_MomIsThisAboutYourMoneyText::
	text "Bienvenue!"
	line "Tu fais des"
	cont "efforts... C'est"
	cont "dur l'aventure!"

	para "J'ai rangé ta"
	line "chambre."

	para "Est-ce à propos"
	line "de l'argent?"
	done

SECTION "_MomBankWhatDoYouWantToDoText", ROMX
_MomBankWhatDoYouWantToDoText::
	text "Que veux-tu"
	line "faire?"
	done

SECTION "_MomStoreMoneyText", ROMX
_MomStoreMoneyText::
	text "Combien veux-tu"
	line "économiser?"
	done

SECTION "_MomTakeMoneyText", ROMX
_MomTakeMoneyText::
	text "Combien veux-tu"
	line "prendre?"
	done

SECTION "_MomSaveMoneyText", ROMX
_MomSaveMoneyText::
	text "Veux-tu économiser"
	line "de l'argent?"
	done

SECTION "_MomHaventSavedThatMuchText", ROMX
_MomHaventSavedThatMuchText::
	text "Tu n'as pas écono-"
	line "misé autant."
	prompt

SECTION "_MomNotEnoughRoomInWalletText", ROMX
_MomNotEnoughRoomInWalletText::
	text "Tu ne peux en"
	line "prendre autant."
	prompt

SECTION "_MomInsufficientFundsInWalletText", ROMX
_MomInsufficientFundsInWalletText::
	text "Tu n'en as pas"
	line "autant."
	prompt

SECTION "_MomNotEnoughRoomInBankText", ROMX
_MomNotEnoughRoomInBankText::
	text "Tu ne peux en"
	line "économiser autant."
	prompt

SECTION "_MomStartSavingMoneyText", ROMX
_MomStartSavingMoneyText::
	text "OK, je vais écono-"
	line "miser ton argent."
	cont "Aie confiance!"

	para "<PLAYER>,"
	line "tiens bon!"
	done

SECTION "_MomStoredMoneyText", ROMX
_MomStoredMoneyText::
	text "Je m'occupe de tes"
	line "sous! Va!"
	done

SECTION "_MomTakenMoneyText", ROMX
_MomTakenMoneyText::
	text "<PLAYER>,"
	line "courage!"
	done

SECTION "_MomJustDoWhatYouCanText", ROMX
_MomJustDoWhatYouCanText::
	text "Fais de ton"
	line "mieux."
	done

SECTION "_DayCareManIntroText", ROMX
_DayCareManIntroText::
	text "Je m'occupe de la"
	line "Pension. Veux-tu"
	cont "que j'entraîne un"
	cont "#mon?"
	done

SECTION "_DayCareManIntroEggText", ROMX
_DayCareManIntroEggText::
	text "Je m'occupe de la"
	line "Pension. Connais-"
	cont "tu les oeufs?"

	para "J'élevais des"
	line "#mon avec"
	cont "ma femme et..."

	para "Surprise! On a"
	line "trouvé un Oeuf!"

	para "C'est super dingue"
	line "comme truc!"

	para "Alors tu veux que"
	line "j'entraîne un"
	cont "#mon?"
	done

SECTION "_DayCareLadyIntroText", ROMX
_DayCareLadyIntroText::
	text "Je suis la femme"
	line "du type qui"
	cont "s'occupe de la"
	cont "Pension."

	para "Veux-tu que"
	line "j'entraîne un"
	cont "#mon?"
	done

SECTION "_DayCareLadyIntroEggText", ROMX
_DayCareLadyIntroEggText::
	text "Je suis la femme"
	line "du type qui"
	cont "s'occupe de la"
	cont "Pension. Connais-"
	cont "tu les oeufs?"

	para "J'élevais des"
	line "#mon avec"
	cont "mon mari et..."

	para "Surprise! On a"
	line "trouvé un Oeuf!"

	para "C'est super dingue"
	line "comme truc!"

	para "Alors tu veux que"
	line "j'entraîne un"
	cont "#mon?"
	done

SECTION "_WhatShouldIRaiseText", ROMX
_WhatShouldIRaiseText::
	text "Qui veux-tu que"
	line "j'entraîne?"
	prompt

SECTION "_OnlyOneMonText", ROMX
_OnlyOneMonText::
	text "Oh? Mais tu n'as"
	line "qu'un #mon."
	prompt

SECTION "_CantAcceptEggText", ROMX
_CantAcceptEggText::
	text "Ah... Je n'accepte"
	line "pas les oeufs."
	prompt

SECTION "_RemoveMailText", ROMX
_RemoveMailText::
	text "Enlève les Lettres"
	line "avant de me voir."
	prompt

SECTION "_LastHealthyMonText", ROMX
_LastHealthyMonText::
	text "Si tu me le donnes"
	line "qui va combattre"
	cont "pour toi?"
	prompt

SECTION "_IllRaiseYourMonText", ROMX
_IllRaiseYourMonText::
	text "OK. I'll raise"
	line "your "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_ComeBackLaterText", ROMX
_ComeBackLaterText::
	text "Reviens le prendre"
	line "plus tard."
	done

SECTION "_AreWeGeniusesText", ROMX
_AreWeGeniusesText::
	text "Are we geniuses or"
	line "what? Want to see"
	cont "your "
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_YourMonHasGrownText", ROMX
_YourMonHasGrownText::
	text "Your "
	text_ram wStringBuffer1
	line "has grown a lot."

	para "Its level grew"
	line "by "
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "If you want your"
	line "#mon back, it"
	cont "will cost ¥"
	text_decimal wStringBuffer2 + 2, 3, 5
	text "."
	done

SECTION "_PerfectHeresYourMonText", ROMX
_PerfectHeresYourMonText::
	text "Parfait! Voilà"
	line "ton #mon."
	prompt

SECTION "_GotBackMonText", ROMX
_GotBackMonText::
	text "<PLAYER> got back"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BackAlreadyText", ROMX
_BackAlreadyText::
	text "Huh? Back already?"
	line "Your "
	text_ram wStringBuffer1

	para "needs a little"
	line "more time with us."

	para "If you want your"
	line "#mon back, it"
	cont "will cost ¥100."
	done

SECTION "_HaveNoRoomText", ROMX
_HaveNoRoomText::
	text "Tu n'as pas de"
	line "place."
	prompt

SECTION "_NotEnoughMoneyText", ROMX
_NotEnoughMoneyText::
	text "Tu n'as pas assez"
	line "d'argent."
	prompt

SECTION "_OhFineThenText", ROMX
_OhFineThenText::
	text "Très bien."
	prompt

SECTION "_ComeAgainText", ROMX
_ComeAgainText::
	text "A bientôt."
	done

SECTION "_NotYetText", ROMX
_NotYetText::
	text "Pas encore..."
	done

SECTION "_FoundAnEggAgainText", ROMX
_FoundAnEggAgainText::
	text "Ah, it's you!"

	para "Your #mon had"
	line "another Egg!"

	para "You want it?"
	done

SECTION "_FoundAnEggText", ROMX
_FoundAnEggText::
	text "Ah, c'est toi!"

	para "On entraînait ton"
	line "#mon, et..."
	cont "Surprise totale!"

	para "Ton #mon a"
	line "pondu un Oeuf!"

	para "On sait pas trop"
	line "comment mais..."

	para "Il est là en tout"
	line "cas. Tu le veux?"
	done

SECTION "_ReceivedEggText", ROMX
_ReceivedEggText::
	text "<PLAYER> reçoit"
	line "l'Oeuf!"
	done

SECTION "_TakeGoodCareOfEggText", ROMX
_TakeGoodCareOfEggText::
	text "Prends-en soin!"
	done

SECTION "_IllKeepItThanksText", ROMX
_IllKeepItThanksText::
	text "Bon ben..."
	line "J'le garde. Merci!"
	done

SECTION "_NoRoomForEggText", ROMX
_NoRoomForEggText::
	text "You have no room"
	line "in your party"
	cont "or your Box."
	cont "Come back later."
	done

SECTION "_NameRaterHelloText", ROMX
_NameRaterHelloText::
	text "B'jour! Je suis le"
	line "Specialiste des"

	para "noms. Je donne mon"
	line "avis sur les noms"
	cont "des #mon."

	para "Veux-tu que je te"
	line "donne mon avis sur"
	cont "tes noms?"
	done

SECTION "_NameRaterWhichMonText", ROMX
_NameRaterWhichMonText::
	text "Le nom de quel"
	line "#mon veux-tu"
	cont "que j'étudie?"
	prompt

SECTION "_NameRaterBetterNameText", ROMX
_NameRaterBetterNameText::
	text "Hm… "
	text_ram wStringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, how about a"
	line "slightly better"
	cont "nickname?"

	para "Want me to give it"
	line "a better name?"
	done

SECTION "_NameRaterWhatNameText", ROMX
_NameRaterWhatNameText::
	text "OK. Comment"
	line "allons-nous le"
	cont "nommer?"
	prompt

SECTION "_NameRaterFinishedText", ROMX
_NameRaterFinishedText::
	text "C'est bien mieux"
	line "qu'avant!"

	para "Bien joué!"
	done

SECTION "_NameRaterComeAgainText", ROMX
_NameRaterComeAgainText::
	text "OK. Reviens une"
	line "autre fois."
	done

SECTION "_NameRaterPerfectNameText", ROMX
_NameRaterPerfectNameText::
	text "Hm… "
	text_ram wStringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat "
	text_ram wStringBuffer1
	line "with loving care."
	done

SECTION "_NameRaterEggText", ROMX
_NameRaterEggText::
	text "Whoa! C'est juste"
	line "un Oeuf."
	done

SECTION "_NameRaterSameNameText", ROMX
_NameRaterSameNameText::
	text "Ça ressemble un"
	line "peu à l'ancien..."

	para "Mais c'est mieux"
	line "qu'avant!"

	para "Bien joué!"
	done

SECTION "_NameRaterNamedText", ROMX
_NameRaterNamedText::
	text "All right. This"
	line "#mon is now"
	cont "named "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "Text_Gained", ROMX
Text_Gained::
	text_ram wStringBuffer1
	text " gained@"
	text_end

SECTION "Text_ABoostedStringBuffer2ExpPoints", ROMX
Text_ABoostedStringBuffer2ExpPoints::
	line "a boosted"
	cont ""
	text_decimal wStringBuffer2, 3, 6
	text " Exp.Points!"
	prompt

SECTION "Text_StringBuffer2ExpPoints", ROMX
Text_StringBuffer2ExpPoints::
	line ""
	text_decimal wStringBuffer2, 3, 6
	text " Exp.Points!"
	prompt

SECTION "Text_GoPkmn", ROMX
Text_GoPkmn::
	text "Go! @"
	text_end

SECTION "Text_DoItPkmn", ROMX
Text_DoItPkmn::
	text "Do it! @"
	text_end

SECTION "Text_GoForItPkmn", ROMX
Text_GoForItPkmn::
	text "Go for it,"
	line "@"
	text_end

SECTION "Text_YourFoesWeakGetmPkmn", ROMX
Text_YourFoesWeakGetmPkmn::
	text "Your foe's weak!"
	line "Get'm, @"
	text_end

SECTION "Text_BattleMonNick01", ROMX
Text_BattleMonNick01::
	text_ram wBattleMonNickname
	text "!"
	done

SECTION "Text_BattleMonNickComma", ROMX
Text_BattleMonNickComma::
	text_ram wBattleMonNickname
	text ",@"
	text_end

SECTION "Text_ThatsEnoughComeBack", ROMX
Text_ThatsEnoughComeBack::
	text " that's"
	line "enough! Come back!@"
	text_end

SECTION "Text_OKComeBack", ROMX
Text_OKComeBack::
	text " OK!"
	line "Come back!@"
	text_end

SECTION "Text_GoodComeBack", ROMX
Text_GoodComeBack::
	text " good!"
	line "Come back!@"
	text_end

SECTION "Text_ComeBack", ROMX
Text_ComeBack::
	text " come"
	line "back!"
	done

SECTION "_BootedTMText", ROMX
_BootedTMText::
	text "CT activée."
	done

SECTION "_BootedHMText", ROMX
_BootedHMText::
	text "CS activée."
	done

SECTION "_ContainedMoveText", ROMX
_ContainedMoveText::
	text "It contained"
	line ""
	text_ram wStringBuffer2
	text "."

	para "Teach "
	text_ram wStringBuffer2
	line "to a #mon?"
	done

SECTION "_TMHMNotCompatibleText", ROMX
_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " is"
	line "not compatible"
	cont "with "
	text_ram wStringBuffer1
	text "."

	para "It can't learn"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_BadgeRequiredText", ROMX
_BadgeRequiredText::
	text "Un Badge est"
	line "requis."
	prompt

SECTION "_CantUseItemText", ROMX
_CantUseItemText::
	text "Impossible d'uti-"
	line "liser ça ici."
	prompt

SECTION "_UseCutText", ROMX
_UseCutText::
	text_ram wStringBuffer2
	text " used"
	line "Cut!"
	prompt

SECTION "_CutNothingText", ROMX
_CutNothingText::
	text "Il n'y a rien"
	line "à couper ici."
	prompt

SECTION "_AskFlashText", ROMX
_AskFlashText::
	text "It's pitch black."
	line "Want to use Flash?"
	done

SECTION "_BlindingFlashText", ROMX
_BlindingFlashText::
	text "A blinding Flash"
	line "lights the area!"
	text_promptbutton
	text_end

SECTION "_UsedSurfText", ROMX
_UsedSurfText::
	text_ram wStringBuffer2
	text " used"
	line "Surf!"
	done

SECTION "_CantSurfText", ROMX
_CantSurfText::
	text "On ne peut pas"
	line "surfer ici."
	prompt

SECTION "_AlreadySurfingText", ROMX
_AlreadySurfingText::
	text "Vous êtes déjà en"
	line "train de surfer!"
	prompt

SECTION "_AskSurfText", ROMX
_AskSurfText::
	text "l'eau est calme..."
	line "Un coup de Surf?"
	done

SECTION "_UseWaterfallText", ROMX
_UseWaterfallText::
	text_ram wStringBuffer2
	text " used"
	line "Waterfall!"
	done

SECTION "_HugeWaterfallText", ROMX
_HugeWaterfallText::
	text "Oh! Une énorme"
	line "cascade."
	done

SECTION "_AskWaterfallText", ROMX
_AskWaterfallText::
	text "Voulez-vous uti-"
	line "liser cascade?"
	done

SECTION "_UseDigText", ROMX
_UseDigText::
	text_ram wStringBuffer2
	text " used"
	line "Dig!"
	done

SECTION "_UseEscapeRopeText", ROMX
_UseEscapeRopeText::
	text "<PLAYER> utilise"
	line "une Corde sortie."
	done

SECTION "_CantUseDigText", ROMX
_CantUseDigText::
	text "Impossible d'uti-"
	line "liser ça ici."
	done

SECTION "_CantUseTeleportText", ROMX
_CantUseTeleportText::
	text "Impossible d'uti-"
	line "liser ça ici."
	done

SECTION "_UseStrengthText", ROMX
_UseStrengthText::
	text_ram wStringBuffer2
	text " used"
	line "Strength!"
	done

SECTION "_MoveBoulderText", ROMX
_MoveBoulderText::
	text_ram wStringBuffer1
	text " can"
	line "move boulders."
	prompt

SECTION "_AskStrengthText", ROMX
_AskStrengthText::
	text "Un #mon peut"
	line "déplacer ça."

	para "Voulez-vous utili-"
	line "ser force?"
	done

SECTION "_BouldersMoveText", ROMX
_BouldersMoveText::
	text "Les rochers peu-"
	line "vent être mainte-"
	cont "nant déplacés!"
	done

SECTION "_BouldersMayMoveText", ROMX
_BouldersMayMoveText::
	text "Un #mon peut"
	line "déplacer ceci."
	done

SECTION "_UseWhirlpoolText", ROMX
_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " used"
	line "Whirlpool!"
	prompt

SECTION "_MayPassWhirlpoolText", ROMX
_MayPassWhirlpoolText::
	text "C'est un terrible"
	line "siphon!"

	para "Un #mon peut"
	line "le traverser."
	done

SECTION "_AskWhirlpoolText", ROMX
_AskWhirlpoolText::
	text "Un siphon est sur"
	line "la route."

	para "Lancer"
	line "siphon?"
	done

SECTION "_UseHeadbuttText", ROMX
_UseHeadbuttText::
	text_ram wStringBuffer2
	text " did a"
	line "Headbutt!"
	prompt

SECTION "_HeadbuttNothingText", ROMX
_HeadbuttNothingText::
	text "Non. Rien..."
	done

SECTION "_AskHeadbuttText", ROMX
_AskHeadbuttText::
	text "Un #mon peut"
	line "être dans l'arbre."

	para "Voulez-vous donner"
	line "un coup d'boule?"
	done

SECTION "_UseRockSmashText", ROMX
_UseRockSmashText::
	text_ram wStringBuffer2
	text " used"
if DEF(FAITHFUL)
	line "Rock Smash!"
else
	line "Brick Break!"
endc
	prompt

SECTION "_MaySmashText", ROMX
_MaySmashText::
	text "Un #mon peut"
	line "le briser."
	done

SECTION "_AskRockSmashText", ROMX
_AskRockSmashText::
	text "This rock looks"
	line "breakable."

if DEF(FAITHFUL)
	para "Want to use Rock"
	line "Smash?"
else
	para "Want to use Brick"
	line "Break?"
endc
	done

SECTION "_RodBiteText", ROMX
_RodBiteText::
	text "Oh!"
	line "Ça mord!"
	prompt

SECTION "_RodNothingText", ROMX
_RodNothingText::
	text "Not even a nibble!"

	para "Keep fishing?"
	done

SECTION "_CantGetOffBikeText", ROMX
_CantGetOffBikeText::
	text "Vous ne pouvez"
	line "pas descendre ici!"
	done

SECTION "_GotOnBikeText", ROMX
_GotOnBikeText::
	text "<PLAYER> got on the"
	line ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_GotOffBikeText", ROMX
_GotOffBikeText::
	text "<PLAYER> got off"
	line "the "
	text_ram wStringBuffer2
	text "."
	done

SECTION "_AskCutText", ROMX
_AskCutText::
	text "Cet arbre peut"
	line "être Coupe!"

	para "Lancer Coupe?"
	done

SECTION "_CanCutText", ROMX
_CanCutText::
	text "Cet arbre peut"
	line "être Coupe!"
	done

SECTION "_FoundItemText", ROMX
_FoundItemText::
	text "<PLAYER> found"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_GotTheItemText", ROMX
_GotTheItemText:
	text "<PLAYER> got"
	line "the "
	text_ram wStringBuffer4
	text "."
	done

SECTION "_ReceivedTheBadgeText", ROMX
_ReceivedTheBadgeText:
	text "<PLAYER> received"
	line "the "
	text_ram wStringBuffer4
	text " Badge."
	done

SECTION "WhiteoutText", ROMX
WhiteoutText::
	text "<PLAYER> is out of"
	line "useable #mon!"

	para "<PLAYER> blacked"
	line "out!"
	done

SECTION "WhiteoutToWildText", ROMX
WhiteoutToWildText::
	text "<PLAYER> is out of"
	line "useable #mon!"

	para "<PLAYER> panicked"
	line "and dropped"
	cont "¥"
	text_decimal hMoneyTemp, 3, 7
	text "…"

	para "………………"
	line "………………"

	para "<PLAYER> blacked"
	line "out!"
	done

SECTION "WhiteoutToTrainerText", ROMX
WhiteoutToTrainerText::
	text "<PLAYER> is out of"
	line "useable #mon!"

	para "<PLAYER> paid"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text " to the"
	cont "winner…"

	para "………………"
	line "………………"

	para "<PLAYER> blacked"
	line "out!"
	done

SECTION "ForfeitToTrainerText", ROMX
ForfeitToTrainerText::
	text "<PLAYER> forfeit-"
	line "ed the battle…"

	para "<PLAYER> paid"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text " to the"
	cont "winner…"

	para "………………"
	line "………………"

	para "<PLAYER> blacked"
	line "out!"
	done

SECTION "_PoisonFaintText", ROMX
_PoisonFaintText::
	text_ram wStringBuffer3
	line "recovered from"
	cont "its poisoning!"
	prompt

SECTION "_UseSweetHoneyText", ROMX
_UseSweetHoneyText::
	text "<PLAYER> spread"
if DEF(FAITHFUL)
	line "the Honey!"
else
	line "the Sweet Honey!"
endc
	done

SECTION "_SweetHoneyNothingText", ROMX
_SweetHoneyNothingText::
	text "Il n'y a rien"
	line "dans le coin..."
	done

SECTION "_SquirtbottleNothingText", ROMX
_SquirtbottleNothingText::
	text "<PLAYER> fait"
	line "jaillir de l'eau."

	para "Mais rien ne"
	line "se passe..."
	done

SECTION "_UseSacredAshText", ROMX
_UseSacredAshText::
	text "Les #mon de"
	line "<PLAYER> sont tous"
	cont "soignés!"
	done

SECTION "Text_AnEGGCantHoldAnItem", ROMX
Text_AnEGGCantHoldAnItem::
	text "Un Oeuf ne peut"
	line "rien porter."
	prompt

SECTION "_AskThrowAwayText", ROMX
_AskThrowAwayText::
	text "En jeter"
	line "combien?"
	done

SECTION "_AskQuantityThrowAwayText", ROMX
_AskQuantityThrowAwayText::
	text "Throw away "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "?"
	done

SECTION "_ThrewAwayText", ROMX
_ThrewAwayText::
	text "Threw away"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_OakThisIsntTheTimeText", ROMX
_OakThisIsntTheTimeText::
	text "Chen: <PLAYER>!"
	line "Ce n'est pas le"
	cont "moment d'utiliser"
	cont "ce truc!"
	prompt

SECTION "Text_YouDontHaveAPkmn", ROMX
Text_YouDontHaveAPkmn::
	text "Vous n'avez pas"
	line "de #mon!"
	prompt

SECTION "_RegisteredItemText", ROMX
_RegisteredItemText::
	text "Registered the"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "UnregisteredItemText", ROMX
UnregisteredItemText::
	text "Unregistered the"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_CantRegisterText", ROMX
_CantRegisterText::
	text "On ne peut enre-"
	line "gistrer cet objet."
	prompt

SECTION "_AskItemMoveText", ROMX
_AskItemMoveText::
	text "Où déplacer"
	line "ceci?"
	done

SECTION "Text_AreYouABoyOrAreYouAGirl", ROMX
Text_AreYouABoyOrAreYouAGirl::
	text "Which photo is on"
	line "your Trainer Card?"
	done

SECTION "Text_SoThisIsYou", ROMX
Text_SoThisIsYou::
	text "So this is you?"
	done

SECTION "Text_BattleUser", ROMX
Text_BattleUser::
	text "<USER>@"
	text_end

SECTION "_BattleTookSunlightText", ROMX
_BattleTookSunlightText::
	line "took in sunlight!"
	prompt

SECTION "_BattleFlewText", ROMX
_BattleFlewText::
	line "flew up high!"
	prompt

SECTION "_BattleDugText", ROMX
_BattleDugText::
	line "dug a hole!"
	prompt

SECTION "Text_BreedHuh", ROMX
Text_BreedHuh::
	text "Hein?"

	para "@"
	text_end

SECTION "_BreedEggHatchText", ROMX
_BreedEggHatchText::
	text_ram wStringBuffer1
	text " came"
	line "out of its Egg!"
	text_sound SFX_CAUGHT_MON
	text_promptbutton
	text_end

SECTION "_BreedAskNicknameText", ROMX
_BreedAskNicknameText::
	text "Give a nickname to"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_LeftWithDayCareLadyText", ROMX
_LeftWithDayCareLadyText::
	text "It's "
	text_ram wBreedMon2Nickname
	line "that was left with"
	cont "the Day-Care Lady."
	done

SECTION "_LeftWithDayCareManText", ROMX
_LeftWithDayCareManText::
	text "It's "
	text_ram wBreedMon1Nickname
	line "that was left with"
	cont "the Day-Care Man."
	done

SECTION "_BreedNoInterestText", ROMX
_BreedNoInterestText::
	text "It has no interest"
	line "in "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedAppearsToCareForText", ROMX
_BreedAppearsToCareForText::
	text "It appears to care"
	line "for "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedFriendlyText", ROMX
_BreedFriendlyText::
	text "It's friendly with"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedShowsInterestText", ROMX
_BreedShowsInterestText::
	text "It shows interest"
	line "in "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_EmptyMailboxText", ROMX
_EmptyMailboxText::
	text "Il n'y a pas de"
	line "lettre ici."
	prompt

SECTION "ClearedMailPutAwayText", ROMX
ClearedMailPutAwayText::
	text "Le Courrier a été"
	line "rangé."
	prompt

SECTION "MailPackFullText", ROMX
MailPackFullText::
	text "The Bag is full."
	prompt

SECTION "MailMessageLostText", ROMX
MailMessageLostText::
	text "Le message de la"
	line "lettre sera perdu."
	cont "OK?"
	done

SECTION "MailAlreadyHoldingItemText", ROMX
MailAlreadyHoldingItemText::
	text "Il porte déjà"
	line "un objet."
	prompt

SECTION "MailEggText", ROMX
MailEggText::
	text "Un Oeuf ne peut"
	line "porter une lettre!"
	prompt

SECTION "MailMovedFromBoxText", ROMX
MailMovedFromBoxText::
	text "Cette lettre vient"
	line "de la boîte aux"
	cont "Lettres."
	prompt

SECTION "_ReceivedGiftMonText", ROMX
_ReceivedGiftMonText::
	text "<PLAYER> received"
	line ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done

SECTION "_EggSentToPCText", ROMX
_EggSentToPCText::
	text "The Egg was sent"
	line "to "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_PCGottaHavePokemonText", ROMX
_PCGottaHavePokemonText::
	text "Il faut des"
	line "#mon à appeler!"
	prompt

SECTION "_ContestCaughtMonText", ROMX
_ContestCaughtMonText::
	text "Caught "
	text_ram wStringBuffer1
	text "!"
	prompt

SECTION "_ContestAskSwitchText", ROMX
_ContestAskSwitchText::
	text "Changer de"
	line "#mon?"
	done

SECTION "_ContestAlreadyCaughtText", ROMX
_ContestAlreadyCaughtText::
	text "You already caught"
	line "a "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "ContestJudging_FirstPlaceText", ROMX
ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is"
	text_pause
	text "…"

	para ""
	text_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont ""
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "ContestJudging_FirstPlaceScoreText", ROMX
ContestJudging_FirstPlaceScoreText::
	para "The winning score"
	line "was "
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

SECTION "ContestJudging_SecondPlaceText", ROMX
ContestJudging_SecondPlaceText::
	text "Placing second was"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "who caught a"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "ContestJudging_SecondPlaceScoreText", ROMX
ContestJudging_SecondPlaceScoreText::
	para "The score was"
	line ""
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

SECTION "ContestJudging_ThirdPlaceText", ROMX
ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line ""
	text_ram wBugContestWinnerName
	text ","
	para "who caught a"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "ContestJudging_ThirdPlaceScoreText", ROMX
ContestJudging_ThirdPlaceScoreText::
	para "The score was"
	line ""
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

SECTION "_MagikarpGuruMeasureText", ROMX
_MagikarpGuruMeasureText::
	text "Let me measure"
	line "that Magikarp."

	para "…Hm, it measures"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_KarpGuruRecordText", ROMX
_KarpGuruRecordText::
	text "Current Record"
	para ""
	text_ram wStringBuffer1
	text " caught by"
	line ""
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

SECTION "_LuckyNumberMatchPartyText", ROMX
_LuckyNumberMatchPartyText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of "
	text_ram wStringBuffer2
	text " in"
	line "your party."
	prompt

SECTION "_LuckyNumberMatchPCText", ROMX
_LuckyNumberMatchPCText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of "
	text_ram wStringBuffer2
	text " in Box"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_CaughtAskNicknameText", ROMX
_CaughtAskNicknameText::
	text "Give a nickname to"
	line "the "
	text_ram wStringBuffer1
	text " you"
	cont "received?"
	done

SECTION "_PokecenterPCCantUseText", ROMX
_PokecenterPCCantUseText::
	text "Bzzzzt! Il faut un"
	line "#mon pour"
	cont "utiliser ça!"
	prompt

SECTION "_PlayersPCTurnOnText", ROMX
_PlayersPCTurnOnText::
	text "<PLAYER> allume"
	line "le PC."
	prompt

SECTION "_PlayersPCAskWhatDoText", ROMX
_PlayersPCAskWhatDoText::
	text "Que voulez-vous"
	line "faire?"
	done

SECTION "_PlayersPCHowManyWithdrawText", ROMX
_PlayersPCHowManyWithdrawText::
	text "Combien voulez-"
	line "vous en retirer?"
	done

SECTION "_PlayersPCWithdrewItemsText", ROMX
_PlayersPCWithdrewItemsText::
	text "Withdrew "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_PlayersPCNoRoomWithdrawText", ROMX
_PlayersPCNoRoomWithdrawText::
	text "Pas de place pour"
	line "plus d'objets."
	prompt

SECTION "_PlayersPCNoItemsText", ROMX
_PlayersPCNoItemsText::
	text "Pas d'objets ici!"
	prompt

SECTION "_PlayersPCCantDepositItemText", ROMX
_PlayersPCCantDepositItemText::
	text "That item can't"
	line "be deposited."
	prompt

SECTION "_PlayersPCHowManyDepositText", ROMX
_PlayersPCHowManyDepositText::
	text "Combien voulez-"
	line "vous en déposer?"
	done

SECTION "_PlayersPCDepositItemsText", ROMX
_PlayersPCDepositItemsText::
	text "Deposited "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_PlayersPCNoRoomDepositText", ROMX
_PlayersPCNoRoomDepositText::
	text "Plus de place pour"
	line "garder des objets."
	prompt

SECTION "_PokecenterPCTurnOnText", ROMX
_PokecenterPCTurnOnText::
	text "<PLAYER> allume"
	line "le PC."
	prompt

SECTION "_PokecenterPCWhoseText", ROMX
_PokecenterPCWhoseText::
	text "Accéder à quel PC?"
	done

SECTION "_PokecenterBillsPCText", ROMX
_PokecenterBillsPCText::
	text "PC de Léo"
	line "connecté."

	para "Gestion Stocks"
	line "de #mon."
	prompt

SECTION "_PokecenterPlayersPCText", ROMX
_PokecenterPlayersPCText::
	text "PC personnel"
	line "connecté."

	para "Gestion Stocks"
	line "d'objets."
	prompt

SECTION "_PokecenterOaksPCText", ROMX
_PokecenterOaksPCText::
	text "PC du Prof.Chen"
	line "connecté."

	para "Evaluation du"
	line "#dex."
	prompt

SECTION "_PokecenterPCOaksClosedText", ROMX
_PokecenterPCOaksClosedText::
	text "..."
	line "Déconnexion..."
	done

SECTION "_OakPCText1", ROMX
_OakPCText1::
	text "Veux-tu que j'éva-"
	line "lue ton #dex?"
	done

SECTION "_OakPCText2", ROMX
_OakPCText2::
	text "Niveau #dex"
	line "actuel:"
	prompt

SECTION "_OakPCText3", ROMX
_OakPCText3::
	text_decimal wTempDexSeen, 2, 3
	text " #mon seen"
	line ""
	text_decimal wTempDexOwn, 2, 3
	text " #mon owned"

	para "Prof.Oak's"
	line "Rating:"
	done

SECTION "_OakRating01", ROMX
_OakRating01::
	text "Cherche des #-"
	line "mon dans les"
	cont "hautes herbes!"
	done

SECTION "_OakRating02", ROMX
_OakRating02::
	text "Bien. Je vois que"
	line "tu sais te servir"
	cont "des # Balls."
	done

SECTION "_OakRating03", ROMX
_OakRating03::
	text "Tu t'améliores"
	line "mais il te reste"

	para "beaucoup de choses"
	line "à découvrir."
	done

SECTION "_OakRating04", ROMX
_OakRating04::
	text "Tu dois remplir"
	line "ton #dex."

	para "Attrapé plusieurs"
	line "types de #mon!"
	done

SECTION "_OakRating05", ROMX
_OakRating05::
	text "Tu te donnes du"
	line "mal, ça se voit."

	para "Ton #dex se"
	line "remplit doucement."
	done

SECTION "_OakRating06", ROMX
_OakRating06::
	text "Certains #mon"
	line "évoluent seuls,"

	para "d'autres ont be-"
	line "soin de Pierres."
	done

SECTION "_OakRating07", ROMX
_OakRating07::
	text "Est-ce que tu as"
	line "une canne? Tu"

	para "peux pêcher des"
	line "#mon!"
	done

SECTION "_OakRating08", ROMX
_OakRating08::
	text "Super! Tu aimes"
	line "collectionner"
	cont "des trucs, hein?"
	done

SECTION "_OakRating09", ROMX
_OakRating09::
	text "Certains #mon"
	line "n'apparaissent"

	para "qu'à certains"
	line "moments de la"
	cont "journée."
	done

SECTION "_OakRating10", ROMX
_OakRating10::
	text "Ton #dex se"
	line "remplit. C'est"
	cont "bien!"
	done

SECTION "_OakRating11", ROMX
_OakRating11::
	text "Impressionnant!"
	line "Tu fais évoluer"

	para "tes #mon!"
	line "Bravo!"
	done

SECTION "_OakRating12", ROMX
_OakRating12::
	text "Tu connais"
	line "Fargas? Il fabri-"
	cont "que des Balls!"
	done

SECTION "_OakRating13", ROMX
_OakRating13::
	text "Oh! Tu as trouvé"
	line "plus de #mon"

	para "qu'au dernier"
	line "recensement du"
	cont "#dex."
	done

SECTION "_OakRating14", ROMX
_OakRating14::
	text "Échanges-tu tes"
	line "#mon? Il"

	para "faut se faire"
	line "des amis!"
	done

SECTION "_OakRating15", ROMX
_OakRating15::
	text "Whoa! T'as passé"
	line "la barre des 200!"
	cont "Ton #dex est"
	cont "mortel!"
	done

SECTION "_OakRating16", ROMX
_OakRating16::
	text "Tu as trouvé tant"
	line "de #mon!"

	para "Tu aides vraiment"
	line "mes recherches!"
	done

SECTION "_OakRating17", ROMX
_OakRating17::
	text "Magnifique! Tu"
	line "peux devenir un"

	para "Prof. #mon"
	line "dès maintenant!"
	done

SECTION "_OakRating18", ROMX
_OakRating18::
	text "Ton #dex est"
	line "incroyable! Tu"

	para "vas devenir un"
	line "professionnel!"
	done

SECTION "_OakRating19", ROMX
_OakRating19::
	text "Whoa! Un #dex"
	line "parfait! Mon rêve"

	para "devient réalité!"
	line "Bravo! Bravo!"
	done

SECTION "_OakPCText4", ROMX
_OakPCText4::
	text "Connexion au PC du"
	line "Prof.Chen coupée."
	done

SECTION "_MemoryGameYeahText", ROMX
_MemoryGameYeahText::
	text ", ouais!"
	done

SECTION "_MemoryGameDarnText", ROMX
_MemoryGameDarnText::
	text "Zut..."
	done

SECTION "_StartMenuContestEndText", ROMX
_StartMenuContestEndText::
	text "Voulez-vous arrê-"
	line "ter le concours?"
	done

SECTION "_ItemsTossOutHowManyText", ROMX
_ItemsTossOutHowManyText::
	text "Toss out how many"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "?"
	done

SECTION "_ItemsDiscardedText", ROMX
_ItemsDiscardedText::
	text "Discarded"
	line ""
	text_ram wStringBuffer1
	text_plural
	text "."
	prompt

SECTION "_ItemsOakWarningText", ROMX
_ItemsOakWarningText::
	text "Chen: <PLAYER>!"
	line "Ce n'est pas le"
	cont "moment d'utiliser"
	cont "ce truc!"
	done

SECTION "_PokemonSwapItemText", ROMX
_PokemonSwapItemText::
	text "Took "
	text_ram wMonOrItemNameBuffer
	text "'s"
	line ""
	text_ram wStringBuffer1
	text " and"

	para "made it hold"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_PokemonHoldItemText", ROMX
_PokemonHoldItemText::
	text "Made "
	text_ram wMonOrItemNameBuffer
	line "hold "
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_PokemonRemoveMailText", ROMX
_PokemonRemoveMailText::
	text "Enlever la"
	line "lettre d'abord."
	prompt

SECTION "_PokemonNotHoldingText", ROMX
_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

SECTION "_ItemStorageFullText", ROMX
_ItemStorageFullText::
	text "Espace de stockage"
	line "d'objets complet."
	prompt

SECTION "_PokemonTookItemText", ROMX
_PokemonTookItemText::
	text "Took "
	text_ram wStringBuffer1
	line "from "
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

SECTION "_PokemonAskSwapItemText", ROMX
_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para ""
	text_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

SECTION "_ItemCantHeldText", ROMX
_ItemCantHeldText::
	text "That item can't be"
	line "held."
	prompt

SECTION "_MailLoseMessageText", ROMX
_MailLoseMessageText::
	text "La lettre perdra"
	line "son message. OK?"
	done

SECTION "_MailDetachedText", ROMX
_MailDetachedText::
	text "Mail detached from"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_MailNoSpaceText", ROMX
_MailNoSpaceText::
	text "Pas de place pour"
	line "enlever la lettre."
	prompt

SECTION "_MailAskSendToPCText", ROMX
_MailAskSendToPCText::
	text "Envoyer la lettre"
	line "enlevée au PC?"
	done

SECTION "_MailboxFullText", ROMX
_MailboxFullText::
	text "La boîte aux Let-"
	line "tres du PC est"
	cont "pleine."
	prompt

SECTION "_MailSentToPCText", ROMX
_MailSentToPCText::
	text "La lettre a été"
	line "envoyée au PC."
	prompt

SECTION "_PokemonNotEnoughHPText", ROMX
_PokemonNotEnoughHPText::
	text "Pas assez de PV!"
	prompt

SECTION "_MayRegisterItemText", ROMX
_MayRegisterItemText::
	text "An item in your"
	line "Bag may be"

	para "registered for use"
	line "on Select Button."
	done

SECTION "_InitialOptionsText", ROMX
_InitialOptionsText::
	text "Please choose how"
	line "you want to play"
	cont "Polished Crystal."
	prompt

SECTION "_ElmText1", ROMX
_ElmText1::
	text "Hello! Sorry to"
	line "keep you waiting!"

if !DEF(DEBUG)
	para "Welcome to the"
	line "world of #mon!"

	para "My name is Elm."

	para "People call me the"
	line "#mon Prof."
endc
	prompt

SECTION "_ElmText2", ROMX
_ElmText2::
	text "Ce monde est peu-"
	line "plé de créatures"
	cont "appelées #mon.@"
	text_end

SECTION "_ElmText4", ROMX
_ElmText4::
	text "Humains et #mon"
	line "vivent en parfaite"
	cont "harmonie..."

	para "Certains jouent"
	line "avec les #mon,"
	cont "d'autres font des"
	cont "combats avec eux."
	prompt

SECTION "_ElmText5", ROMX
_ElmText5::
	text "Mais il reste"
	line "beaucoup à appren-"
	cont "dre sur nos amis"
	cont "les #mon."

	para "De nombreux mystè-"
	line "res planent à leur"
	cont "sujet."

	para "Et c'est pourquoi"
	line "j'étudie les"
	cont "#mon tous les"
	cont "jours."
	prompt

SECTION "_ElmText6", ROMX
_ElmText6::
	text "Please tell me"
	line "your name."
	prompt

SECTION "_ElmText7", ROMX
_ElmText7::
	text "<PLAYER>, are you"
	line "ready?"

if !DEF(DEBUG)
	para "Your very own"
	line "#mon story is"
	cont "about to unfold."

	para "You'll face fun"
	line "times and tough"
	cont "challenges."

	para "A world of dreams"
	line "and adventures"

	para "with #mon"
	line "awaits! Let's go!"
endc

	para "I'll be seeing you"
	line "later!"
	done

SECTION "_WarnVBAText", ROMX
_WarnVBAText::
if !DEF(DEBUG)
	text "Warning!"

	para "This Game Boy"
	line "emulator has bugs"

	para "that may crash"
	line "Polished Crystal."

	para "Please use a more"
	line "accurate emulator,"

	para "such as BGB, mGBA,"
	line "or Gambatte."
	prompt
else
	text "Emulator test"
	line "failed."
	prompt
endc

SECTION "_ClockTimeMayBeWrongText", ROMX
_ClockTimeMayBeWrongText::
	text "l'horloge est"
	line "peut-être fausse."

	para "Régler l'heure"
	line "s.v.p."
	prompt

SECTION "_ClockSetWithControlPadText", ROMX
_ClockSetWithControlPadText::
	text "Régler avec la"
	line "manette."

	para "Choix:   Bouton A"
	line "Retour:  Bouton B"
	done

SECTION "_ClockIsThisOKText", ROMX
_ClockIsThisOKText::
	text "Est-ce correct?"
	done

SECTION "_ClockHasResetText", ROMX
_ClockHasResetText::
	text "l'horloge a été"
	line "réinitialisée."
	done

SECTION "_LinkTimeoutText", ROMX
_LinkTimeoutText::
	text "Trop de temps"
	line "s'est écoulé."
	cont "Essayer à nouveau."
	prompt

SECTION "_LinkTradeCantBattleText", ROMX
_LinkTradeCantBattleText::
	text "Vous ne pourrez"
	line "pas combattre si"
	cont "vous échangez ce"
	cont "#mon."
	prompt

SECTION "_LinkAbnormalMonText", ROMX
_LinkAbnormalMonText::
	text "Your friend's"
	line ""
	text_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

SECTION "_LinkAskTradeForText", ROMX
_LinkAskTradeForText::
	text "Trade "
	text_ram wBufferTrademonNickname
	line "for "
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_WouldYouLikeToSaveTheGameText", ROMX
_WouldYouLikeToSaveTheGameText::
	text "Voulez-vous sauve-"
	line "garder la partie?"
	done

SECTION "_SavedTheGameText", ROMX
_SavedTheGameText::
	text "<PLAYER> sauve"
	line "la partie."
	done

SECTION "_AnotherSaveFileText", ROMX
_AnotherSaveFileText::
	text "Warning! There is"
	line "a save file from"
	cont "another game."

	para "Is it OK to over-"
	line "write the other"
	cont "save file?"
	done

SECTION "_SaveFileCorruptedText", ROMX
_SaveFileCorruptedText::
	text "La sauvegarde"
	line "est corrompue!"
	prompt

SECTION "_GainedItemText", ROMX
_GainedItemText::
	text "<PLAYER> gained"
	line ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "_GainedMultipleItemsText", ROMX
_GainedMultipleItemsText::
	text "<PLAYER> gained"
	line ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer4
	text "."
	done

SECTION "_PutItemInPocketText", ROMX
_PutItemInPocketText::
	text "<PLAYER> put the"
	line ""
	text_ram wStringBuffer1
	text " in"
	cont "the "
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_PocketIsFullText", ROMX
_PocketIsFullText::
	text "The "
	text_ram wStringBuffer3
	line "is full…"
	prompt

SECTION "_FoundWingsText", ROMX
_FoundWingsText::
	text "<PLAYER> got "
	text_decimal wCurWingQuantity, 1, 2
	line ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "_CongratulationsYourPokemonText", ROMX
_CongratulationsYourPokemonText::
	text "Congratulations!"
	line "Your "
	text_ram wStringBuffer2
	text_end

SECTION "_EvolvedIntoText", ROMX
_EvolvedIntoText::
	para "evolved into"
	line ""
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_StoppedEvolvingText", ROMX
_StoppedEvolvingText::
	text "Huh? "
	text_ram wStringBuffer2
	line "stopped evolving!"
	prompt

SECTION "_EvolvingText", ROMX
_EvolvingText::
	text "What? "
	text_ram wStringBuffer2
	line "is evolving!"
	done

SECTION "_MartHowManyText", ROMX
_MartHowManyText::
	text "Combien?"
	done

SECTION "_MartFinalPriceText", ROMX
_MartFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "will be ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "_HerbShopLadyIntroText", ROMX
_HerbShopLadyIntroText::
	text "Bonjour toi."

	para "Je vends des"
	line "herbes médicinales"
	cont "à bon marché."

	para "C'est bien bon"
	line "mais un peu amer."

	para "Ton #mon ne va"
	line "peut-être pas"
	cont "aimer."

	para "Héhéhéhéhé..."
	done

SECTION "_HerbalLadyFinalPriceText", ROMX
_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "will be ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "_HerbalLadyThanksText", ROMX
_HerbalLadyThanksText::
	text "Merci."
	line "Héhéhéhéhé..."
	done

SECTION "_HerbalLadyPackFullText", ROMX
_HerbalLadyPackFullText::
	text "Oh? Your Bag is"
	line "full, dear."
	done

SECTION "_HerbalLadyNoMoneyText", ROMX
_HerbalLadyNoMoneyText::
	text "Pas assez de sous!"
	line "Héhéhéhéhéhé!"
	done

SECTION "_HerbalLadyComeAgainText", ROMX
_HerbalLadyComeAgainText::
	text "A bientôt!"
	line "Héhéhéhéhéhé..."
	done

SECTION "_BargainShopIntroText", ROMX
_BargainShopIntroText::
	text "Salut! Tu cherches"
	line "une bonne affaire?"

	para "Je vends des ob-"
	line "jets super rares!"

	para "Et un de chaque"
	line "type..."
	done

SECTION "_BargainShopFinalPriceText", ROMX
_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " costs"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text ". Want it?"
	done

SECTION "_BargainShopThanksText", ROMX
_BargainShopThanksText::
	text "Merci."
	done

SECTION "_BargainShopPackFullText", ROMX
_BargainShopPackFullText::
	text "Uh-oh, your Bag"
	line "is chock-full."
	done

SECTION "_BargainShopSoldOutText", ROMX
_BargainShopSoldOutText::
	text "Tu as déjà acheté"
	line "ça. J'en ai"
	cont "plus du tout."
	done

SECTION "_BargainShopNoFundsText", ROMX
_BargainShopNoFundsText::
	text "Oh! T'as super"
	line "pas de sous."
	done

SECTION "_BargainShopComeAgainText", ROMX
_BargainShopComeAgainText::
	text "Reviens plus"
	line "tard."
	done

SECTION "_PharmacyIntroText", ROMX
_PharmacyIntroText::
	text "Oui? Besoin d'un"
	line "médicament?"
	done

SECTION "_HowManyText", ROMX
_HowManyText::
	text "How many?"
	done

SECTION "_PharmacyFinalPriceText", ROMX
_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "will cost ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "_PharmacyThanksText", ROMX
_PharmacyThanksText::
	text "Merci, merci!"
	done

SECTION "_PharmacyPackFullText", ROMX
_PharmacyPackFullText::
	text "Tu n'as plus de"
	line "place."
	done

SECTION "_PharmacyNoMoneyText", ROMX
_PharmacyNoMoneyText::
	text "Hein? C'est pas"
	line "assez."
	done

SECTION "_PharmacyComeAgainText", ROMX
_PharmacyComeAgainText::
	text "Très bien. A la"
	line "prochaine."
	done

SECTION "_MartSellHowManyText", ROMX
_MartSellHowManyText::
	text "Combien?"
	done

SECTION "_MartSellPriceText", ROMX
_MartSellPriceText::
	text "I can pay you"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text "."

	para "Is that OK?"
	done

SECTION "_MartWelcomeText", ROMX
_MartWelcomeText::
	text "Bienvenue! En quoi"
	line "puis-je t'aider?"
	done

SECTION "_MartThanksText", ROMX
_MartThanksText::
	text "Voilà."
	line "Merci!"
	done

SECTION "_MartNoMoneyText", ROMX
_MartNoMoneyText::
	text "Tu n'as pas assez"
	line "d'argent."
	done

SECTION "_MartPackFullText", ROMX
_MartPackFullText::
	text "Tu ne peux plus"
	line "rien porter."
	done

SECTION "_MartCantBuyText", ROMX
_MartCantBuyText::
	text "Je ne peux pas"
	line "t'acheter ça."
	prompt

SECTION "_MartComeAgainText", ROMX
_MartComeAgainText::
	text "A la prochaine!"
	done

SECTION "_MartAskMoreText", ROMX
_MartAskMoreText::
	text "As-tu besoin"
	line "d'autre chose?"
	done

SECTION "_MartBoughtText", ROMX
_MartBoughtText::
	text "Got ¥"
	text_decimal hMoneyTemp, 3, 7
	text " for"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	done

SECTION "_SlotsBetHowManyCoinsText", ROMX
_SlotsBetHowManyCoinsText::
	text "Combien"
	line "de jetons?"
	done

SECTION "TMMartCostsThisMuchText", ROMX
TMMartCostsThisMuchText::
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	line "will be ¥"
	text_decimal hMoneyTemp, 3, 7
	text "."
	done

SECTION "BTMartHowMayIHelpYouText", ROMX
BTMartHowMayIHelpYouText::
	text "Welcome to the"
	line "Exchange Service"
	cont "Corner!"

	para "You can trade your"
	line "BP for prizes."
	done

SECTION "BTMartCostsThisMuchText", ROMX
BTMartCostsThisMuchText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer1
	text_plural
	line "will cost "
	text_decimal hMoneyTemp+1, 2, 4
	text " BP."
	done

SECTION "BTMartInsufficientFundsText", ROMX
BTMartInsufficientFundsText::
	text "I'm sorry, but you"
	line "don't have enough"
	cont "BP."
	done

SECTION "BTMartBagFullText", ROMX
BTMartBagFullText::
	text "I'm sorry, but your"
	line "Bag is full."
	done

SECTION "BTMartComeAgainText", ROMX
BTMartComeAgainText::
	text "Please come back"
	line "any time you want!"
	done

SECTION "_SlotsStartText", ROMX
_SlotsStartText::
	text "Go!"
	done

SECTION "_SlotsNotEnoughCoinsText", ROMX
_SlotsNotEnoughCoinsText::
	text "Pas assez de"
	line "jetons."
	prompt

SECTION "_SlotsRanOutOfCoinsText", ROMX
_SlotsRanOutOfCoinsText::
	text "Zut... plus de"
	line "jetons..."
	done

SECTION "_SlotsPlayAgainText", ROMX
_SlotsPlayAgainText::
	text "Jouer encore?"
	done

SECTION "_SlotsLinedUpText", ROMX
_SlotsLinedUpText::
	text "lined up!"
	line "Won "
	text_ram wStringBuffer2
	text " coins!"
	done

SECTION "_SlotsDarnText", ROMX
_SlotsDarnText::
	text "Et zut!"
	done

SECTION "_PhoneWrongNumberText", ROMX
_PhoneWrongNumberText::
	text "Hein? Pardon!"
	line "Mauvais numéro!"
	done

SECTION "_PhoneClickText", ROMX
_PhoneClickText::
	text "Clic!"
	done

SECTION "_PhoneEllipseText", ROMX
_PhoneEllipseText::
	text "……"
	done

SECTION "_PhoneOutOfAreaText", ROMX
_PhoneOutOfAreaText::
	text "Ce numéro est hors"
	line "de la zone."
	done

SECTION "_PhoneJustTalkToThemText", ROMX
_PhoneJustTalkToThemText::
	text "Va parler à cette"
	line "personne!"
	done

SECTION "_PasswordAskResetText", ROMX
_PasswordAskResetText::
	text "Select Continue to"
	line "set the time."
	prompt

SECTION "_PasswordAskResetClockText", ROMX
_PasswordAskResetClockText::
	text "Réinitialiser"
	line "l'horloge?"
	done

SECTION "_ClearAllSaveDataText", ROMX
_ClearAllSaveDataText::
	text "Effacer zone de"
	line "sauvegarde?"
	done

SECTION "ResetInitialOptionsText", ROMX
ResetInitialOptionsText::
	text "Reset the initial"
	line "game options?"
	done

SECTION "_LearnedMoveText", ROMX
_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line ""
	text_ram wStringBuffer2
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end

SECTION "_MoveAskForgetText", ROMX
_MoveAskForgetText::
	text "Oublier quelle"
	next "capacité?"
	done

SECTION "_StopLearningMoveText", ROMX
_StopLearningMoveText::
	text "Stop learning"
	line ""
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_DidNotLearnMoveText", ROMX
_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	line "did not learn"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_AskForgetMoveText", ROMX
_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	line "wants to learn"
	cont ""
	text_ram wStringBuffer2
	text "!"

	para "Should it forget"
	line "an old move for"
	cont ""
	text_ram wStringBuffer2
	text "?"
	done

SECTION "Text_MoveForgetCount", ROMX
Text_MoveForgetCount::
	text "1, 2 and…"
	text_pause
	text_end

SECTION "_MoveForgotText", ROMX
_MoveForgotText::
	text " Poof!"
	text_pause

	para ""
	text_ram wMonOrItemNameBuffer
	text " forgot"
	line ""
	text_ram wStringBuffer1
	text "."

	para "And…"
	prompt

SECTION "_MoveCantForgetHMText", ROMX
_MoveCantForgetHMText::
	text "Les capacités des"
	line "CS ne peuvent être"
	cont "oubliées."
	prompt

SECTION "_CardFlipPlayWithThreeCoinsText", ROMX
_CardFlipPlayWithThreeCoinsText::
	text "Jouer avec 3"
	line "jetons?"
	done

SECTION "_CardFlipNotEnoughCoinsText", ROMX
_CardFlipNotEnoughCoinsText::
	text "Pas assez de"
	line "jetons."
	prompt

SECTION "_CardFlipChooseACardText", ROMX
_CardFlipChooseACardText::
	text "Choisir une carte."
	done

SECTION "_CardFlipPlaceYourBetText", ROMX
_CardFlipPlaceYourBetText::
	text "Parier..."
	done

SECTION "_CardFlipPlayAgainText", ROMX
_CardFlipPlayAgainText::
	text "Jouer à nouveau?"
	done

SECTION "_CardFlipShuffledText", ROMX
_CardFlipShuffledText::
	text "Les cartes ont été"
	line "mélangées."
	prompt

SECTION "_CardFlipYeahText", ROMX
_CardFlipYeahText::
	text "Ouais!"
	done

SECTION "_CardFlipDarnText", ROMX
_CardFlipDarnText::
	text "Zut..."
	done

SECTION "_GearTodayText", ROMX
_GearTodayText::
	text_today
	text_end

SECTION "_GearEllipseText", ROMX
_GearEllipseText::
	text "……"
	done

SECTION "_GearOutOfServiceText", ROMX
_GearOutOfServiceText::
	text "Vous êtes en"
	line "dehors du réseau."
	prompt

SECTION "_PokegearAskWhoCallText", ROMX
_PokegearAskWhoCallText::
	text "Qui voulez-vous"
	line "appeler?"
	done

SECTION "_PokegearPressButtonText", ROMX
_PokegearPressButtonText::
	text "Presser un bouton"
	line "pour sortir."
	done

SECTION "_PokegearAskDeleteText", ROMX
_PokegearAskDeleteText::
	text "Effacer ce numéro"
	line "enregistré?"
	done

SECTION "_BuenaAskWhichPrizeText", ROMX
_BuenaAskWhichPrizeText::
	text "You can cash in"
	line "your saved points"

	para "for a lovely prize"
	line "of your choice!"

	para "Which prize would"
	line "you like?"
	done

SECTION "_BuenaIsThatRightText", ROMX
_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "Is that right?"
	done

SECTION "_BuenaHereYouGoText", ROMX
_BuenaHereYouGoText::
	text "Voilà!"
	done

SECTION "_BuenaNotEnoughPointsText", ROMX
_BuenaNotEnoughPointsText::
	text "Vous n'avez pas"
	line "assez de points."
	done

SECTION "_BuenaNoRoomText", ROMX
_BuenaNoRoomText::
	text "Vous n'avez pas"
	line "de place."
	done

SECTION "_BuenaComeAgainText", ROMX
_BuenaComeAgainText::
	text "Oh. Revenez"
	line "plus tard!"
	done

SECTION "_BallBrokeFreeText", ROMX
_BallBrokeFreeText::
	text "Oh non! Le #mon"
	line "s'est libéré!"
	prompt

SECTION "_BallAppearedCaughtText", ROMX
_BallAppearedCaughtText::
	text "Raaah! Ça y était"
	line "presque!"
	prompt

SECTION "_BallAlmostHadItText", ROMX
_BallAlmostHadItText::
	text "Aaaaaah!"
	line "Presque!"
	prompt

SECTION "_BallSoCloseText", ROMX
_BallSoCloseText::
	text "Mince! Ça y était"
	line "presque!"
	prompt

SECTION "Text_BallCaught", ROMX
Text_BallCaught::
	text "Gotcha! "
	text_ram wEnemyMonNickname
	line "was caught!"
	text_sound SFX_CAUGHT_MON
	text_end

SECTION "Text_Waitbutton_2", ROMX
Text_Waitbutton_2::
	text_promptbutton
	text_end

SECTION "_CurBoxFullText", ROMX
_CurBoxFullText::
	text_ram wStringBuffer1
	text " is full."
	prompt

SECTION "_MonSentToPCText", ROMX
_MonSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " was"
	line "sent to "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_NewDexDataText", ROMX
_NewDexDataText::
	text_ram wEnemyMonNickname
	text "'s data"
	line "was newly added to"
	cont "the #dex."
	text_sound SFX_SLOT_MACHINE_START
	text_promptbutton
	text_end

SECTION "_AskGiveNicknameText", ROMX
_AskGiveNicknameText::
	text "Give a nickname to"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_ItemHappinessRoseButStatFellText", ROMX
_ItemHappinessRoseButStatFellText::
	text_ram wStringBuffer1
	text " became"
	line "more friendly."
	para ""
	text_ram wStringBuffer1
	text "'s base"
	line ""
	text_ram wStringBuffer2
	text " fell!"
	prompt

SECTION "_ItemStatRoseText", ROMX
_ItemStatRoseText::
	text_ram wStringBuffer1
	text "'s"
	line ""
	text_ram wStringBuffer2
	text " rose."
	prompt

SECTION "_ItemCantUseOnMonText", ROMX
_ItemCantUseOnMonText::
	text "Inutilisable sur"
	line "ce #mon."
	prompt

SECTION "Text_RepelUsedEarlierIsStillInEffect", ROMX
Text_RepelUsedEarlierIsStillInEffect::
	text "Le repousse utili-"
	line "sé auparavant est"
	cont "toujours effectif."
	prompt

SECTION "_BlueCardBalanceText", ROMX
_BlueCardBalanceText::
	text "You now have"
	line ""
	text_decimal wBlueCardBalance, 1, 2
	text " points."
	done

SECTION "_CoinCaseCountText", ROMX
_CoinCaseCountText::
	text "Coins:"
	line ""
	text_decimal wCoins, 2, 5
	text_end

SECTION "Text_RaiseThePPOfWhichMove", ROMX
Text_RaiseThePPOfWhichMove::
	text "Monter les PP de"
	line "quelle capacité?"
	done

SECTION "Text_RestoreThePPOfWhichMove", ROMX
Text_RestoreThePPOfWhichMove::
	text "Restaurer PP de"
	line "quelle capacité?"
	done

SECTION "Text_PPIsMaxedOut", ROMX
Text_PPIsMaxedOut::
	text_ram wStringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt

SECTION "Text_PPsIncreased", ROMX
Text_PPsIncreased::
	text_ram wStringBuffer2
	text "'s PP"
	line "increased."
	prompt

SECTION "Text_PPsMaximized", ROMX
Text_PPsMaximized::
	text_ram wStringBuffer2
	text "'s PP"
	line "maximized."
	prompt

SECTION "_PPRestoredText", ROMX
_PPRestoredText::
	text "PP restaurés."
	prompt

SECTION "_ItemLooksBitterText", ROMX
_ItemLooksBitterText::
	text "Ça a l'air amer..."
	prompt

SECTION "_ItemCantUseOnEggText", ROMX
_ItemCantUseOnEggText::
	text "C'est inutilisable"
	line "sur un Oeuf."
	prompt

SECTION "_ItemOakWarningText", ROMX
_ItemOakWarningText::
	text "Chen: <PLAYER>!"
	line "Ce n'est pas le"
	cont "moment d'utiliser"
	cont "ce truc!"
	prompt

SECTION "_ItemWontHaveEffectText", ROMX
_ItemWontHaveEffectText::
	text "Ça n'a aucun"
	line "effet."
	prompt

SECTION "_BallBlockedText", ROMX
_BallBlockedText::
	text "Le dresseur"
	line "détourne la Ball!"
	prompt

SECTION "_BallDontBeAThiefText", ROMX
_BallDontBeAThiefText::
	text "Voler c'est mal!"
	prompt

SECTION "_BallStorageFullText", ROMX
_BallStorageFullText::
	text "The storage system"
	line "is full. That"
	cont "can't be used now."
	prompt

SECTION "_BallDatabaseFullText", ROMX
_BallDatabaseFullText::
	text "The PC database is"
	line "overtaxed. Please"
	cont "save the game."
	prompt

SECTION "Text_MonIsHiddenFromBall", ROMX
Text_MonIsHiddenFromBall::
	text "The #mon can't"
	line "be seen!"
	prompt

SECTION "Text_MonCantBeCaught", ROMX
Text_MonCantBeCaught::
	text "The #mon can't"
	line "be caught!"
	prompt

SECTION "_ItemUsedText", ROMX
_ItemUsedText::
	text "<PLAYER> used the"
	line ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_KnowsMoveText", ROMX
_KnowsMoveText::
	text_ram wStringBuffer1
	text " knows"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_MoveKnowsOneText", ROMX
_MoveKnowsOneText::
	text "Ce #mon ne"
	line "connaît qu'une"
	cont "seule capacité."
	done

SECTION "_AskDeleteMoveText", ROMX
_AskDeleteMoveText::
	text "Oh, make it forget"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_DeleterForgotMoveText", ROMX
_DeleterForgotMoveText::
	text "Le #mon a ou-"
	line "blié la capacité!"
	done

SECTION "_DeleterEggText", ROMX
_DeleterEggText::
	text "Un Oeuf n'a pas de"
	line "capacité!"
	done

SECTION "_DeleterNoComeAgainText", ROMX
_DeleterNoComeAgainText::
	text "Ah?"
	line "A la prochaine."
	done

SECTION "_DeleterAskWhichMoveText", ROMX
_DeleterAskWhichMoveText::
	text "Quelle capacité"
	line "doit-il oublier?"
	prompt

SECTION "_DeleterIntroText", ROMX
_DeleterIntroText::
	text "Et oui! Moi j'suis"
	line "le type qui Efface"
	cont "les capacités!!!"

	para "Je peux persuader"
	line "les #mon"
	cont "d'oublier leurs"
	cont "capacités."

	para "Dois-je m'occuper"
	line "de l'un de tes"
	cont "#mon?"
	done

SECTION "_DeleterAskWhichMonText", ROMX
_DeleterAskWhichMonText::
	text "Quel #mon?"
	prompt

SECTION "Text_DSTIsThatOK", ROMX
Text_DSTIsThatOK::
	text " DST,"
	line "is that OK?"
	done

SECTION "_TimeAskOkayText", ROMX
_TimeAskOkayText::
	text ","
	line "OK?"
	done

SECTION "_TimesetAskDSTText", ROMX
_TimesetAskDSTText::
	text "Veux-tu"
	line "modifier l'heure?"
	done

SECTION "_TimesetDSTText", ROMX
_TimesetDSTText::
	text "J'avance la"
	line "montre d'une"
	cont "heure."
	prompt

SECTION "_TimesetAskNotDSTText", ROMX
_TimesetAskNotDSTText::
	text "Le changement"
	line "d'heure est-il"
	cont "fini?"
	done

SECTION "_TimesetNotDSTText", ROMX
_TimesetNotDSTText::
	text "Je recule la"
	line "montre d'une"
	cont "heure."
	prompt

SECTION "_TimesetAskAdjustDSTText", ROMX
_TimesetAskAdjustDSTText::
	text "Veux-tu"
	line "ajuster la"

	para "montre au change-"
	line "ment d'heure?"
	done

SECTION "_MomLostGearBookletText", ROMX
_MomLostGearBookletText::
	text "J'ai perdu la"
	line "notice du"
	cont "#matos."
	cont "Reviens plus tard."
	prompt

SECTION "WonderTradeQuestionText", ROMX
WonderTradeQuestionText::
	text "Would you like to"
	line "trade?"
	done

SECTION "WonderTradePromptText", ROMX
WonderTradePromptText::
	text "Which #mon do"
	line "you want to trade?"
	prompt

SECTION "WonderTradeCantTradeSpikyEaredPichuText", ROMX
WonderTradeCantTradeSpikyEaredPichuText::
	text "This Pichu appears"
	line "to have traveled"
	cont "through time."

	para "It would be risky"
	line "to transfer it,"

	para "so it's best for"
	line "Pichu to stay"
	cont "where it is."
	prompt

;SECTION "WonderTradeCantTradeEggText", ROMX
;WonderTradeCantTradeEggText::
;	text "Sorry. We can't"
;	line "accept an Egg."
;	prompt

;SECTION "WonderTradeCantAcceptAbnormalMonText", ROMX
;WonderTradeCantAcceptAbnormalMonText::
;	text "Sorry, but your"
;	line "#mon appears to"
;
;	para "be abnormal. We"
;	line "can't accept it."
;	prompt

SECTION "WonderTradeConfirmText", ROMX
WonderTradeConfirmText::
	text "Offer to trade"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "WonderTradeSetupText", ROMX
WonderTradeSetupText::
	text "Searching for a"
	line "trade partner…"
	prompt

SECTION "WonderTradeReadyText", ROMX
WonderTradeReadyText::
	text "A trade partner"
	line "has been found."
	prompt

SECTION "SilphMartIntroText", ROMX
SilphMartIntroText::
	text "Employees like me"
	line "have access to"
	cont "company swag!"

	para "Want to buy some?"
	done

SECTION "SilphMartComeAgainText", ROMX
SilphMartComeAgainText::
	text "Come again! I"
	line "could use the"
	cont "side income."
	done

SECTION "AdventurerMartIntroText", ROMX
AdventurerMartIntroText::
	text "I picked up some"
	line "rare items abroad!"
	done

SECTION "AdventurerMartComeAgainText", ROMX
AdventurerMartComeAgainText::
	text "Come by again!"
	done

SECTION "InformalMartIntroText", ROMX
InformalMartIntroText::
	text "What's up? Need"
	line "some supplies?"
	done

SECTION "BazaarMartIntroText", ROMX
BazaarMartIntroText::
	text "Come take a look"
	line "at my wares!"
	done

SECTION "AlreadyHaveTMText", ROMX
AlreadyHaveTMText::
	text "You already have"
	line "that TM."
	done

SECTION "MartPremierBallText", ROMX
MartPremierBallText::
	text "You also get a"
	line "Premier Ball as"
	text_sound SFX_TRANSACTION
	cont "an added bonus."
	done

SECTION "ItemCantBeSelectedText", ROMX
ItemCantBeSelectedText::
	text "That item can't be"
	line "selected."
	prompt

SECTION "AlreadyInThatBallTextData", ROMX
AlreadyInThatBallTextData::
	text "Your #mon is in"
	line "that Ball already."
	prompt

SECTION "CantChangeTradedMonBallTextData", ROMX
CantChangeTradedMonBallTextData::
	text "You can't change"
	line "the Ball a traded"
	cont "#mon is in."
	prompt
