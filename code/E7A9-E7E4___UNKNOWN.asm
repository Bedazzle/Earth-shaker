Le7a9:
  di
  ld hl,$010a
  xor a
  out ($fe),a

Le7a9_0:
  ld bc,$0001
  ld d,$01

Le7a9_1:
  ld a,(hl)
  and $3f
  cp d
  jr c,Le7a9_2

  or $07

Le7a9_2:
  sub d
  ld e,a

Le7a9_3:
  dec e
  jr nz,Le7a9_4

  ld a,$18
  out ($fe),a
  jr Le7a9_5

Le7a9_4:
  djnz Le7a9_3

  dec c
  jr nz,Le7a9_3
  jr Le7a9_8

Le7a9_5:
  ld e,d

Le7a9_6:
  dec e
  jr nz,Le7a9_7

  xor a
  out ($fe),a
  jr Le7a9_1

Le7a9_7:
  djnz Le7a9_6

  dec c
  jr nz,Le7a9_6

Le7a9_8:
  dec l
  jr nz,Le7a9_0

  dec h
  jr nz,Le7a9_0

  ei

  ret
