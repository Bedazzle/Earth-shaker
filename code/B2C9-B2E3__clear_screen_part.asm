clear_screen_part:
	ld      c, $20	; 32

loop_scr_part:
	push    bc
	ld      b, $15	; 21

loop_vertically:
	push    bc
	ld      de, EMPTYSPRITE_COLORED
	call    show_spritecell

	pop     bc
	dec     b
	ld      a, b
	cp      8
	jr      nz, loop_vertically

	pop     bc
	dec     c
	ld      a, c
	cp      $FF
	jr      nz, loop_scr_part

	ret
