L937e:
  call remove_waves

  ld hl,UNPACKED_LEVEL
  ld bc,$0258		; 30x20=600

L937e_0:
  ld a,(hl)
  cp $10
  jr c,L937e_3

  cp $20
  jr z,L937e_3

  inc a

  cp $15
  jr nz,L937e_1

  ld a,$20

L937e_1:
  cp $1c
  jr nz,L937e_2

  ld a,$20

L937e_2:
  ld (hl),a

L937e_3:
  inc hl
  dec bc

  ld a,b
  or c
  jr nz,L937e_0

  ret
