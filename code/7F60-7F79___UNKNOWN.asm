L7f60:
  ld hl,$fd05
  ld de,$000f
L7f60_0:
  add hl,de
  djnz L7f60_0

  ld de,unk_FD94
  ld c,$06
L7f60_1:
  ld a,(de)
  cp (hl)
  ret c

  jr z,L7f60_2

  ret
L7f60_2:
  inc hl
  inc de
  dec c
  jr nz,L7f60_1

  ret
