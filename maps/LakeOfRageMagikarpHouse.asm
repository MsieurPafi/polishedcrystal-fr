LakeOfRageMagikarpHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftruefwd .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftruefwd .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue_jumpopenedtext MagikarpLengthRaterText_MenInBlack
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setmonval MAGIKARP
	special Special_FindThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	iffalse_jumpopenedtext MagikarpLengthRaterText_NotMagikarp
	ifequalfwd $1, .Refused
	ifequalfwd $2, .TooShort
.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXIR
	iffalsefwd .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	jumpthisopenedtext

	text "Wow! This one is"
	line "outstanding!"

	para "…I wish I could"
	line "say that, but I've"

	para "seen a bigger one"
	line "before."
	done

.Refused:
	jumpthisopenedtext

	text "Oh… So you didn't"
	line "get one good"

	para "enough to show me?"
	line "Maybe next time."
	done

MagikarpLengthRaterText_LakeOfRageHistory:
	text "Le Lac Colère est"
	line "en fait un cratère"

	para "créé par le"
	line "déchaînement des"
	cont "Leviator."

	para "Le cratère s'est"
	line "peu à peu rempli"

	para "d'eau de pluie et"
	line "un Lac s'est"
	cont "formé."

	para "Cette histoire se"
	line "transmet de géné-"

	para "ration en géné-"
	line "ration. Elle vient"
	cont "d'un de mes"
	cont "grands-pères."

	para "On pouvait attra-"
	line "per de vrais"

	para "Magicarpe en"
	line "pleine forme ici!"

	para "Je ne comprends"
	line "pas ce qu'il se"
	cont "passe."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Ce Lac n'est plus"
	line "normal depuis"

	para "l'arrivée des"
	line "hommes en noir."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Le Lac Colère est"
	line "redevenu normal."

	para "Les Magicarpe sont"
	line "de retour."

	para "Mon rêve se"
	line "réalise enfin:"
	cont "voir un monde"
	cont "plein de"
	cont "Magicarpe."

	para "As-tu une canne?"
	line "Aide-moi si tu en"
	cont "as une."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, tu as un"
	line "Magicarpe! Laisse-"

	para "moi voir sa"
	line "taille."
	done

MagikarpLengthRaterText_Memento:
	text "Whaou! Celui-ci"
	line "est démesuré!"

	para "Je te tire mon"
	line "chapeau!"

	para "Accepté ceci en"
	line "récompense!"
	done

MagikarpLengthRaterText_Bonus:
	text "Ce qui est impor-"
	line "tant, c'est d'épa-"

	para "ter les autres!"
	line "Suis mes conseils!"
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Quoi? Ce n'est pas"
	line "un Magicarpe!"
	done
