play_ouch:
  ld hl,$0000
  ld a,l
  rrca
  rrca
  and $0f
  ld e,a
  ld d,$00
  push hl
  ld l,(hl)

  call BEEPER

  pop hl
  dec l
  jr nz,play_ouch + 2	;$8630

  ret
