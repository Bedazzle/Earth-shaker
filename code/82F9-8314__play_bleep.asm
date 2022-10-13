play_bleep:
  ld hl,$0200
  ld de,$0005
  call BEEPER

  ld hl,$0100
  ld de,$000a
  call BEEPER

  ld hl,$0080
  ld de,$0014
  call BEEPER

  ret
