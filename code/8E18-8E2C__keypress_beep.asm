keypress_beep:
  push bc
  push de
  di
  ld d,$00
  xor a

loop_keybeep:
  ld e,d

beep_delay:
  dec e
  jr nz,beep_delay

  out ($fe),a
  xor $18
  dec d
  jr nz,loop_keybeep

  ei
  pop de
  pop bc

  ret
