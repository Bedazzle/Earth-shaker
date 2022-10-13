init_colors:
	call    load_level

	ld      a, (BOULDER_COLORED)
	ld      hl, BROKBOULDER1_COLORED
	ld      de, $0021
	ld      b, 7

loop_init_colors:
	call    set_spr_colors

	add     hl, de
	djnz    loop_init_colors

	ret
