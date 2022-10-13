play_a_level:
  call level_init
loop_level_play:
  call fade_attributes

  xor a
  ld (IS_PLAYER_KILLED),a
  ld (PLAYER_ALIVE),a
  ld (EXIT_STATUS),a

  call do_one_level

  ld a,(EXIT_STATUS)
  or a
  jr nz,level_done

  ld a,(LIVES)
  dec a
  ld (LIVES),a
  or a
  ret z

  jr loop_level_play

level_done:
  ld b,$02
  ld hl,LEVEL_NO
  call increase_digit

  ld a,(CURRENT_LEVEL)
  inc a
  ld (CURRENT_LEVEL),a

  cp 33					; 32 levels in game
  jr nz,next_level

  call show_congratulations

  ld a,$01
  ld (CURRENT_LEVEL),a
next_level:
  jr loop_level_play
