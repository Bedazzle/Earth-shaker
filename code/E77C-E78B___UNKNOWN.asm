Le77c:
  ld d,$06
Le77c_0:
  ld a,d
  ld (LE74A+1),a		; !!! set SMC

  push de
  call play_falling_beep
  pop de

  dec d
  dec d
  jr nz,Le77c_0

  ret
