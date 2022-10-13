walking_sound:
  ld a,(IS_WALKING)
  cp $ff
  call z,play_walk_beep

  ret
