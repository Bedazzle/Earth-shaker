sub_A63E:
	ld      hl, L9620
	ld      (word_FD87), hl
	cp      $0F
	ret     c

	pop     hl
	pop     hl
	pop     bc

	ret