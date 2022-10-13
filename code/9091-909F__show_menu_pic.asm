show_menu_pic:
	call    draw_menu_pic

	ld      hl, MENU_PIC_ATTR
	ld      de, ATTRIB
	ld      bc, $100
	ldir

	ret
