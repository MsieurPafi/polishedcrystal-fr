BattleText::

LinkBattleErrorText::
	text "There was a link"
	line "error."

	para "The game will now"
	line "be reset."
	prompt

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> picked up"
	line "¥"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "A wild "
	stop_compressing_text ; fallthrough
LegendaryAppearedText:
	text_ram wEnemyMonNickname
	line "appeared!"
	prompt

GhostAppearedText:
	text "A Ghost"
	line "appeared!"
	prompt

SilphScopeRevealText:
	text "SilphScope2"
	line "unveiled the"
	cont "Ghost's identity!"
	prompt

HookedPokemonAttackedText:
	text "The hooked"
	line ""
	text_ram wEnemyMonNickname
	cont "attacked!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNickname
	text " fell"
	line "out of the tree!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "veut se battre!"
	prompt

WantToBattleText::
	text "<ENEMY>"
	line "want to battle!"
	prompt

BattleText_WildFled:
	text "Wild "
	stop_compressing_text ; fallthrough
BattleText_LegendaryFled:
	text_ram wEnemyMonNickname
	line "fled!"
	prompt

BattleText_EnemyFled:
	text "The foe "
	text_ram wEnemyMonNickname
	line "fled!"
	prompt

BattleText_EnemyCantEscape:
	text "<USER>"
	line "can't escape!"
	prompt

if DEF(DEBUG)
DealtXDamageText:
	text "Dealt "
	text_decimal wCurDamage, 2, 5
	text " dmg"
	line "before roll."
	prompt
endc

HurtByPoisonText:
	text "<USER> is"
	line "hurt by poison!"
	done

HurtByBurnText:
	text "<USER> is"
	line "hurt by its burn!"
	done

LeechSeedSapsText:
	text "Vampigraine draine"
	line "<USER>!"
	prompt

HurtByCurseText:
	text "<USER> is"
	line "hurt by the curse!"
	prompt

SandstormHitsText:
	text "<USER> is"
	line "buffeted by"
	cont "the sandstorm!"
	prompt

HailHitsText:
	text "<USER> is"
	line "buffeted by"
	cont "the hail!"
	prompt

PerishCountText:
	text "<USER>'s"
	line "Perish count is "
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BattleText_UserLostSomeOfItsHP:
	text "<USER>"
	line "lost some of its"
	cont "HP!"
	prompt

BattleText_PickedUpItem:
	; assumes player (enemy might overflow text-wise)
	text "<USER> picked"
	line "up "
	text_ram wStringBuffer2
	text "."
	prompt

BattleText_UserRecoveredWithItem:
	text "<USER>"
	line "recovered with"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserAteItem:
	text "<USER>"
	line "ate "
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserHurtByItem:
	text "<USER>"
	line "was hurt by"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserItemLetItMoveFirst::
	text "<USER>'s"
	line ""
	text_ram wStringBuffer1
	text " let"
	cont "it move first."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "restored PP of"
	cont ""
	text_ram wStringBuffer2
	text " using"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BrokeLightScreenText:
	text "<USER>"
	line "broke the target's"
	cont "Light Screen!"
	prompt

BrokeReflectText:
	text "<USER>"
	line "broke the target's"
	cont "Reflect!"
	prompt

BattleText_ItemLowered:
	text "The "
	text_ram wStringBuffer1
	line "lowered"
	cont "<USER>'s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemHarshlyLowered:
	text "The "
	text_ram wStringBuffer1
	line "sharply lowered"
	cont "<USER>'s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemSeverelyLowered:
	text "The "
	text_ram wStringBuffer1
	line "severely lowered"
	cont "<USER>'s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemRaised:
	text "The "
	text_ram wStringBuffer1
	line "raised"
	cont "<USER>'s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemSharplyRaised:
	text "The "
	text_ram wStringBuffer1
	line "sharply raised"
	cont "<USER>'s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemDrasticallyRaised:
	text "The "
	text_ram wStringBuffer1
	line "drastically raised"
	cont "<USER>'s"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_ItemRaisedCrit:
	text "<USER>"
	line "used "
	text_ram wStringBuffer1
	cont "to get pumped!"
	prompt

BattleText_MegaSolCharged:
	text "<USER>"
	line "was charged up!"
	prompt

BattleText_UserChargedWithItem:
	text "<USER>"
	line "became charged"
	cont "using "
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersFutureSightMissed:
; used when Future Sight can't hit anything because there was
; no target (so <TARGET> is undefined)
	text "The Future Sight"
	line "arrived!"

	para "But it failed!"
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "took the"
	cont "Future Sight!"
	prompt

