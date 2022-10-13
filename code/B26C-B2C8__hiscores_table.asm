hiscores_table:
	ld      hl, HISCORES + 5
	ld      b, 5

loop_hiscores:
	push    bc
	push    hl
	ld      c, $0D
	ld      a, 6
	sub     b
	rlca
	add     a, $0A
	ld      b, a
	ld      d, 6

	call    print_number

	pop     hl
	push    hl
	ld      d, 9
	inc     hl
	ld      c, $0F

	call    print_string

	pop     hl
	pop     bc
	ld      de, $0F
	add     hl, de
	djnz    loop_hiscores

	ret


print_hiscores:
	ld      hl, str_hiscores
	ld      d, 9
	ld      bc, $0A0B

	call    print_string
	call    hiscores_table

	ret

show_scores:
	ld      b, 5

colorize_scores:
	push    bc
	ld      c, 8
	ld      a, 6
	sub     b
	rlca
	add     a, $0A
	ld      e, a
	ld      d, $10
	ld      a, COLOR.BRIGHT + COLOR.BLUE
	add     a, b
	ld      b, e

	call    colorize_string

	pop     bc
	djnz    colorize_scores

	call    print_hiscores

	ld      bc, $0A0B
	ld      d, 9
	ld      a, $47
	call    colorize_string
	ret
