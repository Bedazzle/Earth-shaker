animate_attrs:
	ld      a, ($5886)
	ld      hl, $5887
	ld      de, $5886
	ld      bc, $13
	ldir

	ld      ($5899), a

	ret
