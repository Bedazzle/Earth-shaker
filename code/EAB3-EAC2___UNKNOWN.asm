sub_EAB3:
	cp      $90
	jr      nc, loc_EABD
	call    find_attr_HL
	ld      a, (de)
	ld      (hl), a
	ret

loc_EABD:
	call    find_attr_HL
	xor     a
	ld      (hl), a
	ret  