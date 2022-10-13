find_attr_HL:
	ld      a, b
	sra     a
	sra     a
	sra     a
	add     a, $58
	ld      h, a
	ld      a, b
	and     7
	rrca
	rrca
	rrca
	add     a, c
	ld      l, a

	ret
