play_note:
  di
  ld hl,$0140

play_note_0:
  ld c,(hl)
  ld e,c
  ld d,$80

play_note_1:
  dec e
  jr nz,play_note_3

  ld a,c

L_A71F:
  ld b,$05		; !!! SMC

play_note_2:
  rrca
  and $7f
  djnz play_note_2

  ld e,a
  ld a,$18
  out ($fe),a
  jr play_note_4

play_note_3:
  dec d
  jr nz,play_note_1
  jr play_note_7

play_note_4:
  dec e
  jr nz,play_note_6

  ld a,c

L_A736:
  ld b,$01		; !!! SMC

play_note_5:
  rrca
  and $7f
  djnz play_note_5

  ld e,a
  xor a
  out ($fe),a
  jr play_note_1

play_note_6:
  dec d
  jr nz,play_note_4

play_note_7:
  dec l
  jr nz,play_note_0

  ei

  ret
