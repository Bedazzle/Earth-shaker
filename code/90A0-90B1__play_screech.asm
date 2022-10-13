play_screech:
  ld hl,$0000
  ld de,$0001

play_screech_0:
  push hl
  ld l,(hl)
  push de

  call BEEPER

  pop de
  pop hl
  dec l
  jr nz,play_screech_0

  ret