BattleText_MistFaded:
	text_ram wStringBuffer1
	text " #mon's"
	line "mist faded!"
	prompt

BattleText_SafeguardFaded:
	text_ram wStringBuffer1
	text " #mon's"
	line "Safeguard faded!"
	prompt

BattleText_LightScreenFell:
	text_ram wStringBuffer1
	text " #mon's"
	line "Light Screen fell!"
	prompt

BattleText_ReflectFaded:
	text_ram wStringBuffer1
	text " #mon's"
	line "Reflect faded!"
	prompt

BattleText_TheRainStopped:
	text "La pluie s'est"
	line "arrêtée."
	prompt

BattleText_TheSunlightFaded:
	text "Les rayons"
	line "disparaissent."
	prompt

BattleText_TheSandstormSubsided:
	text "La tempête de"
	line "sable se calme."
	prompt

BattleText_TheHailStopped:
	text "The hail stopped."
	prompt

BattleText_EnemyPkmnFainted:
	text "The foe "
	text_ram wEnemyMonNickname
	line "fainted!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> got ¥"
	text_decimal wBattleReward, 3, 6
	line "for winning!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "a perdu!"
	prompt

BattleText_EnemyWereDefeated:
	text "<ENEMY>"
	line "were defeated!"
	prompt

TiedAgainstText:
	text "Egalité avec"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER> got ¥"
	text_decimal wBattleReward, 3, 6
	line "for winning!"
	cont "Sent some to Mom!"
	prompt

SentHalfToMomText:
	text "La moitié est"
	line "envoyée à maman!"
	prompt

SentAllToMomText:
	text "Tout est envoyé"
	line "à maman!"
	prompt

BattleText_PkmnFainted:
	text_ram wBattleMonNickname
	line "fainted!"
	prompt

BattleText_UseNextMon:
	text "Utiliser le"
	line "#mon suivant?"
	done

LostAgainstText:
	text "<ENEMY>"
	line "vous a vaincu!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "is about to use"
	cont ""
	text_ram wEnemyMonNickname
	text "."

	para "Will you switch"
	line "your #mon?"
	done

BattleText_EnemyAreAboutToUseWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "are about to use"
	cont ""
	text_ram wEnemyMonNickname
	text "."

	para "Will you switch"
	line "your #mon?"
	done

BattleText_EnemyIsAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "is about to switch"
	cont "#mon."

	para "Will you switch"
	line "your #mon?"
	done

BattleText_EnemyAreAboutToSwitchWillPlayerSwitchPkmn:
	text "<ENEMY>"
	line "are about to"
	cont "switch #mon."

	para "Will you switch"
	line "your #mon?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "sent out"
	cont ""
	text_ram wEnemyMonNickname
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "Il ne veut pas"
	line "se battre!"
	prompt

BattleText_AnEGGCantBattle:
	text "Un Oeuf ne se bat"
	line "pas, voyons!"
	prompt

BattleText_CantEscape:
	text "Fuite impossible!"
	prompt

BattleText_AskForfeitTrainerBattle:
	text "Are you sure you"
	line "want to forfeit?"
	done

BattleText_GotAwaySafely:
	text "Vous prenez la"
	line "fuite!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "fled using a"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserHurtBySpikes:
	text "<USER> is"
	line "hurt by spikes!"
	prompt

RecoveredUsingText:
	text "<USER>"
	line "recovered using a"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

AirBalloonPoppedText:
	text "<TARGET>'s"
	line "Air Balloon"
	cont "popped!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer1
	cont "activated!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Objets inutilisa-"
	line "bles ici."
	prompt

BattleText_PkmnIsAlreadyOut:
	text_ram wBattleMonNickname
	line "is already out."
	prompt

BattleText_PkmnCantBeRecalled:
	text_ram wBattleMonNickname
	line "can't be recalled!"
	prompt

BattleText_PkmnCantBeRecalledAbility:
	text_ram wEnemyMonNickname
	text "'s"
	line ""
	text_ram wStringBuffer1
	cont "prevents escape!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "Plus de PP pour"
	line "cette capacité!"
	prompt

BattleText_ItemOnlyAllowsMove: ; choice items
	text "The "
	text_ram wStringBuffer1
	line "only allows use"
	cont "of "
	text_ram wStringBuffer2
	text "!"
	prompt

