CeladonGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassMichelle, -1
	object_event  2,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautyJulia, -1
	object_event  6,  5, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerAroma_ladyDahlia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsJoandzoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsJoandzoe2, -1

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_AROMA_LADY_DAHLIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	givebadge RAINBOWBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue_jumpopenedtext ErikaAfterBattleText
	writetext ErikaExplainTMText
	promptbutton
	verbosegivetmhm TM_GIGA_DRAIN
	setevent EVENT_GOT_TM19_GIGA_DRAIN
	jumpthisopenedtext

	text "It is Giga Drain."

	para "It is a wonderful"
	line "move that drains"

	para "half the damage it"
	line "inflicts to heal"
	cont "your #mon."

	para "Please use it if"
	line "it pleases you…"
	done

GenericTrainerLassMichelle:
	generictrainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText

	text "I just got care-"
	line "less, that's all!"
	done

GenericTrainerPicnickerTanya:
	generictrainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText

	text "Oh, look at all"
	line "your Badges. No"

	para "wonder I couldn't"
	line "win!"
	done

GenericTrainerBeautyJulia:
	generictrainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText

	text "How do I go about"
	line "becoming ladylike"
	cont "like Erika?"
	done

GenericTrainerAroma_ladyDahlia:
	generictrainer AROMA_LADY, DAHLIA, EVENT_BEAT_AROMA_LADY_DAHLIA, Aroma_ladyDahliaSeenText, Aroma_ladyDahliaBeatenText

	text "Gloom releases a"
	line "foul fragrance,"

	para "but Erika knows"
	line "how to turn it"

	para "into a sweet"
	line "perfume."
	done

GenericTrainerTwinsJoandzoe1:
	generictrainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe1SeenText, TwinsJoandzoe1BeatenText

	text "Erika will get you"
	line "back for us!"
	done

GenericTrainerTwinsJoandzoe2:
	generictrainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe2SeenText, TwinsJoandzoe2BeatenText

	text "Erika is much,"
	line "much stronger!"
	done

CeladonGymStatue:
	gettrainername ERIKA, 1, STRING_BUFFER_4
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

ErikaBeforeBattleText:
	text "Erika: Bonjour..."
	line "Belle journée,"
	cont "non?"

	para "C'est beau la vie."

	para "Moi je suis Erika,"
	line "Championne de"
	cont "l'Arène de Celado-"
	cont "pole."

	para "...Oh? Tu viens"
	line "de Johto?"
	cont "C'est bien..."

	para "...Quoi? Tu veux"
	line "te battre? Mais il"
	cont "faut le dire!!!"

	para "J'vais te casser"
	line "ta face!!!"
	done

ErikaBeatenText:
	text "Erika: Oh!"
	line "I concede defeat…"

	para "You are remarkably"
	line "strong…"

	para "I shall give you"
	line "the Rainbow Badge…"
	done

ErikaExplainTMText:
	text "Erika: That was a"
	line "delightful match."

	para "I felt inspired."
	line "Please, I wish you"
	cont "to have this TM."
	done


ErikaAfterBattleText:
	text "Erika: Perdre"
	line "fait toujours un"
	cont "peu mal mais..."

	para "Combattre un bon"
	line "adversaire est"
	cont "stimulant..."
	done

LassMichelleSeenText:
	text "Ça t'étonne une"
	line "Arène remplie"
	cont "de filles?"
	done

LassMichelleBeatenText:
	text "Ouiiiiin!"
	done

PicnickerTanyaSeenText:
	text "Un combat?"
	line "Heu...non."
	cont "..."
	cont "Allez, d'accord!"
	done

PicnickerTanyaBeatenText:
	text "C'est fini?"
	done

BeautyJuliaSeenText:
	text "Tu regardes les"
	line "fleurs ou c'est"
	cont "moi que tu mates?"
	done

BeautyJuliaBeatenText:
	text "C'est pas bien!"
	done

Aroma_ladyDahliaSeenText:
	text "There is an in-"
	line "triguing scent"
	cont "around you…"
	done

Aroma_ladyDahliaBeatenText:
	text "The foul scent"
	line "of defeat…"
	done

TwinsJoandzoe1SeenText:
	text "Erika nous a ap-"
	line "pris plein de"
	cont "trucs!"
	done

TwinsJoandzoe1BeatenText:
	text "Oh... On a perdu."
	done

TwinsJoandzoe2SeenText:
	text "On doit protéger"
	line "la grande Erika!"
	done

TwinsJoandzoe2BeatenText:
	text "Nooooonn...."
	done
