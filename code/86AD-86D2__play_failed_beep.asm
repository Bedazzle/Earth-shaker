play_failed_beep:
  di
  ld hl,$0180

play_failed_beep_0:
  ld c,(hl)
  and $7f
  ld b,$08

play_failed_beep_1:
  xor a
  out ($fe),a

  ld e,c
play_failed_beep_2:
  dec e
  jr nz,play_failed_beep_2

  ld a,$18
  out ($fe),a

  ld a,l
  and $7f
  ld e,a
  xor a
  sub e
  sub c
  ld e,a

play_failed_beep_3:
  dec e
  jr nz,play_failed_beep_3
  djnz play_failed_beep_1

  dec l
  jr nz,play_failed_beep_0

  ei

  ret
