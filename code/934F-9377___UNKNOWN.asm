L934f:
  push hl
  ld de,$fdc6
  sbc hl,de
  pop hl

  ret c

  push hl
  ld de,$001e
  sbc hl,de

  ld a,(hl)
  cp $06
  jr z,L934f_1

  or a
  jr z,L934f_1

  cp $0f
  jr z,L934f_0

  pop hl

  ret

L934f_0:
  call L9378
  pop hl

  jp L9410

L934f_1:
  ld (hl),$0e
  pop hl

  jp L9410
