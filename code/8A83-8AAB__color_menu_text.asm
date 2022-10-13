color_menu_text:
	ld      a, $44
	ld      d, $12
	ld      bc, $0B04
	call    colorize_string

	ld      a, $46
	ld      d, $15
	ld      bc, $0D04
	call    colorize_string

	ld      a, $46
	ld      d, $18
	ld      bc, $1104
	call    colorize_string

	ld      a, $44
	ld      d, $16
	ld      bc, $1304
	call    colorize_string

	ret
