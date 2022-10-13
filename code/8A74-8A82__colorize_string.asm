colorize_string:
	push    af
	push    de
	push    bc

	call    find_attr_HL

	pop     bc
	pop     de
	pop     af
	ld      (hl), a
	inc     c
	dec     d
	jr      nz, colorize_string

	ret
