draw_map_picture:
	ld      hl, $FFFF
	ld      b, $14		; 20 rows

loc_805E:
	ld      c, $1E		; ld e, $16
	ld      d, $9A		; sbc a,d
	ld      a, (hl)
	rlca
	rlca
	rlca
	ld      e, a

	push    hl
	push    bc
	call    sub_E9AE
	pop     bc
	pop     hl

	dec     hl
	dec     c
	jr      nz, loc_805E+1

	djnz    loc_805E

	ret
