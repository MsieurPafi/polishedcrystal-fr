LakeOfRage_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlyPoint
	callback MAPCALLBACK_OBJECTS, LakeOfRageWesleyAndEngineer
	callback MAPCALLBACK_TILES, LakeOfRageFloodScript

	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1
	warp_event 10, 28, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 21, 27, BGEVENT_JUMPTEXT, LakeOfRageSignText
	bg_event  3, 26, BGEVENT_JUMPTEXT, LakeOfRageAdvancedTipsSignText
	bg_event 25, 31, BGEVENT_READ, LakeOfRageFishingGuruSign
	bg_event  4,  4, BGEVENT_ITEM + RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY
	bg_event 35,  5, BGEVENT_ITEM + MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION
	bg_event 11, 28, BGEVENT_ITEM + FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE
	bg_event 10, 27, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_LAKE_OF_RAGE
	bg_event 11, 27, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_LAKE_OF_RAGE

	def_object_events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 18, 22, SPRITE_BIG_GYARADOS, SPRITEMOVEDATA_BIG_GYARADOS, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageRedGyaradosScript, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event 20, 29, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LakeOfRageEngineerText, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LakeOfRageSuperNerdText, -1
	object_event 25, 29, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, LakeOfRageCooltrainerFText, -1
	itemball_event 13,  2, ELIXIR, 1, EVENT_LAKE_OF_RAGE_ELIXIR
	itemball_event  7, 10, MAX_REVIVE, 1, EVENT_LAKE_OF_RAGE_MAX_REVIVE
	tmhmball_event 35,  2, TM_SUBSTITUTE, EVENT_LAKE_OF_RAGE_TM_SUBSTITUTE
	cuttree_event 18,  9, EVENT_LAKE_OF_RAGE_CUT_TREE_1
	cuttree_event 11, 12, EVENT_LAKE_OF_RAGE_CUT_TREE_2
	cuttree_event  5, 14, EVENT_LAKE_OF_RAGE_CUT_TREE_3
	cuttree_event  6, 21, EVENT_LAKE_OF_RAGE_CUT_TREE_4
	cuttree_event 23,  4, EVENT_LAKE_OF_RAGE_CUT_TREE_5

	object_const_def
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_RED_GYARADOS
	const LAKEOFRAGE_WESLEY

LakeOfRageFlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

LakeOfRageWesleyAndEngineer:
	checkevent EVENT_LAKE_OF_RAGE_CIVILIANS
	iftruefwd .NoEngineer
	moveobject LAKEOFRAGE_LANCE, 18, 29
.NoEngineer
	readvar VAR_WEEKDAY
	ifequalfwd WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	endcallback

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	endcallback

LakeOfRageFloodScript:
	special Special_GetOvercastIndex
	ifequalfwd LAKE_OF_RAGE_OVERCAST, .flood
	changemapblocks LakeOfRage_BlockData
	endcallback

.flood
	changemapblocks LakeOfRageFlooded_BlockData
	endcallback

LakeOfRageSignText:
	text "Lac Colère,"
	line "aussi connu sous"
	cont "le nom de Lac"
	cont "Leviator."
	done

LakeOfRageAdvancedTipsSignText:
	text "Advanced Tips!"

	para "The Hidden Power"
	line "move can take on"
if DEF(FAITHFUL)
	cont "any type, except"
else
	cont "any type, even"
endc

	para "the newly disco-"
	line "vered Fairy type!"
	done

LakeOfRageFishingGuruSign:
	opentext
	writetext .Text
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .Continue
	waitendtext

.Continue:
	promptbutton
	special Special_MagikarpHouseSign
	endtext

.Text:
	text "maison du maître"
	line "pêcheur"
	done

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftruefwd .AskForHelpAgain
	opentext
	writetext .OverheardText
	promptbutton
	faceplayer
	writetext .IntroText
	yesorno
	iffalsefwd .Refused
.Agreed:
	writetext .YesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applyonemovement LAKEOFRAGE_LANCE, teleport_from
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.Refused:
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	jumpthisopenedtext

	text "Oh… Well, if you"
	line "change your mind,"
	cont "please help me."
	done

.AskForHelpAgain:
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalse .Refused
	sjump .Agreed

.OverheardText:
	text "Ce Lac est rempli"
	line "de Leviator et"
	cont "rien d'autre..."

	para "Les Magicarpe ont"
	line "été forcés"
	cont "d'évoluer..."
	done

.IntroText:
	text "Es-tu ici à cause"
	line "de la rumeur?"

	para "Tu es <PLAYER>?"
	line "Moi c'est Peter,"
	cont "un dresseur comme"
	cont "toi."

	para "J'ai entendu"
	line "certaines informa-"
	cont "tions et je suis"
	cont "venu faire mon"
	cont "enquête..."

	para "Je t'ai vu com-"
	line "battre, <PLAYER>."

	para "On peut dire que"
	line "tu as du talent."

	para "Ça te dirait de"
	line "me donner un coup"
	cont "de main?"
	done

