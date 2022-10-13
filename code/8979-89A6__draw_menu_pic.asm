draw_menu_pic:
	ld      c, 0

loc_897B:
	push    bc

	call    sub_8C0E

	push    hl
	pop     de
	ld      a, d
	add     a, $73
	ld      d, a

loc_8985:
	push    bc
	push    de
	push    hl
	
	push    hl	; same as  ex de, hl
	pop     bc
	push    de
	pop     hl
	push    bc
	pop     de	; optimize these push's/pop's
	
	ld      bc, $20
	ldir

	pop     hl
	pop     de
	pop     bc
	inc     c

	call    sub_8964

	ld      a, $48
	cp      h
	jr      nz, loc_8985

	pop     bc
	inc     c
	ld      a, $40
	cp      c
	jr      nz, loc_897B

	ret
