sub_8964:
	ld      a, c
	and     $38
	rlca
	rlca
	ld      l, a
	ld      a, c
	and     $C0
	rrca
	rrca
	rrca
	or      $40
	ld      h, a
	ld      a, c
	and     7
	or      h
	ld      h, a

	ret
