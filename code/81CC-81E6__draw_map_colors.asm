draw_map_colors:
	ld      hl, $FFFF
	ld      b, $14

loc_81D1:
	ld      c, $1E

loc_81D3:
	ld      de, L_9A80
	ld      a, (hl)
	push    hl
	add     a, e
	ld      e, a

	call    sub_EAB3

	nop
	nop
	pop     hl
	dec     hl
	dec     c
	jr      nz, loc_81D3

	djnz    loc_81D1

	ret
