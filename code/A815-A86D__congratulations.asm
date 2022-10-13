congratulations:
	ld      hl, str_welldone ; "WELL DONE ... AND THANKS !"
	ld      d, $1A
	ld      bc, $0703
	call    print_string

	ld      hl, str_mustbeworth ; "I MUST BE WORTH A SMALL FORTUNE"
	ld      d, $1F
	ld      bc, $0901
	call    print_string

	ld      hl, str_bynow      ; "BY NOW !"
	ld      d, $08
	ld      bc, $0B0A
	call    print_string

	ld      hl, str_unfortunately ; "UNFORTUNATELY YOU AREN'T GETTING"
	ld      d, $20
	ld      bc, $0D00
	call    print_string

	ld      hl, str_anyofit ; "ANY OF IT ! WELL, YOU DIDN'T"
	ld      d, $1C
	ld      bc, $0F02
	call    print_string

	ld      hl, str_riskyourneck ; " RISK YOUR NECK COLLECTING IT ! "
	ld      d, $20
	ld      bc, $1100
	call    print_string

	ld      hl, str_hopeyouenjoyed ; "HOPE YOU ENJOYED EARTHSHAKER ."
	ld      d, $1E
	ld      bc, $1501
	call    print_string

	ld      hl, str_batty    ; "- M.BATTY"
	ld      d, $09
	ld      bc, $1716
	call    print_string

	ret
