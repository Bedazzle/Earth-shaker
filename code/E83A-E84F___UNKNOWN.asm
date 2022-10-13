Le83a:
  ld a,(Le7a8)
  or a
  jr nz,Le83a_0

  ld a,(Le82e)
  or a
  jr z,Le83a_1

Le83a_0:
  call L8228
  ret

Le83a_1:
  ld a,(byte_7FFF)

  jp L8253
