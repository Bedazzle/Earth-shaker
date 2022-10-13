L914c:
  ld b,$0c

L914c_0:
  push bc

  call check_timeout

  ld a,(PLAYER_ALIVE)
  cp $ff
  jr nz,L914c_1

  pop bc
  ret

L914c_1:
  pop bc
  djnz L914c_0

  ret
