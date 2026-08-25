ElmPhoneStartText:
	text "<PLAYER>?"

	para "Fais bien"
	line "attention..."

	para "Soigne bien tes"
	line "#mon s'ils sont"
	cont "blessés."
	done

ElmPhoneSawMrPokemonText:
	text "<PLAYER>?"

	para "As-tu rencontré M."
	line "#mon? Super!"
	cont "Reviens vite!"
	done

ElmPhonePokemonStolenText:
	text "<PLAYER>? Je"
	line "suis bien triste."

	para "Un #mon nous"
	line "a été volé."

	para "Qui a bien pu"
	line "faire ça?"
	prompt

ElmPhoneCheckingEggText:
	text "<PLAYER>?"

	para "On examine l'Oeuf."
	line "C'est bien un Oeuf"
	cont "de #mon."
	prompt

ElmPhoneAssistantText:
	text "<PLAYER>?"

	para "As-tu rencontré"
	line "mon assistant?"
	cont "Il est au centre"
	cont "#mon de"
	cont "Mauville."
	done

ElmPhoneEggUnhatchedText:
	text "<PLAYER>?"

	para "Comment va l'Oeuf?"
	line "A-t-il changé?"

	para "Appelle-moi si tu"
	line "as du nouveau."
	prompt

ElmPhoneEggHatchedText:
	text "<PLAYER>?"
	line "Comment va l'Oeuf?"

	para "Il a éclos????"
	line "Quel type de"
	cont "#mon est-ce?"

	para "Viens vite me le"
	line "montrer!"
	prompt

ElmPhoneDiscovery1Text:
	text "<PLAYER>?"

	para "J'ai fait une nou-"
	line "velle découverte."

	para "Le temps d'éclo-"
	line "sion d'un Oeuf"
	cont "dépend du #mon."
	prompt

ElmPhoneDiscovery2Text:
	text "<PLAYER>?"

	para "Les capacités des"
	line "#mon sortant"

	para "d'un Oeuf restent"
	line "un mystère."

	para "Nous faisons nos"
	line "recherches."
	prompt

ElmPhonePokerusText:
	text "<PLAYER>?"

	para "J'ai découvert un"
	line "drôle de truc."

	para "Il existerait une"
	line "maladie appelée le"

	para "#rus qui"
	line "affecte les"
	cont "#mon."

	para "C'est un peu comme"
	line "un virus..."
	cont "On l'appelle donc"
	cont "#rus."

	para "On sait juste"
	line "qu'il se multiplie"
	cont "rapidement et"
	cont "qu'il infecte"
	cont "d'autres #mon."

	para "Ça n'a pas l'air"
	line "de faire quoi que"

	para "ce soit, et ça"
	line "part tout seul."

	para "On ne devrait pas"
	line "s'inquiéter..."
	cont "C'est tout!"
	cont "Tchao!"
	done

ElmPhoneDisasterText:
	text "<PLAYER>?"
	line "C'est..."
	cont "C'est terrible!"

	para "C'est..."
	line "affreux!"

	para "Que faire?"
	line "Oh, non..."

	para "Reviens vite!"
	done

ElmPhoneEggAssistantText:
	text "Hello, <PLAYER>? We"
	line "discovered some-"

	para "thing about the"
	line "Egg!"

	para "My assistant is at"
	line "the #mon Center"

	para "in Violet City."
	line "Could you talk to"
	cont "him?"
	done

ElmPhoneRocketText:
	text "<PLAYER>, comment"
	line "ça va bien?"

	para "Je t'appelle à"
	line "propos des émis-"

	para "sions radio."
	line "Quelque chose ne"
	cont "va pas."

	para "Elles parlent de"
	line "la Team Rocket."

	para "<PLAYER>, es-tu"
	line "au courant de"
	cont "tout ceci?"

	para "La Team Rocket est"
	line "peut-être de"
	cont "retour."

	para "Ça paraît dingue,"
	line "quand même!"
	done

ElmPhoneGiftText:
	text "<PLAYER>?"

	para "J'ai quelque chose"
	line "pour toi."

	para "Tu peux passer"
	line "au Labo?"

	para "A bientôt!"
	done

ElmPhoneEvolutionQuestionText:
	text "By the way,"
	line "<PLAYER>, want to"

	para "know how your"
	line "#mon evolves?"
	done

ElmPhoneEvoText_None:
	text "Well, "
	text_ram wStringBuffer3
	line "doesn't evolve!"
	prompt

ElmPhoneEvoText_Level:
	text_ram wStringBuffer3
	line "evolves when it"
	cont "reaches level "
	text_decimal wStringBuffer4, 1, 3
	text "."
	prompt

ElmPhoneEvoText_Item:
	text_ram wStringBuffer3
	line "evolves when it's"

	para "exposed to a"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_TradeNoItem:
	text_ram wStringBuffer3
	line "evolves by trade,"

	para "or when exposed to"
	line "a "
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_TradeWithItem:
	text_ram wStringBuffer3
	line "evolves by trade,"

	para "or when gaining a"
	line "level with"
	cont ""
	text_ram wStringBuffer4
	text " held."
	prompt

ElmPhoneEvoText_Holding:
	text_ram wStringBuffer3
	line "evolves when it"
	cont "gains a level"

	para "while holding a"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Holding_MornDay:
	text_ram wStringBuffer3
	line "evolves when it"
	cont "gains a level"

	para "while holding a"
	line ""
	text_ram wStringBuffer4
	text ", but"

	para "only during the"
	line "morning or day."
	prompt

ElmPhoneEvoText_Holding_EveNite:
	text_ram wStringBuffer3
	line "evolves when it"
	cont "gains a level"

	para "while holding a"
	line ""
	text_ram wStringBuffer4
	text ", but"

	para "only during the"
	line "evening or night."
	prompt

