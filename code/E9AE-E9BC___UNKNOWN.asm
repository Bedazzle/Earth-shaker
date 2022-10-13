sub_E9AE:
	cp      $80
	call    c, show_spritecell
	ret

	cp      $90
	ret     nc

	call    find_attr_HL
	ld      a, (de)
	ld      (hl), a
	ret