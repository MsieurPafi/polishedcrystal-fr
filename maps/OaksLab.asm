OaksLab_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  0,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  1,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  2,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  3,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  6,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  4,  0, BGEVENT_JUMPTEXT, OaksLabPoster1Text
	bg_event  5,  0, BGEVENT_JUMPTEXT, OaksLabPoster2Text
	bg_event  0,  1, BGEVENT_JUMPTEXT, OaksLabPCText

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  7,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, EEVEE, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, EeveeDollScript, EVENT_DECO_EEVEE_DOLL
	object_event  1,  8, SPRITE_AROMA_LADY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant1Text, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant2Text, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant3Text, -1
	object_event  2,  1, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptext, OaksLabPokedexText, -1

	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_EEVEE_DOLL

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftruefwd .GiveStarter
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftruefwd .GiveStarter
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.GiveStarter:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftruefwd .CheckBadges
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iffalsefwd .CheckBadges
	writetext OakLabGiveStarterText
	promptbutton
	waitsfx
	checkevent EVENT_GOT_BULBASAUR_FROM_IVY
	iftruefwd .Charmander
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftruefwd .Squirtle
	givepoke BULBASAUR, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.Charmander:
	givepoke CHARMANDER, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.Squirtle:
	givepoke SQUIRTLE, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.PartyAndBoxFull:
	writetext OakLabPartyAndBoxFullText
	waitbutton
.CheckBadges:
	checkevent EVENT_OPENED_MT_SILVER
	iftruefwd .CheckPokedex
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .BattleOak
	readvar VAR_BADGES
	ifequalfwd 16, .Complain1
	ifequalfwd  8, .Complain2
	writetext OakYesKantoBadgesText
	promptbutton
.CheckPokedex:
	checkkeyitem CATCH_CHARM
	iftruefwd .GotCatchCharm
	writetext OakLabCatchMoreText
	promptbutton
	verbosegivekeyitem CATCH_CHARM
	writetext OakLabCatchCharmText
	waitbutton
.GotCatchCharm
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	checkkeyitem OVAL_CHARM
	iftruefwd .NoOvalCharm
	setval16 NUM_POKEMON
	special CountSeen
	iffalsefwd .NoOvalCharm
	writetext OakLabSeenAllText
	promptbutton
	verbosegivekeyitem OVAL_CHARM
	writetext OakLabOvalCharmText
	waitbutton
.NoOvalCharm
	checkkeyitem SHINY_CHARM
	iftruefwd .NoShinyCharm
	setval16 NUM_POKEMON
	special CountCaught
	iffalsefwd .NoShinyCharm
	writetext OakLabCaughtAllText
	promptbutton
	verbosegivekeyitem SHINY_CHARM
	writetext OakLabShinyCharmText
	waitbutton
.NoShinyCharm
	jumpthisopenedtext

	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

.BattleOak:
	checkevent EVENT_LISTENED_TO_OAK_INTRO
	iftruefwd .HeardIntro
	writetext OakMightBeReadyText
	waitbutton
	setevent EVENT_LISTENED_TO_OAK_INTRO
.HeardIntro:
	writetext OakChallengeText
	yesorno
	iffalsefwd .NotReady
	writetext OakSeenText
	waitbutton
	closetext
	winlosstext OakWinText, 0
	setlasttalked OAKSLAB_OAK
	loadtrainer PROF_OAK, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_BEAT_PROF_OAK
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.NotReady:
	writetext OakRefusedText
	promptbutton
	sjump .CheckPokedex

.Complain1:
	writetext OakNoEliteFourRematchText
	promptbutton
	sjump .CheckPokedex

.Complain2:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

EeveeDollScript:
	turnobject OAKSLAB_OAK, RIGHT
	opentext
	writetext ProfOakEeveeDollTradeText
	waitbutton
	checkitem EVERSTONE
	iffalse_jumpopenedtext NoEverstoneText
	writetext WantToTradeText
	yesorno
	iffalse_jumpopenedtext NoTradeText
	takeitem EVERSTONE
	disappear OAKSLAB_EEVEE_DOLL
	setevent EVENT_DECO_EEVEE_DOLL
	writetext EeveeDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext EeveeDollSentText
	waitbutton
	jumpthisopenedtext

	text "Prof.Oak: Set it"
	line "somewhere you can"
	cont "appreciate it!"
	done

OakWelcomeKantoText:
	text "Chen: Ah, <PLAYER>!"
	line "Merci d'avoir vo-"

	para "yagé jusqu'à"
	line "Kanto."

	para "Que penses-tu des"
	line "dresseurs du coin?"
	cont "Plutôt forts, non?"
	done

OakLabGiveStarterText:
	text "Oak: Oh, so Prof."
	line "Ivy says hello?"

	para "Thanks for convey-"
	line "ing her message,"
	cont "<PLAYER>."

	para "She's a good friend"
	line "of mine."

	para "If she gave you a"
	line "#mon, let me do"
	cont "the same!"

	para "You don't see this"
	line "#mon very often"
	cont "in Kanto or Johto."
	done

OakLabPartyAndBoxFullText:
	text "Hm, you don't have"
	line "room for it, and"
	line "your Box is full."
	done

OakLabDexCheckText:
	text "Et ton #dex?"
	line "Ça avance?"

	para "Voyons ça..."
	done

OakLabCatchMoreText:
	text "I want to thank"
	line "you for being of"

	para "such help with"
	line "filling out the"
	cont "#dex."

	para "Take this as a"
	line "reward for your"
	cont "hard work!"
	done

OakLabCatchCharmText:
	text "Holding a Catch"
	line "Charm will improve"

	para "your chances of a"
	line "critical capture."

	para "That's when your"
	line "# Ball is"

	para "thrown just right"
	line "and is more likely"
	cont "to succeed!"
	done

