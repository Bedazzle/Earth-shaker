music_score:
	call    play_gamma

	push    bc
	ld      b, 20
	push    hl
	push    bc
	push    de
	push    af

	call    loop_score_inc

	pop     af
	pop     de
	pop     bc
	pop     hl

	ret
