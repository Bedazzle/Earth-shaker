time_to_score:
  di
  ld d,$00

loop_convert:
  push de
  call play_scoretime
  call decrease_timeline
  call increase_score
  call print_scoreinfo
  pop de
  dec d

  ld a,($52c0)		; timeline start address
  or a
  jr nz,loop_convert

  ei

  ret
