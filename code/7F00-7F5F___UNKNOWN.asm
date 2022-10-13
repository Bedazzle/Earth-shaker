sub_7F00:
	ld      a, b
	rlca
	add     a, $0A
	ld      hl, $FD0B
	ld      de, $000F

loc_7F0A:
	add     hl, de
	djnz    loc_7F0A

	push    hl
	pop     de
	ld      b, a
	ld      c, $0F

loc_7F12:
	push    bc
	push    de
	call    scan_keyboard
	pop     de
	pop     bc
	inc     hl

	ld      a, (hl)
	cp      $30
	jr      nz, loc_7F3A

	ld      a, c
	cp      $0F
	jr      z, loc_7F26

	dec     de
	dec     c

loc_7F26:
	ld      a, $20
	ld      (de), a
	push    de
	push    bc

	ld      d, 1
	ld      hl, str_enterpassword
	call    print_string

	pop     bc
	pop     de
	call    keypress_beep

	jr      loc_7F12

loc_7F3A:
	cp      $65
	ret     z

	cp      $20
	jr      z, loc_7F49

	cp      $40
	jr      c, loc_7F12

	cp      $5B
	jr      nc, loc_7F12

loc_7F49:
	ld      (de), a
	push    de
	pop     hl
	push    de

	ld      d, 1
	push    bc
	call    print_string

	pop     bc
	pop     de
	call    keypress_beep

	inc     c
	inc     de

	ld      a, c
	cp      $18
	jr      nz, loc_7F12

	ret
