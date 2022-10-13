show_congratulations:
	call    congrats_pic
	call    congratulations
	call    colorize_congra
	call    play_welldone_music

	xor     a
	ld      (unk_FD7E), a

	ld      a, 1
	ld      (LEVEL_NO), a

	ret
