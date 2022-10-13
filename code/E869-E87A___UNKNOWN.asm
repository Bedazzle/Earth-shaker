Le869:
  ld a,$05
  cp (hl)
  jr nz,Le869_0

  pop af
  ret

Le869_0:
  ld a,$06
  cp (hl)
  jr nz,Le869_1

  ld a,$ff
  ld (IS_WALKING),a
Le869_1:
  ret