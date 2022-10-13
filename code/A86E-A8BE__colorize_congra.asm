colorize_congra:
	ld      a, 4
	ld      d, $1A
	ld      bc, $0703
	call    colorize_string

	ld      a, 5
	ld      d, $1F
	ld      bc, $0901
	call    colorize_string

	ld      a, 5
	ld      d, 8
	ld      bc, $0B0A
	call    colorize_string

	ld      a, 3
	ld      d, $20
	ld      bc, $0D00
	call    colorize_string

	ld      a, 3
	ld      d, $1C
	ld      bc, $0F02
	call    colorize_string

	ld      a, 3
	ld      d, $20
	ld      bc, $1100
	call    colorize_string

	ld      a, 6
	ld      d, $1E
	ld      bc, $1501
	call    colorize_string

	ld      a, 6
	ld      d, $09
	ld      bc, $1716
	call    colorize_string

	ret
