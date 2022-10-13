show_level_map:
	call    draw_border
	call    draw_map_picture
	call    draw_map_colors
	call    play_map_music

	ret
  
MAP_IS_SHOWN:
  db $00


reset_map_flag:
  xor a
  ld (MAP_IS_SHOWN),a
  ld (IS_PLAYER_KILLED),a

  ret
