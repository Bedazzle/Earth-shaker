animate_teleport_in:
  di
  xor a
  ld b,$10
  ld hl,$00ff
  ld de,$00ff

animate_teleport_in_0:
  push bc
  ld bc,$0010

animate_teleport_in_1:
  dec e
  jr nz,animate_teleport_in_2

  xor $18
  out ($fe),a
  ld e,l

animate_teleport_in_2:
  dec d
  jr nz,animate_teleport_in_3

  xor $18
  out ($fe),a
  ld d,h

animate_teleport_in_3:
  djnz animate_teleport_in_1

  dec c
  jr nz,animate_teleport_in_1

  push bc
  push hl
  push de
  push af

  call teleport_in

  pop af
  pop de
  pop hl
  pop bc
  pop bc
  djnz animate_teleport_in_0

  ei

  ret
