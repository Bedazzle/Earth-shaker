play_falling_beep:
  di
  ld hl,$0140

  xor a
  out ($fe),a
Le740_0:
  ld bc,$1001
LE74A:
  ld d,$02			; !!! SMC
Le740_1:
  ld a,(hl)
  and $3f
  cp d
  jr c,Le740_2

  or $07
Le740_2:
  sub d
  ld e,a

Le740_3:
  dec e
  jr nz,Le740_4

  ld a,$18
  out ($fe),a
  jr Le740_5

Le740_4:
  djnz Le740_3
  dec c
  jr nz,Le740_3
  jr Le740_8

Le740_5:
  ld e,d
Le740_6:
  dec e
  jr nz,Le740_7

  xor a
  out ($fe),a
  jr Le740_1

Le740_7:
  djnz Le740_6

  dec c
  jr nz,Le740_6

Le740_8:
  dec l
  jr nz,Le740_0

  dec h
  jr nz,Le740_0

  ei

  ret
