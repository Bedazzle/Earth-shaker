La773:
  call L8250

	NOP_5

  ld a,(word_7FFB)
  or a
  ret z
  dec a
  ld (word_7FFB),a
  rlca
  rlca
  rlca
  rlca
  ld l,a
  ld h,$00
  ld de,$0014
  call BEEPER
  ret