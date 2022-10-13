L9980:
  ld de,COLOR_EARTH
  sbc hl,de
  ld de,$001e
  ld b,$15
L9980_0:
  sbc hl,de
  jr nz,L9980_1
  jr L9980_2
L9980_1:
  djnz L9980_0
  pop hl
  push hl
  inc hl
  inc hl
  ld a,(hl)
  or a
  jr nz,L9980_3
L9980_2:
  ld (hl),$20
L9980_3:
  pop hl
  jp L9410