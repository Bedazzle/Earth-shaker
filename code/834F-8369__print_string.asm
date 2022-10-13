print_string:
	push    de
	push    hl
	push    bc
	ld      b, (hl)
	ld      de, 8
	ld      hl, FONT_start

scan_font:
	add     hl, de
	djnz    scan_font

	push    hl
	pop     de
	pop     bc

	call    show_spritecell

	pop     hl
	pop     de
	inc     c
	inc     hl
	dec     d
	jr      nz, print_string

	ret
