Le7fe:
  ld a,$01
  ld (LE74A+1),a		; !!! set SMC
  call play_falling_beep

  ld a,$02
  ld (LE74A+1),a		; !!! set SMC
  call play_falling_beep

  ld a,$04
  ld (LE74A+1),a		; !!! set SMC
  call play_falling_beep

  ld a,$0a
  ld (LE74A+1),a		; !!! set SMC
  call play_falling_beep

  ret