increase_digit:
	ld      a, (hl)
	inc     a
	ld      (hl), a
	cp      $0A
	ret     nz

	ld      (hl), 0
	dec     hl
	djnz    increase_digit

	ret

increase_score:
	ld      hl, SCORE
	ld      b, 6

	call    increase_digit

	ret
