Le78c:
  push hl
  push de
  ld de,$003c
  add hl,de
  ld a,$20
  cp (hl)
  jr z,Le78c_0
  xor a
  cp (hl)
  jr z,Le78c_0
  ld a,$ff
  ld (Le7a8),a
Le78c_0:
  pop de
  pop hl
  ld a,$ff
  ld (byte_7FFF),a
  ret