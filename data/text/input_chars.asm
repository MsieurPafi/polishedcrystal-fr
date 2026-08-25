; see engine/naming_screen.asm

NameInputLower:
	table_width 1
	rawchar "abcdefghi"
	rawchar "jklmnopqr"
	rawchar "stuvwxyz-"
	rawchar "éàêèçîôû0"
	rawchar "123456789"
	assert_table_length 9 * 5

NameInputUpper:
	table_width 1
	rawchar "ABCDEFGHI"
	rawchar "JKLMNOPQR"
	rawchar "STUVWXYZ "
	rawchar "/()¥<PK><MN>★♥♪"
	rawchar "?!♂♀.,:&%"
	assert_table_length 9 * 5

MailEntry_Uppercase:
	table_width 1
	rawchar "ABCDEFGHIJ"
	rawchar "KLMNOPQRST"
	rawchar "UVWXYZ?!…:"
	rawchar "1234567890"
	rawchar "<PK><MN><PO><KE>&♂♀¥É/"
	assert_table_length 10 * 5

MailEntry_Lowercase:
	table_width 1
	rawchar "abcdefghij"
	rawchar "klmnopqrst"
	rawchar "uvwxyz -.,"
	rawchar "éàêèçîôû()"
	rawchar "ÇÎ'%↑↓№★♥♪"
	assert_table_length 10 * 5

NameInputLowerQwerty:
	table_width 1
	rawchar "qwertyuio"
	rawchar "asdfghjkl"
	rawchar "zxcvbnmp-"
	rawchar "éàêèçîôû0"
	rawchar "123456789"
	assert_table_length 9 * 5

NameInputUpperQwerty:
	table_width 1
	rawchar "QWERTYUIO"
	rawchar "ASDFGHJKL"
	rawchar "ZXCVBNMP "
	rawchar "/()¥<PK><MN>★♥♪"
	rawchar "?!♂♀.,:&%"
	assert_table_length 9 * 5

MailEntryQwerty_Uppercase:
	table_width 1
	rawchar "QWERTYUIOP"
	rawchar "ASDFGHJKL:"
	rawchar "ZXCVBNM?!…"
	rawchar "1234567890"
	rawchar "<PK><MN><PO><KE>&♂♀¥É/"
	assert_table_length 10 * 5

MailEntryQwerty_Lowercase:
	table_width 1
	rawchar "qwertyuiop"
	rawchar "asdfghjkl-"
	rawchar "zxcvbnm,. "
	rawchar "éàêèçîôû()"
	rawchar "ÇÎ'%↑↓№★♥♪"
	assert_table_length 10 * 5
