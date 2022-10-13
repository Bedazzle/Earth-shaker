sub_8EB6:
	ld      bc, $0406
	ld      e, $43

loc_8EBB:
	ld      a, e
	ld      d, 1

	push    bc
	call    colorize_string
	pop     bc

	inc     e
	ld      a, e

	cp      $48
	jr      nz, loc_8ECB

	ld      e, $41

loc_8ECB:
	inc     c
	ld      a, c
	cp      $1A
	jr      nz, loc_8EBB

	ret
