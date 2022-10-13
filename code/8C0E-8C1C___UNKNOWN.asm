sub_8C0E:
	push    bc
	ld      c, 30		;$1E

some_pause:
	ld      b, 0

loc_8C13:
	djnz    $

	dec     c
	jr      nz, some_pause

	pop     bc

	call    sub_8964

	ret
