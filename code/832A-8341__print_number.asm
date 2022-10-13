print_number:
	push    de
	ld      a, (hl)
	rlca
	rlca
	rlca
	ld      de, FONT_start + $180      ; font digits
	add     a, e
	ld      e, a
	push    bc
	push    hl

	call    show_spritecell

	pop     hl
	pop     bc
	pop     de
	dec     c
	dec     hl
	dec     d
	jr      nz, print_number

	ret
