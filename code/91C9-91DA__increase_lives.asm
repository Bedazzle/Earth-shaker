increase_lives:
	ld      a, (LIVES)
	cp      9
	jr      z, no_lives_inc

	inc     a

no_lives_inc:
	ld      (LIVES), a
	call    print_info_numbers

	call    music_score

	ret