.YesText:
	text "Peter: Excellent!"

	para "On dirait que"
	line "quelque chose"
	cont "force les"
	cont "Magicarpe du Lac"
	cont "à évoluer."

	para "Un mystérieux"
	line "signal radio vient"
	cont "d'Acajou."

	para "Je t'y attendrai,"
	line "<PLAYER>."
	done


.QuestionText:
	text "Peter: Hum? Vas-tu"
	line "m'aider?"
	done

LakeOfRageEngineerText:
	text "I'm an urban"
	line "planner."

	para "I've got big ideas"
	line "for this place,"
	cont "just you wait!"

	para "It's the perfect"
	line "spot for my next"
	cont "project."
	done

LakeOfRageRedGyaradosScript:
	opentext
	writetext .GyaradosText
	cry GYARADOS
	pause 15
	closetext
	loadwildmon GYARADOS, GYARADOS_RED_FORM, 35
	loadvar VAR_BATTLETYPE, BATTLETYPE_NEVER_SHINY
	startbattle
	ifequalfwd $1, .Continue
	disappear LAKEOFRAGE_RED_GYARADOS
.Continue:
	reloadmapafterbattle
	opentext
	givekeyitem RED_SCALE
	waitsfx
	writetext .RedScaleText
	special ShowKeyItemIcon
	playsound SFX_KEY_ITEM
	waitbutton
	keyitemnotify
	closetext
	appear LAKEOFRAGE_LANCE
	end

.GyaradosText:
	text "Leviator: Tttooor!"
	done

.RedScaleText:
	text "<PLAYER> found"
	line "Red Scale."
	done

WesleyScript:
	checkevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	iftrue_jumptextfaceplayer .WednesdayText
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	faceplayer
	opentext
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftruefwd .MetWesley
	writetext .MeetText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext .GivesGiftText
	promptbutton
	verbosegiveitem BLACK_BELT
	iffalse_endtext
	setevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	jumpthisopenedtext

	text "Wesley: Black Belt"
	line "beefs up the power"
	cont "of Fighting moves."
	done

.NotWednesday:
	jumpthisopenedtext

	text "Wesley: Today's"
	line "not Wednesday."
	cont "That's too bad."
	done

.MeetText:
	text "Homer: Alors,"
	line "comment va?"

	para "Moi c'est Homer"
	line "du mercredi. Et"

	para "aujourd'hui..."
	line "C'est mercredi!"
	done

.GivesGiftText:
	text "Enchanté de faire"
	line "ta connaissance."
	cont "V'là un souvenir."
	done

.WednesdayText:
	text "Homer: Avant de"
	line "m'avoir trouvé,"

	para "t'as dû rencontrer"
	line "mes frères et"
	cont "soeurs."

	para "Ou alors t'es en"
	line "veine?"
	done

GenericTrainerCooltrainermAaron:
	generictrainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, .SeenText, .BeatenText

	text "#mon and their"
	line "trainer become"

	para "powerful through"
	line "constant battling."
	done

.SeenText:
	text "Si un dresseur"
	line "éclabousse un"

	para "autre dresseur, ça"
	line "fini en duel."

	para "C'est la loi."
	done

.BeatenText:
	text "Whaa..."
	line "Bon combat!"
	done

GenericTrainerCooltrainerfLois:
	generictrainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, .SeenText, .BeatenText

	text "Come to think of"
	line "it, I've seen a"
	cont "pink Butterfree."
	done

.SeenText:
	text "Qu'est-il arrivé"
	line "au Leviator rouge?"

	para "Il est parti?"

	para "Oh, zut! Je suis"
	line "venue pour rien?"

	para "Bon..."
	line "combat!"
	done

.BeatenText:
	text "Pas mal!"
	done

GenericTrainerFisherAndre:
	generictrainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText

	text "I won't lose as an"
	line "angler! I catch"
	cont "#mon all day."
	done

FisherAndreSeenText:
	text "Laisse-moi donc"
	line "combattre avec le"
	cont "#mon que je"
	cont "viens d'attraper!"
	done

FisherAndreBeatenText:
	text "J'suis peut-être"
	line "un bon pêcheur"

	para "mais j'suis un"
	line "mauvais dresseur."
	done

GenericTrainerFisherRaymond:
	generictrainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText

	text "Why can't I catch"
	line "any good #mon?"
	done

FisherRaymondSeenText:
	text "Qu'importe ce que"
	line "je fais, j'attrape"

	para "toujours le même"
	line "#mon..."
	done

FisherRaymondBeatenText:
	text "Ma ligne est toute"
	line "emmêlée..."
	done

LakeOfRageGrampsScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "The Gyarados are"
	line "angry!"

	para "It's a bad omen!"
	done

.Text2:
	text "Hahah! Les"
	line "Magicarpe mordent!"
	done

LakeOfRageSuperNerdText:
	text "On dit que ce Lac"
	line "a été fait par"
	cont "le déchaînement de"
	cont "Leviator."

	para "Je me demande"
	line "s'il y a un lien"

	para "avec leur colère?"
	done

LakeOfRageCooltrainerFText:
	text "J'ai la berlue ou"
	line "quoi? J'ai vu un"
	cont "Leviator rouge"
	cont "dans le Lac..."

	para "Je croyais qu'il"
	line "n'y avait que des"
	cont "Leviator bleus?"
	done
