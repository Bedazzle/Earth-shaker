play_map_music:
	ld      hl, MUSIC_MAP
	call    muz_player

	ret
