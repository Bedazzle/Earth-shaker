is_up_pressed:
  ld a,KEYS_TREWQ
  out ($ff),a

  in a,(PORT_KEY)
loc_84B3:
  and $01			; key Q
  ret nz

  ld hl,KEY_PRESSED
  ld (hl),$ff
  ld hl,(PLAYER_COORDS)
  ld de,$001e
  sbc hl,de
  ret c
  ld de,UNPACKED_LEVEL
  add hl,de
  ld a,$01
  cp (hl)
  jr nz,is_up_pressed_0
  ld a,(EXIT_FLASH)
  or a
  ret z
  ld a,$ff
  ld (EXIT_STATUS),a
  ret
is_up_pressed_0:
  ld a,$02
  cp (hl)
  ret z
  call Le869
  nop
  ld a,$06
  cp (hl)
  jp c,L9414

is_up_pressed_1:
  ld hl,(PLAYER_COORDS)
  ld de,$001e
  sbc hl,de
  ld (PLAYER_COORDS),hl
  add hl,de
  ld de,UNPACKED_LEVEL
  add hl,de
  ld (hl),$20
  ret
