set_variables:
  ld a,$01
  ld (byte_FD8E),a
  ld (CURRENT_LEVEL),a

  ld a,$04
  ld (LIVES),a

  ld a,$63
  ld (byte_FD90),a

  ret
