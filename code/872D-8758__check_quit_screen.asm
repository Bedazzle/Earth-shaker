check_quit_screen:
  ld a,KEYS_HJKLe
  out ($ff),a

  in a,(PORT_KEY)
  and $10			; key H (quit screen)
  ret nz

  di
loop_quit_screen:
  call decrease_timeline

  ld hl,$0001
  ld de,$0000
  push hl
  call BEEPER
  pop hl

	NOP_4

  ld a,($52c0)		; timeline start ?
  or a
  jr nz,loop_quit_screen

  ld a,$ff
  ld (PLAYER_ALIVE),a
  call play_failed_beep

  ei

  ret
