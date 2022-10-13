clear_bitmap:
	ld      hl, SCREEN

loop_clear_bmp:
	ld      a, h
	cp      d
	jr      z, next_bmp_line

	srl     (hl)
	inc     hl
	jr      loop_clear_bmp

next_bmp_line:
	djnz    clear_bitmap

	ret