BattleText_MonCanOnlyUseMove:
	text "<USER> can"
	line "only use"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_ItemPreventsStatusMoves: ; assault vest
	text "The "
	text_ram wStringBuffer1
	line "prevents usage"
	cont "of status moves!"
	prompt

BattleText_TheMoveIsDisabled:
	text "La capacité est"
	line "Entravée!"
	prompt

BattleText_PkmnHasNoMovesLeft:
	text_ram wBattleMonNickname
	line "has no moves left!"
	done

BattleText_UserEncoreEnded:
	text "<USER>'s"
	line "encore ended!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text " grew to"
	line "level "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_end

BattleText_WildPkmnIsEating:
	text "Wild "
	text_ram wEnemyMonNickname
	line "is eating!"
	prompt

BattleText_WildPkmnIsAngry:
	text "Wild "
	text_ram wEnemyMonNickname
	line "is angry!"
	prompt

BattleText_ThrewRock:
	text "<PLAYER> threw a"
	line "rock."
	prompt

BattleText_ThrewBait:
	text "<PLAYER> threw"
	line "some bait."
	prompt

FastAsleepText:
	text "<USER>"
	line "dort!"
	done

WokeUpText:
	text "<USER>"
	line "se réveille!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "est gelé!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "est gelé!"
	done

FlinchedText:
	text "<USER>"
	line "a la trouille!"
	prompt

MustRechargeText:
	text "<USER>"
	line "est à plat!"
	prompt

DisabledNoMoreText:
	text "<USER> is"
	line "disabled no more!"
	prompt

IsConfusedText:
	text "<USER>"
	line "est confus!"
	prompt

HurtItselfText:
	text "Sa folie lui in-"
	line "flige des dégâts!"
	prompt

ConfusedNoMoreText:
	text "<USER> is"
	line "confused no more!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "devient confus!"
	prompt

BecameConfusedDueToFatigueText:
	text "<TARGET>"
	line "became confused"
	cont "due to fatigue!"
	prompt

AlreadyConfusedText:
	text "<TARGET> is"
	line "already confused!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER> is"
	line "hurt by"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "was released from"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "est piégé!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "est piégé!"
	prompt

WrappedByText:
	text "<TARGET>"
	line "est Ligote par"
	cont "<USER>!"
	prompt

HungOnText:
	text "<TARGET>"
	line "hung on with"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "est tenace face au"
	cont "coup!"
	prompt

InLoveWithText:
	text "<USER>"
	line "est amoureux de"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "l'amour de"
	line "<USER>"
	cont "le paralyse!"
	prompt

NoLongerInfatuatedText:
	text "<USER>'s"
	line "no longer"
	cont "infatuated!"
	prompt

ObliviousPreventedDestinyKnot:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer1
	cont "prevents"
	cont ""
	text_ram wStringBuffer2
	cont "infatuating it!"
	prompt

DestinyKnotInfatuatedUser:
	text "<TARGET>'s"
	line ""
	text_ram wStringBuffer1
	cont "infatuated"

	para "<USER>!"
	prompt

DisabledMoveText:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer1
	text " is"
	cont "disabled!"
	prompt

UsedMoveText:
	text "<USER>"
	line "used "
	text_ram wStringBuffer2
	text "!"
	done

UsedMoveInsteadText:
	text "<USER>"
	line "used "
	text_ram wStringBuffer2
	cont "instead!"
	done

LoafingAroundText:
	text_ram wBattleMonNickname
	text " is"
	line "loafing around."
	prompt

BeganToNapText:
	text_ram wBattleMonNickname
	text " began"
	line "to nap!"
	prompt

WontObeyText:
	text_ram wBattleMonNickname
	text " won't"
	line "obey!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNickname
	text " turned"
	line "away!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNickname
	text " ignored"
	line "orders!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNickname
	text " ignored"
	line "orders…sleeping!"
	prompt

NoPPLeftText:
	text "Plus de PP pour"
	line "cette capacité!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "has no PP left for"
	cont ""
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "s'endort!"
	done

RestedText:
	text "<USER>"
	line "s'endort et récu-"
	cont "père son énergie!"
	done

RegainedHealthText:
	text "<USER>"
	line "récupère son"
	cont "énergie!"
	prompt

IsHurtText:
	text "<USER>"
	line "is hurt!"
	prompt

IsTormentedText:
	text "<USER>"
	line "is tormented!"
	prompt

AttackMissedText:
	text "<USER>"
	line "rate son attaque!"
	prompt

CrashedText:
	text "<USER>"
	line "s'éclate au sol!"
	prompt

