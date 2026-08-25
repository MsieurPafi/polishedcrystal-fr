AlanAnswerPhoneText:
	text "Yup, it's "
	text_ram wStringBuffer3
	text "!"

	para "Is this <PLAYER>?"
	line "Good morning!"
	done

AlanAnswerPhoneDayText:
	text "Yup, it's "
	text_ram wStringBuffer3
	text "!"

	para "Is that <PLAYER>?"
	done

AlanAnswerPhoneNiteText:
	text "Yup, it's "
	text_ram wStringBuffer3
	text "!"

	para "Is that <PLAYER>?"
	line "Good evening!"
	done

AlanGreetText:
	text "Hello! It's me,"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

AlanGreetDayText:
	text "Hello! It's me,"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

AlanGreetNiteText:
	text "Hello! It's me,"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

AlanGenericText:
	text "<PLAYER>, tu"
	line "entraînes bien"
	cont "tes #mon?"

	para "J'ai lu qu'il faut"
	line "entraîner ses"

	para "#mon avec amour"
	line "et attention."
	done
