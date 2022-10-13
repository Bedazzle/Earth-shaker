show_spritecell:
	ld      a, b
	and     $F8
	add     a, $40
	ld      h, a
	ld      a, b
	and     7
	rrca
	rrca
	rrca
	add     a, c
	ld      l, a
	push    bc
	ld      b, 8

loop_copy_cell:
	ld      a, (de)
	ld      (hl), a
	inc     h
	inc     de
	djnz    loop_copy_cell

	pop     bc

	ret
