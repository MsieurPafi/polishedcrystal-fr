SoulHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  9, LAVENDER_TOWN, 6
	warp_event  5,  9, LAVENDER_TOWN, 6
	warp_event  4,  2, SOUL_HOUSE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  7, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AgathaScript, -1
	object_event  4,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujiScript, -1 ; TODO: EVENT_SOUL_HOUSE_MR_FUJI
	object_event  7,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseTeacherText, -1
	object_event  2,  7, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseLassText, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseGrannyText, -1

	object_const_def
	const SOULHOUSE_AGATHA

AgathaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_AGATHA
	iftruefwd AgathaAfterScript
	writetext AgathaSeenText
	waitbutton
	closetext
	winlosstext AgathaBeatenText, 0
	setlasttalked SOULHOUSE_AGATHA
	loadtrainer AGATHA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_AGATHA
	opentext
	writetext AgathaRewardText
	promptbutton
	verbosegivetmhm TM_SHADOW_CLAW
	setevent EVENT_GOT_TM65_SHADOW_CLAW_FROM_AGATHA
AgathaAfterScript:
	jumpthisopenedtext

	text "I expect great"
	line "things from you,"
	cont "if you will them."
	done

MrFujiScript:
	faceplayer
	opentext
	writetext MrFujiText
	waitbutton
	checkevent EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	iftrue_endtext
	writetext MrFujiGiveSilphScopeText
	waitbutton
	verbosegivekeyitem SILPHSCOPE2
	writetext MrFujiUseThisText
	waitbutton
	setevent EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	endtext

MrFujiText:
	text "M.Fuji:"
	line "Bienvenue à toi."

	para "Hmm... Tu as l'air"
	line "d'être un dresseur"

	para "de #mon doux"
	line "et attentionné."

	para "Ceux qui aiment"
	line "les #mon vien-"

	para "nent ici saluer"
	line "leur âme."

	para "Tu peux présenter"
	line "ici tes condoléan-"
	cont "ces."

	para "Cela leur fera"
	line "plaisir."
	done

MrFujiGiveSilphScopeText:
	text "Here, I have"
	line "a gift for you."

	para "Please, take it."
	done

MrFujiUseThisText:
	text "You may use that"
	line "to help ease the"

	para "souls of any"
	line "restless #mon."
	done

SoulHouseTeacherText:
	text "Il y a d'autres"
	line "tombes de #mon"
	cont "ici, je crois."

	para "Beaucoup de pièces"
	line "ne sont réservées"
	cont "qu'à M.Fuji."
	done

SoulHouseLassText:
	text "J'suis venue avec"
	line "ma môman pour voir"
	cont "les tombes de"
	cont "#mon..."
	done

SoulHouseGrannyText:
	text "Les #mon que"
	line "j'ai perdus..."

	para "Je les aimais com-"
	line "me mes petits-"
	cont "enfants..."
	done

AgathaSeenText:
	text "Agatha: Hello,"
	line "child."

	para "My name is"
	line "Agatha."

	para "I fought for years"
	line "as a member of"
	cont "the Elite Four."

	para "…………"

	para "Have you come to"
	line "mourn a #mon?"

	para "It might not be"
	line "here any longer."

	para "Mr.Fuji kept many"
	line "of the graves"
	cont "elsewhere after"

	para "the radio company"
	line "took over."

	para "…………"

	para "He could have"
	line "fought to preserve"
	cont "the tower! But he"

	para "wouldn't get"
	line "involved. Too"

	para "scared of abusing"
	line "his influence."

	para "That old fool…"

	para "Power is meant to"
	line "be used!"

	para "You clearly"
	line "understand me."

	para "I'll show you"
	line "what a powerful"
	cont "trainer can do!"
	done

AgathaBeatenText:
	text "Oh, my!"
	done

AgathaRewardText:
	text "You're quite"
	line "something, child."

	para "A strong trainer"
	line "with a deep"

	para "connection to"
	line "your #mon."

	para "Here, take this"
	line "TM!"
	done
