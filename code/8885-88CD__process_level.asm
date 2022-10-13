process_level:
  ld hl,PLAYER_ALIVE
  ld (hl),$00

  call reset_counters

loop_game_cycle:
  ld hl,KEY_PRESSED
  ld (hl),$00

  call is_fire_pressed
  call player_to_map
  call check_level_quit
  call validate_unpacked
  call L8da6
  call check_map_show
  call animate_exit_flash
  call La773
  call check_timeout
  call check_quit_screen

  ld a,(PLAYER_ALIVE)
  or a
  ret nz

  ld a,(IS_PLAYER_KILLED)
  or a
  jr z,check_if_exit

  call show_killed_player
  call play_ouch

  ret

check_if_exit:
  ld a,(EXIT_STATUS)
  or a
  jr z,go_game_cycle

  call time_to_score

  ret

go_game_cycle:
  jr loop_game_cycle			; optimize by removing
