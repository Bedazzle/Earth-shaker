load_level:
	call    unpack_level

	ld      hl, (word_FDA0)
	ld      (ADDR_EARTH), hl

	ld      hl, (GFX_SET)
	ld      (ADDR_ICEBLOCK), hl

	ld      de, COLOR_EXIT

	ld      a, (de)
	inc     de
	ld      hl, EXIT_COLORED
	call    set_spr_colors

	ld      a, (de)
	inc     de
	ld      hl, BOULDER_COLORED
	call    set_spr_colors

	ld      a, (de)
	inc     de
	ld      hl, BRICKS_COLORED
	call    set_spr_colors

	ld      a, (de)
	inc     de
	ld      hl, EARTH_COLORED
	call    set_spr_colors

	ret
