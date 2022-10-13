show_gameover:
  call fade_attributes
  call print_game_over
  call play_gameover_music

loop_key_gameover:
  call KEY_SCAN
  inc e
  jr z,loop_key_gameover

  ret
