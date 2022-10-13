blink_string:
    push bc

	ld      a, 1
	ld      d, $14
	ld      bc, $0406
	call    colorize_string

	call    play_bleep

	ld      a, 7
	ld      d, $14
	ld      bc, $0406
	call    colorize_string

	call    play_xxx_beep

	pop     bc
	djnz    blink_string

	ret