ElmPhoneEvoText_Happiness:
	text_ram wStringBuffer3
	line "evolves when it's"
	cont "really happy!"
	prompt

ElmPhoneEvoText_Happiness_MornDay:
	text_ram wStringBuffer3
	line "evolves when it's"
	cont "really happy, but"

	para "only during the"
	line "morning or day."
	prompt

ElmPhoneEvoText_Happiness_EveNite:
	text_ram wStringBuffer3
	line "evolves when it's"
	cont "really happy, but"

	para "only during the"
	line "evening or night."
	prompt

ElmPhoneEvoText_Stat:
	text_ram wStringBuffer3
	line "evolves at level"
	cont ""
	text_decimal wStringBuffer4, 1, 3
	text ", but what it"

	para "evolves into de-"
	line "pends on its"

	para "Attack and"
	line "Defense stats."
	prompt

ElmPhoneEvoText_Location:
	text_ram wStringBuffer3
	line "evolves when it"

	para "gains a level at"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Move:
	text_ram wStringBuffer3
	line "evolves when it"

	para "gains a level"
	line "while it knows"

	para "how to use"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Crit:
	text_ram wStringBuffer3
	line "evolves after it"

	para "lands three crit-"
	line "ical hits in one"
	cont "battle."
	prompt

ElmPhoneEvoText_Party:
	text_ram wStringBuffer3
	line "evolves when it"
	cont "gains a level"

	para "while you have a"
	line ""
	text_ram wStringBuffer4
	text " in"
	cont "your party too."
	prompt

ElmPhoneEvoText_Egg:
	text "Eggs don't evolve,"
	line "they hatch!"
	prompt

ElmPhoneEvoText_Pikachu:
	text_ram wStringBuffer3
	line "evolves when it's"

	para "exposed to a"
	line "ThunderStone or"
	cont "an Odd Souvenir."
	prompt

ElmPhoneEvoText_Gloom:
	text_ram wStringBuffer3
	line "evolves when it's"

	para "exposed to a"
	line "Leaf Stone or"
	cont "a Sun Stone."
	prompt

ElmPhoneEvoText_Poliwhirl:
	text_ram wStringBuffer3
	line "evolves when it's"

	para "exposed to a"
	line "Water Stone, or"

	para "when holding a"
	line "King's Rock, if"

	para "traded, or upon"
	line "leveling up."
	prompt

ElmPhoneEvoText_SlowpokePlain:
ElmPhoneEvoText_SlowpokeGalarian:
	text_ram wStringBuffer3
	line "evolves at level"
	cont "37, or when it"

	para "holds King's Rock"
	line "when traded or"
	cont "gaining a level."
	prompt

ElmPhoneEvoText_Magneton:
	text_ram wStringBuffer3
	line "evolves when it's"

	para "exposed to a"
	line "ThunderStone, or"

	para "when it gains a"
	line "level in a mag-"
	cont "netic field."

	para "I've heard Magnet"
	line "Tunnel and Dim"
	cont "Cave have that."
	prompt

ElmPhoneEvoText_Exeggcute:
	text_ram wStringBuffer3
	line "evolves when it's"

	para "exposed to a"
	line "Leaf Stone or"
	cont "an Odd Souvenir."
	prompt

ElmPhoneEvoText_Koffing:
	text_ram wStringBuffer3
	line "evolves at level"
	cont "35, or when it"

	para "holds Charcoal"
	line "when traded or"
	cont "gaining a level."
	prompt

ElmPhoneEvoText_Cubone:
	text_ram wStringBuffer3
	line "evolves at level"
	cont "28, or when it's"

	para "exposed to an"
	line "Odd Souvenir."
	prompt

ElmPhoneEvoText_Scyther:
	text_ram wStringBuffer3
	line "evolves when it"
	cont "gains a level"

	para "while holding a"
	line "Metal Coat or a"
	cont "Hard Stone."

	para "The Metal Coat"
	line "can also be held"
	cont "while trading."
	prompt

ElmPhoneEvoText_Eevee:
	text_ram wStringBuffer3
	line "evolves in so"
	cont "many ways!"

	para "It can be exposed"
	line "to any of eight"
	cont "different Stones,"

	para "or gain a level"
	line "near a Moss Rock"
	cont "or an Ice Rock."

	para "I've heard Ilex"
	line "Forest and Ice"
	cont "Path have those."

	para "But also, Eevee"
	line "will evolve just"

	para "from the sun or"
	line "moon if it's very"
	cont "happy!"
	prompt

ElmPhoneEvoText_MimeJr:
	text_ram wStringBuffer3
	line "evolves when it's"

	para "exposed to an"
	line "Ice Stone, or"

	para "when it gains a"
	line "level near an"
	cont "Ice Rock."

	para "I've heard there's"
	line "one in Ice Path."
	prompt

ElmPhoneEvoText_Stantler:
	text_ram wStringBuffer3
	line "evolves when it's"

	para "exposed to harsh"
	line "hail or sand."

	para "I've heard Rugged"
	line "Road and Snowtop"

	para "Mountain have"
	line "weather like that."
	prompt

ElmPhoneEvoText_AncientSinnoh:
	text "But based on its"
	line "ancestry, it"

	para "may also evolve"
	line "when reminded"

	para "of ancient Sinnoh…"
	line "somehow…"
	prompt

ElmPhoneEvoText_DunsparceSegments:
	text "Some of them end"
	line "up being longer"
	cont "than others."

	para "It's just in their"
	line "genes."
	prompt

ElmPhoneEvolutionRefusedText:
	text "Sorry to bug you"
	line "then."
	prompt

ElmPhoneEndText:
	text "Take care!"
	done