UnaffectedText:
	text "<TARGET> is"
	line "unaffected!"
	prompt

DoesntAffectText:
	text "Aucun effet sur"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "Coup critique!"
	prompt

ExtremelyEffectiveText:
	text "It's extremely"
	line "effective!"
	prompt

SuperEffectiveText:
	text "It's super"
	line "effective!"
	prompt

NotVeryEffectiveText:
	text "Ce n'est pas très"
	line "efficace..."
	prompt

MostlyIneffectiveText:
	text "It's mostly"
	line "ineffective…"
	prompt

TookDownWithItText:
	text "<TARGET>'s"
	line "bond took"

	para "<USER>"
	line "down with it!"
	prompt

RageBuildingText:
	text "La Frenesie de"
	line "<USER>"
	cont "augmente!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "en a encore!"
	prompt

SharedPainText:
	text "Les adversaires"
	line "partagent les"
	cont "dégâts!"
	prompt

SwappedAbilitiesText:
	text "The battlers"
	line "swapped abilities!"
	prompt

SwappedItemsText:
	text "The battlers"
	line "swapped items!"
	prompt

ChangeIntoTypeText:
	text "Change into what"
	line "move's type?"
	prompt

InvalidTypeChangeText:
	text "You can't choose"
	line "that move's type!"
	prompt

SketchedText:
	text "<USER>"
	line "sketched"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER> is"
	line "trying to take its"
	cont "opponent with it!"
	prompt

BellChimedText:
	text "Une cloche sonne!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "s'endort!"
	prompt

AlreadyAsleepText:
	text "<TARGET> is"
	line "already asleep!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "est empoisonné!"
	prompt

BadlyPoisonedText:
	text "<TARGET> is"
	line "badly poisoned!"
	prompt

AlreadyPoisonedText:
	text "<TARGET> is"
	line "already poisoned!"
	prompt

SuckedHealthText:
	text "l'énergie de"
	line "<TARGET>"
	cont "est aspirée!"
	prompt

DreamEatenText:
	text "Le rêve de"
	line "<TARGET>"
	cont "est dévoré!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "brûle!"
	prompt

AlreadyBurnedText:
	text "<TARGET> is"
	line "already burned!"
	prompt

WontRiseAnymoreText:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer2
	text " won't go"
	cont "any higher!"
	prompt

WontDropAnymoreText:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer2
	text " won't go"
	cont "any lower!"
	prompt

StatRoseText:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer2
	text " rose!"
	prompt

StatRoseSharplyText:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer2
	text " rose"
	cont "sharply!"
	prompt

StatRoseDrasticallyText:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer2
	text " rose"
	cont "drastically!"
	prompt

StatFellText:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer2
	text " fell!"
	prompt

StatHarshlyFellText:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer2
	text " harshly"
	cont "fell!"
	prompt

StatSeverelyFellText:
	text "<USER>'s"
	line ""
	text_ram wStringBuffer2
	text " severely"
	cont "fell!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "s'enfuit!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "a peur et fuit!"
	prompt

HitNTimesText:
	text "Hit "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " time"
	text_plural
	text "!"
	prompt

MistText:
	text "<USER>"
	line "s'entoure d'une"
	cont "Brume!"
	prompt

ProtectedByItemText:
	text "<TARGET> is"
	line "protected by"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

ProtectedByMistText:
	text "<TARGET> is"
	line "protected by mist."
	prompt

GettingPumpedText:
	text_pause
	text "<USER> is"
	line "getting pumped!"
	prompt

RecoilText:
	text "<USER> is"
	line "hit with recoil!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "crée un Clone!"
	prompt

HasSubstituteText:
	text "<USER>"
	line "a un Clone!"
	prompt

TooWeakSubText:
	text "Trop faible pour"
	line "créer un Clone!"
	prompt

SubTookDamageText:
	text "Le Clone prend"
	line "les dégâts pour"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "Le Clone de"
	line "<TARGET>"
	cont "s'évanouit!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "est infecté!"
	prompt

EvadedText:
	text "<TARGET>"
	line "évite l'attaque!"
	prompt

WasDisabledText:
	text "<TARGET>'s"
	line ""
	text_ram wStringBuffer2
	text " was"
	cont "disabled!"
	prompt

CoinsScatteredText:
	text "Une pluie de"
	line "pièces!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "became the"
	cont ""
	text_ram wStringBuffer1
	text "-type!"
	prompt

EliminatedStatsText:
	text "Tout changement de"
	line "statut éliminé!"
	prompt

TransformedText:
	text "<USER>"
	line "transformed into"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

