GoldenrodFlowerShop_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  6,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FlowerShopGentlemanText, EVENT_FLORIA_AT_SUDOWOODO

	object_const_def
	const GOLDENRODFLOWERSHOP_TEACHER

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .SellMulch
	checkevent EVENT_FLORIA_AT_SUDOWOODO
	iftruefwd .MetFloria
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer GoldenrodFlowerShopTeacherStopMySisterText
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherBetterThanWhitneyText
	promptbutton
	verbosegivekeyitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	end

.MetFloria:
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	promptbutton
	verbosegivekeyitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	end

.SellMulch:
	faceplayer
	opentext
	writetext WoukdYouLikeMulchText
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy10
	jumpthisopenedtext

	text "Please come again!"
	done

.Buy1:
	checkmoney YOUR_MONEY, 200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MULCH
	iffalse_jumpopenedtext NoRoomForMulchText
	takemoney YOUR_MONEY, 200
	sjumpfwd .Done

.Buy10:
	checkmoney YOUR_MONEY, 2000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MULCH, 10
	iffalse_jumpopenedtext NoRoomForMulchText
	takemoney YOUR_MONEY, 2000

.Done:
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	itemnotify
	jumpthisopenedtext

	text "Thank you!"
	line "Please come again!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Well… Excuse me,"
	line "but you're short"
	cont "of money."
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "x 1    ¥200@"
	db "x10   ¥2000@"
	db "Cancel@"

FlowerShopFloriaScript:
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	checkevent EVENT_FOUGHT_SUDOWOODO
	iffalse_jumptextfaceplayer GoldenrodFlowerShopFloriaYouBeatWhitneyText
	checkitem MULCH
	iftrue_jumptextfaceplayer DescribeMulchText
	jumpthistextfaceplayer

	text "So that jiggly"
	line "tree really was a"
	cont "#mon!"
	done

GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "As-tu vu l'arbre"
	line "qui gigote sur la"
	cont "route 36?"

	para "Ma petite soeur"
	line "a absolument tenu"
	cont "à aller le voir..."

	para "Ça m'inquiète..."
	line "N'est-ce pas"
	cont "dangereux?"
	done

GoldenrodFlowerShopTeacherStopMySisterText:
	text "My little sister"
	line "got all excited"

	para "and went to see"
	line "the wiggly tree…"

	para "I'm worried… Can"
	line "you please stop"

	para "her from getting"
	line "hurt by it?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "Tu veux aussi"
	line "emprunter la"

	para "bouteille?"
	line "Je ne veux pas que"

	para "tu fasses quelque"
	line "chose de dangereux"
	cont "avec ça."
	done

GoldenrodFlowerShopTeacherBetterThanWhitneyText:
	text "Oh, you're better"
	line "than Whitney."

	para "Do you know about"
	line "that wiggly tree?"

	para "If you wet it with"
	line "a water bottle, it"
	cont "attacks."

	para "But since you"
	line "have some Badges,"
	cont "you should be OK."
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Oh, you're better"
	line "than Whitney…"

	para "You'll be OK,"
	line "then. Here's my"
	cont "water bottle!"
	done

GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "Ne fais rien de"
	line "dangereux!"
	done

GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "Quand j'ai parlé"
	line "de l'arbre qui"

	para "gigote à ma"
	line "soeur, elle a dit"
	cont "que c'était dange-"
	cont "reux."

	para "Si je bats blanche"
	line "elle me prêtera"

	para "sa bouteille!"
	line "C'est sûr!"
	done

GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Wow, you beat"
	line "Whitney? Cool!"

	para "Maybe you can take"
	line "care of the jiggly"
	cont "tree."

	para "You'll just need a"
	line "water bottle like"
	cont "my sis has."
	done

WoukdYouLikeMulchText:
	text "Care to buy some"
	line "Mulch?"

	para "It makes Berries"
	line "grow faster!"
	done




NoRoomForMulchText:
	text "Oh no, your Bag"
	line "is full!"
	done

DescribeMulchText:
	text "Our Mulch is a"
	line "mix of high-qual-"

	para "ity soil and #-"
	line "mon's… er… you"

	para "know. It's full"
	line "of nutrients!"
	done

FlowerShopGentlemanText:
	text "I've been working"
	line "late a lot recent-"
	cont "ly, so I'm buying"

	para "some flowers for"
	line "my wife."
	done
