L8253:
  or a
  ld a,a
  jr z,L8253_0

  call Le7a9

  ret

L8253_0:
  ld a,(byte_7FFE)
  or a
  ret z

  call Le7a9

  ret
