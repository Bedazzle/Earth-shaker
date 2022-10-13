	ld      hl, $0080
loc_92C7:
	ld      de, $0001
	push    hl
	call    BEEPER
	pop     hl
	dec     l
	jr      nz, loc_92C7
	di
	ret