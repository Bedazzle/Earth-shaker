print_scoreinfo:
	ld      b, $17
	ld      c, $1F
	ld      hl, SCORE
	ld      d, 6

	call    print_number

	ret
