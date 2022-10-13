check_timeout:
  ld a,(TIME_TICKER)
  add a, TIME_SPEED
  ld (TIME_TICKER),a
  or a
  ret nz

  call decrease_timeline

  ld hl,$0000
  ld de,$0000
  call BEEPER

  ld a,($52c0)
  or a
  ret nz

  call play_failed_beep

  ld a,$ff
  ld (PLAYER_ALIVE),a

  ret
