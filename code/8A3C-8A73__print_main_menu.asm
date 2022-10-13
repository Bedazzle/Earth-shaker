print_main_menu:
	ld      hl, str_startgame ; "1 ..... START GAME"
	ld      d, $12
	ld      bc, $0B04
	call    print_string

	ld      hl, str_redefine ; "2 ..... REDEFINE KEYS"
	ld      d, $15
	ld      bc, $0D04
	call    print_string

	call    print_menu_controls
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

	ld      hl, str_quitgame ; "5 ..... QUIT GAME"
	ld      d, $11
	ld      bc, $1304
	call    print_string

	ld      hl, str_michaelbatty ; "    (C) 1990 MICHAEL BATTY       "
	ld      d, $20
	ld      bc, $1700
	call    print_string

	ret
