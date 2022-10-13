play_xxx_beep:
	ld      hl, $0046
	ld      de, $0001

loc_8242:
	push    hl
	push    de
	call    BEEPER
	pop     de
	pop     hl
	dec     hl

	ld      a, $32
	cp      l
	jr      nz, loc_8242

	ret
