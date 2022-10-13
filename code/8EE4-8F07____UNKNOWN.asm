sub_8EE4:
	call    sub_8EB6

	di
	ld      d, 1
	xor     a

loc_8EEB:
	ld      e, d
	ld      bc, 4

loc_8EEF:
	dec     e
	jr      nz, loc_8EF7

	xor     $18
	out     ($FE), a
	ld      e, d

loc_8EF7:
	djnz    loc_8EEF

	dec     c
	jr      nz, loc_8EEF

	push    af

	push    de
	call    animate_attrs
	pop     de

	pop     af
	inc     d
	jr      nz, loc_8EEB

	ei

	ret
