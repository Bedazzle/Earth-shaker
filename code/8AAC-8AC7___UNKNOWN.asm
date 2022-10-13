sub_8AAC:
	ld      hl, $50FF		; last cell of screen bitmap
	ld      b, 8

loc_8AB1:
	push    bc
	push    hl
	ld      b, $1F
	rl      (hl)
	ld      a, (hl)
	dec     hl

loc_8AB9:
	rl      (hl)
	dec     hl
	djnz    loc_8AB9

	dec     hl
	pop     hl
	ld      bc, $0100
	add     hl, bc
	pop     bc
	djnz    loc_8AB1

	ret
