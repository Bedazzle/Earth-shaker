L915f:
  ld a,$07
  cp (hl)
  jr nz,L915f_0

  call crystal_collected
  jp is_up_pressed_1

L915f_0:
  ld a,$08
  cp (hl)
  jp z,add_time_units

  ld a,$09
  cp (hl)
  jp z,L914c

  ld a,$0a
  cp (hl)
  jp z,La7c7

  ld a,$0b
  cp (hl)
  ret z

  nop
  nop

  ld a,$0c
  cp (hl)
  call z,increase_lives

  ld a,$0d
  cp (hl)
  jp z,L926e

  ld a,$0e
  cp (hl)
  jp z,L934f

  ld a,$0f
  cp (hl)
  jp z,kill_player

  ld hl,(PLAYER_COORDS)
  inc hl
  ld de,$001e
  sbc hl,de
  ld (PLAYER_COORDS),hl
  add hl,de
  ld de,UNPACKED_LEVEL
  add hl,de
  ld (hl),$20

  ret
