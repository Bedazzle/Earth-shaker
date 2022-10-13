check_menu_quit:
	ld      a, KEYS_54321
	out     ($FF), a

	in      a, (PORT_KEY)
	and     $10				; key 5 (quit game)
	jr      nz, loc_8B72

	jp      ROM_ADDRESS_0

loc_8B72:
	jp      GAME_START
