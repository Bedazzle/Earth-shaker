play_scoretime:
  ld h,$00
  ld l,d
  push de
  ld de,$0001

  call BEEPER

  pop de
  dec d
  dec d
  dec d

  ret
