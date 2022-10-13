show_main_menu:
	ld      hl, $4000
	ld      de, $4001
	ld      bc, $1800
	ld      (hl), COLOR.BLACK + PAPER.BLACK
	ldir				; clear screeen bitmap

	ld      bc, $02FF
	ld      (hl), COLOR.WHITE + PAPER.BLACK + COLOR.BRIGHT	;$47
	ldir				; clear screen attributes

	ld      hl, $5AFF
	ld      (hl), 0

	call    print_main_menu
	call    color_menu_text
	call    show_menu_pic

	ret
