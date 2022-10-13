L9abc:
  push af
  ld a,(L_9AA5)
  or a
  jr z,L9abc_0
  pop af
  ret
L9abc_0:
  ld a,$ff
  ld (IS_PLAYER_KILLED),a
  pop af
  ret