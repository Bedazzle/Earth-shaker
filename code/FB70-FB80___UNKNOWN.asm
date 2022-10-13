sub_FB70:
	ld      hl, $FAE0

	ld      a, (COUNTER_4)
	or      a
	jr      z, loc_FB7D

	ld      b, a

loc_FB7A:
	add     hl, de
	djnz    loc_FB7A

loc_FB7D:
	ld      (COLORED_SPRITES), hl

	ret
