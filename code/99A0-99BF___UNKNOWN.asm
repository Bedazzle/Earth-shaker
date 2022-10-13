L99a0:
  ld de,UNPACKED_LEVEL
  sbc hl,de
  ld de,$001e
  ld b,$15
L99a0_0:
  sbc hl,de
  jr nz,L99a0_1
  jr L99a0_2
L99a0_1:
  djnz L99a0_0
  pop hl
  push hl
  dec hl
  dec hl
  ld a,(hl)
  or a
  jr nz,L99a0_3
L99a0_2:
  ld (hl),$20
L99a0_3:
  pop hl
  jp L9410