TrickRoomText:
	text "<USER>"
	line "twisted the"
	cont "dimensions!"
	prompt

TrickRoomEndedText:
	text "The twisted"
	line "dimensions"

	para "returned to"
	line "normal!"
	prompt

LightScreenEffectText:
	text "<USER>'s"
	line "Sp.Def rose!"
	prompt

ReflectEffectText:
	text "La défense de"
	line "<USER>"
	cont "augmente!"
	prompt

NothingHappenedText:
	text "Mais rien ne se"
	line "passe."
	prompt

ButItFailedText:
	text "Mais cela échoue!"
	prompt

DidntAffectText:
	text "It didn't affect"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "Points de Vie de"
	line "<USER>"
	cont "au max!"
	prompt

DraggedOutText:
	text "<USER>"
	line "est traîné de"
	cont "force au combat!"
	prompt

ParalyzedText:
	text "<TARGET> is"
	line "paralyzed! It"
	cont "might not attack!"
	prompt

FullyParalyzedText:
	text "<USER> is"
	line "fully paralyzed!"
	done

AlreadyParalyzedText:
	text "<TARGET> is"
	line "already paralyzed!"
	prompt

ProtectedByText:
	text "<TARGET> is"
	line "protected by"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

RegainedStatsWithItem:
	text "<USER>"
	line "regained stats"
	cont "with "
	text_ram wStringBuffer1
	text "!"
	prompt

CuredInfatuationWithItem:
	text "<USER>"
	line "cured infatuation"
	cont "with "
	text_ram wStringBuffer1
	text "!"
	prompt

CuredEncoreWithItem:
	text "<USER>"
	line "cured Encore"
	cont "with "
	text_ram wStringBuffer1
	text "!"
	prompt

CuredDisableWithItem:
	text "<USER>"
	line "cured Disable"
	cont "with "
	text_ram wStringBuffer1
	text "!"
	prompt

StoleText:
	text "<USER>"
	line "stole "
	text_ram wStringBuffer1
	cont "from its foe!"
	prompt

KnockedOffItemText:
	text "<USER>"
	line "knocked off"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "ne peut pas"
	cont "s'échapper!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "est dégelé!"
	prompt

PutACurseText:
	text "<USER>"
	line "sacrifie ses PV..."

	para "...et maudit"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "se met à l'Abri!"
	prompt

ProtectingItselfText:
	text "<TARGET> is"
	line "protecting itself!"
	done

SpikesText:
	text "Des Picots s'épar-"
	line "pillent autour de"
	cont "<TARGET>!"
	prompt

ToxicSpikesText:
	text "Toxic spikes"
	line "scattered around"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identifie"
	cont "<TARGET>!"
	prompt

StartPerishSongText:
	text "#mon that heard"
	line "the song will"
	cont "faint in 3 turns!"
	prompt

StartPerishBodyText:
	text "Les deux #mon"
	line "sont K.O. dans..."
	cont "3 tours!!!"
	prompt

SandstormBrewedText:
	text "Une tempête de"
	line "sable se prépare!"
	prompt

HailStartedText:
	text "It started to"
	line "hail!"
	prompt

BracedItselfText:
	text "<USER>"
	line "rassemble ses"
	cont "forces!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "est amoureux!"
	prompt

CoveredByVeilText:
	text "<USER> is"
	line "covered by a veil!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "est protégé par"
	cont "Rune Protect!"
	prompt

MagnitudeText:
	text "Magnitude "
	text_decimal wTextDecimalByte, 1, 2
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "est relâché par"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "lance Vampigraine!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "lance les Picots!"
	prompt

BlewToxicSpikesText:
	text "<USER>"
	line "blew away Toxic"
	cont "Spikes!"
	prompt

DownpourText:
	text "It started"
	line "to rain!"
	prompt

SunGotBrightText:
	text "The sunlight"
	line "turned harsh!"
	prompt

BellyDrumText:
	text "<USER>"
	line "sacrifie ses PV et"
	cont "monte son attaque"
	cont "au max!"
	prompt

BellyDrumContraryText:
	text "<USER>"
	line "cut its HP and"
	cont "minimized Attack!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "prévoit une"
	cont "attaque!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "ignore les ordres!"
	prompt

BecameHealthyText:
	text "<USER>"
	line "became healthy!"
	prompt

PlayerAffectionEndureText:
	text "<USER>"
	line "toughed it out so"

	para "<PLAYER>"
	line "wouldn't feel sad!"
	prompt

