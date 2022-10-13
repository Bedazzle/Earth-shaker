loop_score_inc:
	push    bc

	call    increase_score

	pop     bc
	djnz    loop_score_inc

	call    print_scoreinfo

	ret
