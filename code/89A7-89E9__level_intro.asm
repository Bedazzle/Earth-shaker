level_intro:
	ld      hl, str_level     ; "LEVEL"
	ld      bc, $060B      ; string position  B=row, C=col
	ld      d, $05            ; string length
	call    print_string

	ld      hl, str_livesleft  ; "LIVES LEFT:"
	ld      bc, $0A09
	ld      d, $0B
	call    print_string

	ld      hl, str_score      ; "SCORE:"
	ld      bc, $0C09
	ld      d, $06
	call    print_string

	ld      hl, SCORE
	ld      bc, $0C15
	ld      d, $06            ; string len
	call    print_number

	ld      hl, LIVES
	ld      bc, $0A15
	ld      d, $01
	call    print_number

	ld      hl, LEVEL_NO
	ld      bc, $0612
	ld      d, $02
	call    print_number

	ret
