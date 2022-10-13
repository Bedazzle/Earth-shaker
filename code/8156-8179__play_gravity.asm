play_gravity:
  ld c,$a0

play_gravity_0:
  ld a,c
  add a,$3c
  ld l,a
  ld h,$00
  ld de,$0002

play_gravity_1:
  push de
  push hl
  push bc

  call BEEPER

  pop bc
  pop hl
  pop de

  dec l
  ld a,l
  cp c
  jr nz,play_gravity_1

  dec c
  dec c
  dec c
  dec c
  dec c
  dec c
  dec c
  dec c
  jr nz,play_gravity_0

  ret
