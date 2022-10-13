congrats_pic:
	call    fade_attributes

	ld      hl, PLAYER1_COLORED
	ld      (ADDR_PLAYER1), hl
	ld      a, OBJECT.PLAYER1
	ld      bc, $020F
	call    colored_sprite

	ld      a, OBJECT.CRYSTAL
	ld      bc, $0212
	call    colored_sprite

	ld      bc, $020C
	ld      a, OBJECT.CRYSTAL
	call    colored_sprite

	ret
