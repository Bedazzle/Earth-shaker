L95d5:
  push hl
  ld de,UNPACKED_LEVEL
  sbc hl,de
  ld de,$001e
  ld b,$15
L95d5_0:
  sbc hl,de
  jr nz,L95d5_1
  pop hl
  ret
L95d5_1:
  djnz L95d5_0
  pop hl
  push hl
  dec hl
  ld a,(hl)
  cp $06
  jr z,L95d5_3
  or a
  jr z,L95d5_3
  cp $0f
  jr z,L95d5_2
  pop hl
  ret
L95d5_2:
  call L9378
  pop hl
  jp L9410
L95d5_3:
  ld (hl),$0e
  nop
  jp L99a0
