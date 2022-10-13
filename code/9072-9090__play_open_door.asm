play_open_door:
  di
  ld hl,$0180

play_open_door_0:
  ld c,(hl)
  and $7f
  ld b,$08

play_open_door_1:
  xor a
  out (BORDER),a

  ld e,c
play_open_door_2:
  dec e
  jr nz,play_open_door_2

  ld a,$18
  out (BORDER),a

  ld e,l
play_open_door_3:
  dec e
  jr nz,play_open_door_3
  djnz play_open_door_1

  dec l
  jr nz,play_open_door_0

  ei

  ret
