L946b:
  push hl
  ld de,$ffe2
  sbc hl,de
  pop hl
  ret nc

  push hl
  ld de,$001e
  add hl,de
  nop

  ld a,(hl)
  cp $06
  jr z,L946b_1

  or a
  jr z,L946b_1

  cp $0f
  jr z,L946b_0

  pop hl

  ret

L946b_0:
  call L9378

  pop hl

  jp L9410

L946b_1:
  ld (hl),$0e
  pop hl

  jp L9410
