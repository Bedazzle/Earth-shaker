scroller:
	ld      hl, SCROLLER_START

loc_8AEE:
	ld      a, $F7
	out     ($FF), a

	in      a, ($FE)
	and     $1F
	cp      $1F
	ret     nz

	push    hl
	ld      b, 8

loc_8AFC:
	push    bc

	call    sub_8AAC

	ld      de, $0500

loc_8B03:
	dec     de
	ld      a, d
	or      e
	jr      nz, loc_8B03

	pop     bc
	djnz    loc_8AFC

	pop     hl
	push    hl
	ld      bc, $171F
	ld      d, 1

	call    print_string

	pop     hl
	inc     hl
	ld      de, SCROLLER_END
	sbc     hl, de
	ret     z

	add     hl, de

	jr      loc_8AEE
