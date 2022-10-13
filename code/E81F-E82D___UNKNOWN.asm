Le81f:
  cp (hl)
  jr z,Le81f_0
  pop af
  ret
Le81f_0:
  ld (hl),$02
  push af
  ld a,$ff
  ld (Le82e),a
  pop af
  ret
