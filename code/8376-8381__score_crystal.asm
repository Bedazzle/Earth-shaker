score_crystal:
	ld      a, (CRYSTAL_PRICE)
	ld      b, a

loop_crystal:
	push    bc

	call    increase_score

	pop     bc
	djnz    loop_crystal

	ret
