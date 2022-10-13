	ld      hl, $0140
loc_92B7:
	ld      de, $0001
	push    hl
	call    BEEPER
	pop     hl
	dec     l
	jr      nz, loc_92B7
	di
	ret