EnemyAffectionEndureText:
	text "<USER>"
	line "toughed it out so"

	para "<ENEMY>"
	line "wouldn't feel sad!"
	prompt

PlayerAffectionEvasionText:
	text "<USER>"
	line "avoided the move"

	para "in time with"
	line "<PLAYER>'s"
	cont "shout!"
	prompt

EnemyAffectionEvasionText:
	text "<USER>"
	line "avoided the move"

	para "in time with"
	line "<ENEMY>'s"
	cont "shout!"
	prompt

PlayerAffectionSelfCureText:
	text "<USER>"
	line "became healthy so"

	para "<PLAYER>"
	line "wouldn't worry!"
	prompt

EnemyAffectionSelfCureText:
	text "<USER>"
	line "became healthy so"

	para "<ENEMY>"
	line "wouldn't worry!"
	prompt

AffectionCriticalText: ; same for both player and enemy
	text "<USER>"
	line "landed a critical"

	para "hit, wishing to be"
	line "praised!"
	prompt

NotifyAirBalloonText:
	text "<USER>"
	line "floats in the air"
	cont "with "
	text_ram wStringBuffer1
	text "!"
	prompt

TraceActivationText:
	text "<USER>"
	line "traced"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_IntimidateResisted:
	text "<TARGET>'s"
	line ""
	text_ram wStringBuffer1

	para "protects it from"
	line "Intimidate!"
	prompt

NotifyCloudNine:
	text "The weather was"
	line "suppressed!"
	prompt

NotifyPressure:
	text "<USER> is"
	line "exerting its"
	cont "pressure!"
	prompt

NotifyMoldBreaker:
	text "<USER>"
	line "breaks the mold!"
	prompt

NotifyUnnerve:
	text "<TARGET> is"
	line "too afraid to eat"
	cont "Berries!"
	prompt

NotifyNeutralizingGas:
	text "Neutralizing gas"
	line "filled the area!"
	prompt

FriskedItemText:
	text "<USER>"
	line "frisked its foe"

	para "and found a"
	line ""
	text_ram wStringBuffer1
	text "!"
	prompt

PickedItemText:
	text "<USER>"
	line "picked up"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

HarvestedItemText:
	text "<USER>"
	line "harvested"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

FirePoweredUpText:
	text "<USER>'s"
	line "Fire-type moves"
	cont "were powered up!"
	prompt

AngerPointMaximizedAttackText:
	text "<USER>"
	line "maxed its Attack!"
	prompt

CannotUseText:
	text "<TARGET>"
	line "cannot use"
	cont ""
	text_ram wStringBuffer1
	text "!"
	prompt

ShudderedText:
; since the ability works with the opponent move data,
; it is on the opponent turn mostly
	text "<TARGET>"
	line "shuddered!"
	prompt

ForewarnText:
	text "<TARGET>"
	line "has "
	text_ram wStringBuffer1
	text "!"
	prompt

BouncedBackText:
	text "<USER>"
	line "bounced the"
	cont ""
	text_ram wStringBuffer1
	text " back!"
	prompt

ItemCantBeStolenText:
	text "<TARGET>'s"
	line "item cannot be"
	cont "stolen!"
	prompt

SuckedUpOozeText:
	text "<USER>"
	line "sucked up the"
	cont "liquid ooze!"
	prompt

BattleText_EnemyWithdrew::
	text "<ENEMY>"
	line "withdrew"
	cont ""
	text_ram wEnemyMonNickname
	text "!"
	prompt

BattleText_WentBackToPlayer:
	text "<USER> went"
	line "back to <PLAYER>!"
	prompt

BattleText_WentBackToEnemy:
	text "<USER>"
	line "went back to"
	cont "<ENEMY>!"
	prompt

ScaredText:
	text "<USER> is too"
	line "scared to move!"
	prompt

GetOutText:
	text "Ghost: Get out…"
	line "Get out…"
	prompt

CalFinalPkmnText:
CarrieFinalPkmnText:
JackyFinalPkmnText:
EunaFinalPkmnText:
	text "I still have one"
	line "#mon!"
	prompt

FalknerFinalPkmnText:
	text "The wind is"
	line "finally with us!"
	prompt

BugsyFinalPkmnText:
	text "Even though it's"
	line "my last #mon,"

	para "Bug #mon are"
	line "tough!"
	prompt

WhitneyFinalPkmnText:
	text "H-hey! Just one"
	line "left? But…"

	para "I ain't losin',"
	line "you hear?"
	prompt

