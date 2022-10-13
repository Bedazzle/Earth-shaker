scroller_and_main:
	call    clear_screen_part
	call    show_scores
	call    scroller

	push    af

	call    clear_screen_part
	call    print_main_menu
	call    color_menu_text
	pop     af

	ret
