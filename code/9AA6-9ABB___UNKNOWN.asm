L9aa6:
  push af
  xor a
  ld (L_9AA5),a

	NOP_3

  ld a,(hl)
  cp $06
  jr nz,L9aa6_0
  ld a,$ff
  ld (L_9AA5),a
L9aa6_0:
  pop af
  jp L80db