MortyFinalPkmnText:
	text "I still believe"
	line "we can do it!"
	prompt

ChuckFinalPkmnText:
	text "We haven't lost"
	line "yet!"
	prompt

JasmineFinalPkmnText:
	text "Well-tempered"
	line "steel will hang on"
	cont "to the very last!"
	prompt

PryceFinalPkmnText:
	text "Humph… You are"
	line "quite the Trainer."
	prompt

ClairFinalPkmnText:
	text "One last #mon?"
	line "This is where the"
	cont "real fight begins!"
	prompt

WillFinalPkmnText:
	text "We Psychics don't"
	line "give up until we"
	cont "reach zero!"
	prompt

KogaFinalPkmnText:
	text "Fwahaha! I've been"
	line "counting on this"

	para "one from the very"
	line "beginning!"
	prompt

BrunoFinalPkmnText:
	text "Fight as hard as"
	line "you can 'til you"
	cont "faint!"
	prompt

KarenFinalPkmnText:
	text "This is far from"
	line "being backed into"
	cont "a corner!"
	prompt

ChampionFinalPkmnText:
	text "All right! I"
	line "thought this would"
	cont "never happen!"
	prompt

BrockFinalPkmnText:
	text "Ah ha ha!"
	line "It itches!"
	prompt

MistyFinalPkmnText:
	text "Hmm… You're"
	line "pretty good…"
	prompt

LtSurgeFinalPkmnText:
	text "It's not over yet."
	line "It's just getting"
	cont "started!"
	prompt

ErikaFinalPkmnText:
	text "Don't go easy on"
	line "me. Give me every-"
	cont "thing you've got!"
	prompt

JanineFinalPkmnText:
	text "You've got a great"
	line "battle technique!"
	prompt

SabrinaFinalPkmnText:
	text "What will happen"
	line "after this?"
	cont "I already know."
	prompt

BlaineFinalPkmnText:
	text "I'll show you the"
	line "spirit of my cave"
	cont "Gym!"
	prompt

BlueFinalPkmnText:
	text "Heh heh heh…"
	line "You're unprepared"

	para "for this. We'll"
	line "knock you down!"
	prompt

RedFinalPkmnText: ; text > text
LeafFinalPkmnText:
	text "………………"
	prompt

Rival1_1FinalPkmnText:
	text "…Humph!"
	line "You're doing OK"
	cont "for someone weak."
	prompt

Rival1_2FinalPkmnText:
	text "Say, you've got a"
	line "lot of nerve,"
	cont "coming here…"
	prompt

Rival1_3FinalPkmnText:
	text "Out of despera-"
	line "tion, weak people"

	para "sometimes do OK"
	line "at fighting back."
	prompt

Rival1_4FinalPkmnText:
	text "Hey, hey!"
	line "Why so serious?"
	prompt

Rival1_5FinalPkmnText:
	text "I see. Seems like"
	line "it wasn't just luck"

	para "that's gotten you"
	line "this far."
	prompt

Rival2_1FinalPkmnText:
	text "I see. You weren't"
	line "coming to Kanto"
	cont "just to show off…"
	prompt

Rival2_2FinalPkmnText:
	text "Why?! I've still"
	line "got one left!"
	prompt

Lyra1_1FinalPkmnText:
	text "You've never had a"
	line "#mon battle"
	cont "before, have you?"

	para "I could explain,"
	line "but you'll learn"

	para "more from exper-"
	line "ience."

	para "Do your best,"
	line "<PLAYER>!"
	prompt

Lyra1_2FinalPkmnText:
	text "You're learning"
	line "quickly, <PLAYER>!"
	prompt

Lyra1_3FinalPkmnText:
	text "OK! Time for my"
	line "last #mon!"
	prompt

Lyra1_4FinalPkmnText:
	text "Whether I win or"
	line "lose, this has"
	cont "been fun!"
	prompt

Lyra2_1FinalPkmnText:
	text "You've brought me"
	line "down to my last"
	cont "#mon…"
	prompt

Proton1FinalPkmnText:
	text "Seriously, you'd"
	line "chase me this far?"
	prompt

Proton2FinalPkmnText:
	text "Everywhere we go,"
	line "someone always"
	cont "disagrees with us…"
	prompt

Petrel1FinalPkmnText:
	text "What? Am I"
	line "losing?"
	prompt

Petrel2FinalPkmnText:
	text "Hey, you're good!"
	prompt

Archer1FinalPkmnText:
	text "We can't have you"
	line "getting in the way"

	para "before Giovanni"
	line "rejoins us!"
	prompt

