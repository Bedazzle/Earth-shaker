L95a4:
  push hl
  ld de,COLOR_EARTH
  sbc hl,de
  ld de,$001e
  ld b,$15
L95a4_0:
  sbc hl,de
  jr nz,L95a4_1
  pop hl
  ret
L95a4_1:
  djnz L95a4_0
  pop hl
  push hl
  inc hl
  ld a,(hl)
  cp $06
  jr z,L95a4_3
  or a
  jr z,L95a4_3
  cp $0f
  jr z,L95a4_2
  pop hl
  ret
L95a4_2:
  call L9378
  pop hl
  jp L9410
L95a4_3:
  ld (hl),$0e
  nop
  jp L9980