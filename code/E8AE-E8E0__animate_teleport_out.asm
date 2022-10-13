animate_teleport_out:
  di
  xor a
  ld b,$10
  ld hl,$f1f2
  ld de,$f1f2

animate_teleport_out_0:
  push bc
  ld bc,$0010

animate_teleport_out_1:
  dec e
  jr nz,animate_teleport_out_2

  xor $18
  out ($fe),a
  ld e,l

animate_teleport_out_2:
  dec d
  jr nz,animate_teleport_out_3

  xor $18
  out ($fe),a
  ld d,h

animate_teleport_out_3:
  djnz animate_teleport_out_1

  dec c
  jr nz,animate_teleport_out_1

  push bc
  push hl
  push de
  push af

  call teleport_out

  pop af
  pop de
  pop hl
  pop bc
  pop bc
  djnz animate_teleport_out_0

  ei

  ret
