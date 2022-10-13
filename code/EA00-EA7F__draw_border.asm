draw_border:
	ld      c, $1E

loop_hor_border:
	ld      b, 0
	ld      de, BORDER_TOP

	push    bc
	call    show_spritecell
	pop     bc

	ld      b, $15
	ld      de, BORDER_BOTTOM

	push    bc
	call    show_spritecell
	pop     bc

	dec     c
	jr      nz, loop_hor_border

	ld      b, $14

loop_ver_border:
	ld      c, 0
	ld      de, BORDER_RIGHT

	push    bc
	call    show_spritecell
	pop     bc

	ld      c, $1F
	ld      de, BORDER_LEFT

	push    bc
	call    show_spritecell
	pop     bc

	djnz    loop_ver_border

	ld      b, $15

loc_EA33:
	ld      c, 0
	ld      a, $43
	ld      d, 1

	push    bc
	call    colorize_string
	pop     bc

	ld      c, $1F
	ld      d, 1

	push    bc
	call    colorize_string
	pop     bc

	djnz    loc_EA33

	ld      bc, $0000
	ld      de, BORDER_TOPLEFT
	call    show_spritecell

	ld      bc, $1500
	ld      de, BORDER_BOTLEFT
	call    show_spritecell

	ld      bc, $151F
	ld      de, BORDER_BOTRIGHT
	call    show_spritecell

	ld      bc, $1F
	ld      de, BORDER_TOPRIGHT
	call    show_spritecell

	ld      a, $43
	ld      bc, $0000
	ld      d, $20
	call    colorize_string

	ld      bc, $1501
	ld      d, $1E
	call    colorize_string

	ret