Archer2FinalPkmnText:
	text "Ah, you are indeed"
	line "strong, but…"
	cont "I wonder…"
	prompt

Ariana1FinalPkmnText:
	text "Wh… Wha… Why are"
	line "you so strong?!"
	prompt

Ariana2FinalPkmnText:
	text "Hey, what do you"
	line "think you're"
	cont "doing?!"
	prompt

Giovanni1FinalPkmnText:
	text "My #mon is"
	line "invincible!"
	prompt

Giovanni2FinalPkmnText:
	text "Don't tell me some"
	line "inexperienced kid"

	para "can possibly be"
	line "that strong!"
	prompt

ProfOakFinalPkmnText:
	text "Hm! Excellent!"
	line "But we aren't"
	cont "done yet!"
	prompt

ProfElmFinalPkmnText:
	text "It's almost"
	line "over…"
	prompt

ProfIvyFinalPkmnText:
	text "I'm down, but"
	line "not out!"
	prompt

MysticalManFinalPkmnText:
	text "Time for a dra-"
	line "matic comeback!"
	prompt

KarateKingFinalPkmnText:
	text "Yaaarggh!"
	prompt

PalmerFinalPkmnText:
	text "Bravo!"
	prompt

ThortonFinalPkmnText:
	text "Wow!"
	prompt

JessieJamesFinalPkmnText:
	text "We have a proud"
	line "tradition of fail-"
	cont "ure to uphold!"
	prompt

LoreleiFinalPkmnText:
	text "You only got a"
	line "taste of my power!"
	prompt

AgathaFinalPkmnText:
	text "Don't assume that"
	line "you've won, child!"
	prompt

StevenFinalPkmnText:
	text "I knew you would"
	line "be strong…"
	prompt

CynthiaFinalPkmnText:
	text "I won't let this"
	line "end yet!"
	prompt

InverFinalPkmnText:
	text "You're getting the"
	line "hang of this!"
	prompt

CherylFinalPkmnText:
	text "I can't keep up"
	line "with healing…"
	prompt

RileyFinalPkmnText:
	text "Your team! I sense"
	line "your strong aura!"
	prompt

BuckFinalPkmnText:
	text "Now this! This is"
	line "a smoking-hot sit-"
	cont "uation!"
	prompt

MarleyFinalPkmnText:
	text "…My time with you"
	line "is drawing to a"
	cont "close."
	prompt

MiraFinalPkmnText:
	text "Oh, no! You're"
	line "too much for me!"
	prompt

AnabelFinalPkmnText:
	text "Your talent…"
	line "It's real."
	prompt

DarachFinalPkmnText:
	text "My last stand!"
	line "Allez!"
	prompt

CaitlinFinalPkmnText:
	text "Even at this time,"
	line "I should stay cool"
	cont "and collected…"
	prompt

CandelaFinalPkmnText:
	text "Down to the wire!"
	line "How exciting!"
	prompt

BlancheFinalPkmnText:
	text "I am certainly"
	line "impressed so far."
	prompt

SparkFinalPkmnText:
	text "You're good!"
	line "No doubt about it!"
	prompt

FlanneryFinalPkmnText:
	text "Um… what should"
	line "I do now?"
	prompt

MayleneFinalPkmnText:
	text "This isn't the"
	line "end, my friend!"
	prompt

MarlonFinalPkmnText:
	text "Awww, dude…"

	para "I know I'm about"
	line "done, but I'm still"
	cont "just so pumped up!"
	prompt

ValerieFinalPkmnText:
	text "Oh my…"
	prompt

KukuiFinalPkmnText:
	text "My soul burns hot,"
	line "yeah!"
	prompt

PiersFinalPkmnText:
	text "I don't do encores,"
	line "get it?"

	para "Not songs…"
	line "Not moves…"
	cont "Not #mon!"
	prompt

LarryFinalPkmnText:
	text "I always output"
	line "my best results"

	para "when it's crunch"
	line "time."
	prompt

BillFinalPkmnText:
	text "Yeehah!"
	line "What a battle!"
	prompt

YellowFinalPkmnText:
	text "My last #mon…"
	line "Lend me your"
	cont "power!"
	prompt

WalkerFinalPkmnText:
	text "We can still fly!"
	prompt

ImakuniFinalPkmnText:
	text "I'm running away!"
	line "…I can't?"
	prompt

LawrenceFinalPkmnText:
	text "Inconceivable!"
	prompt

ReiFinalPkmnText:
	text "I'm not done yet."
	prompt