OakLabSeenAllText:
	text "You've been meeting"
	line "new #mon at a"

	para "good clip, haven't"
	line "you?"

	para "Take this as a"
	line "reward for your"
	cont "hard work!"
	done

OakLabOvalCharmText:
	text "Holding an Oval"
	line "Charm will improve"

	para "your chances of"
	line "finding an Egg at"
	cont "the Day-Care."
	done

OakLabCaughtAllText:
	text "I was completely"
	line "justified in"

	para "giving you that"
	line "#dex."

	para "It is a testament"
	line "to your effort…"

	para "And to the support"
	line "of the many who"
	cont "helped you…"

	para "And to the bonds"
	line "you have built"
	cont "with your #mon!"

	para "Take this as a"
	line "reward for your"
	cont "hard work!"
	done

OakLabShinyCharmText:
	text "Holding a Shiny"
	line "Charm will improve"

	para "your chances of"
	line "finding a shiny"
	cont "#mon!"
	done


OakMightBeReadyText:
	text "Oak: Incredible,"
	line "<PLAYER>!"

	para "You won against"
	line "the Elite Four"
	cont "a second time!"

	para "You just might be"
	line "ready to ascend"
	cont "Mt.Silver."
	done

OakChallengeText:
	text "Oak: Mt.Silver is"
	line "a tall mountain"

	para "that is home to"
	line "many wild #mon."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits."

	para "I'll need to see"
	line "your skills for"
	cont "myself."

	para "Are you ready for"
	line "a battle?"
	done

OakRefusedText:
	text "Oak: Come back"
	line "when you're ready."
	done

OakSeenText:
	text "Oak: Put every-"
	line "thing you have"
	cont "into this battle!"
	done

OakWinText:
	text "I was right in my"
	line "assessment of you!"
	done

OakOpenMtSilverText:
	text "Oak: Spectacular,"
	line "<PLAYER>!"

	para "I'll make arrange-"
	line "ments so that you"

	para "can go to Mt."
	line "Silver."

	para "It's unusual, but"
	line "we can make an"

	para "exception in your"
	line "case, <PLAYER>."

	para "Go up to Indigo"
	line "Plateau. You can"

	para "reach Mt.Silver"
	line "from there."

	para "…"

	para "I let Red train on"
	line "Mt.Silver after"

	para "his first defeat"
	line "as Champion."

	para "But he hasn't"
	line "come back…"
	done

OakNoKantoBadgesText:
	text "Chen: Hmm? Tu ne"
	line "collectionnes pas"
	cont "les Badges des"
	cont "Arènes de Kanto?"

	para "Les Champions"
	line "d'Arène de Kanto"

	para "sont aussi forts"
	line "que ceux de Johto."

	para "Je te conseille de"
	line "les affronter."
	done

OakNoEliteFourRematchText:
	text "Oak: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "Badges of Gyms in"
	cont "Kanto. Well done!"

	para "Now you can cha-"
	line "llenge the Elite"

	para "Four with their"
	line "best #mon."

	para "Keep trying hard,"
	line "<PLAYER>!"
	done

OakYesKantoBadgesText:
	text "Oak: Ah, you're"
	line "collecting Kanto"
	cont "Gym Badges."

	para "I imagine that"
	line "it's hard, but the"

	para "experience is sure"
	line "to help you."

	para "After you earn all"
	line "eight, you can"
	cont "challenge the"

	para "Elite Four at"
	line "their best."

	para "Keep trying hard,"
	line "<PLAYER>!"
	done

OaksAssistant1Text:
	text "La Chronique PKMN"
	line "du Prof à la radio"

	para "ne passe pas ici,"
	line "à Kanto."

	para "C'est bête..."
	line "Je l'aime tant."
	done

OaksAssistant2Text:
	text "Grâce à ton tra-"
	line "vail sur le #-"
	cont "Dex, les recher-"

	para "ches du Prof ont"
	line "bien progressé."
	done

OaksAssistant3Text:
	text "Ne le répète pas,"
	line "mais la Chronique"

	para "#mon du Prof."
	line "Chen n'est pas en"
	cont "direct."
	done

OaksLabPoster1Text:
	text "Appuyer sur Start"
	line "pour le menu."
	done

OaksLabPoster2Text:
	text "l'option sauver"
	line "est sur le menu."

	para "Utilise-la assez"
	line "souvent."
	done

OaksLabPCText:
	text "Il y a un e-mail"
	line "sur le PC."

	para "…"

	para "Prof.Chen, comment"
	line "ça va bien?"
	cont "Ça bosse dur?"

	para "Moi je bosse comme"
	line "un barbare."

	para "On raconte que"
	line "<PLAYER> est une"
	cont "vraie terreur..."

	para "Et dire que c'est"
	line "grâce à nous."

	para "Orme du Bourg Geon"
	line "8-)"
	done

ProfOakEeveeDollTradeText:
	text "Oak: Oh, are you"
	line "admiring my"
	cont "Eevee Doll?"

	para "I'll trade it"
	line "to you for an"
	cont "Everstone."
	done

NoEverstoneText:
	text "But you don't have"
	line "one of those…"
	done

WantToTradeText:
	text "Do you want to"
	line "trade?"
	done

NoTradeText:
	text "It will still be"
	line "here if you change"
	cont "your mind."
	done

EeveeDollText:
	text "<PLAYER> received"
	line "Eevee Doll."
	done

EeveeDollSentText:
	text "Eevee Doll"
	line "was sent home."
	done


OaksLabPokedexText:
	text "It's Prof.Oak's"
	line "#dex."
	done
