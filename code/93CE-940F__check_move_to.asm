check_move_to:
  push hl
  ld hl,is_down_pressed_1
  ld (word_FD87),hl
  pop hl

  ld a,OBJECT.CRYSTAL
  cp (hl)
  jr nz,check_goodies

  call crystal_collected

  jp is_down_pressed_1

check_goodies:
  ld a,OBJECT.TIME
  cp (hl)
  jp z,add_time_units

  ld a,OBJECT.WAVE
  cp (hl)
  jp z,L914c

  ld a,OBJECT.ANTIGRAV
  cp (hl)
  jp z,La7c7

  ld a,OBJECT.MONITOR
  cp (hl)
  ret z

  ld a,OBJECT.BOTTLE
  cp (hl)
  jp z,drink_bottle

  ld a,OBJECT.TELEPORT
  cp (hl)
  jp z,L941f

  ld a,OBJECT.BUBBLE
  cp (hl)
  jp z,L946b

  ld a,OBJECT.FIRE
  cp (hl)
  jp z,kill_player

  ret
