check_right_object:
  push hl
  ld hl,is_right_pressed_4
  ld (word_FD87),hl
  pop hl

  ld a,OBJECT.CRYSTAL
  cp (hl)
  jr nz,L9494_0

  call crystal_collected
  jp is_right_pressed_4

L9494_0:
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
  jp z,L9518

  ld a,OBJECT.BUBBLE
  cp (hl)
  jp z,L95a4

  ld a,OBJECT.FIRE
  cp (hl)
  jp z,kill_player

  ret
