is_down_pressed:
  ld a,KEYS_GFDSA
  out ($ff),a

  in a,(PORT_KEY)
loc_84FF:
  and $01		; key A
  ret nz

  ld hl,KEY_PRESSED
  ld (hl),$ff
  ld hl,(PLAYER_COORDS)
  ld de,$023a
  sbc hl,de
  ret nc

  ld de,$fdc6
  ld hl,(PLAYER_COORDS)
  add hl,de

  ld a,OBJECT.EXIT
  cp (hl)
  jr nz,is_down_pressed_0

  ld a,(EXIT_FLASH)
  or a
  ret z

  ld a,$ff
  ld (EXIT_STATUS),a
  ret
is_down_pressed_0:
  ld a,OBJECT.BOULDER
  cp (hl)
  ret z

  call Le869
  nop

  ld a,OBJECT.EARTH
  cp (hl)
  jp c,check_move_to

is_down_pressed_1:
  ld hl,(PLAYER_COORDS)
  ld de,$001e
  add hl,de
  ld (PLAYER_COORDS),hl
  sbc hl,de

  ld de,UNPACKED_LEVEL
  add hl,de
  ld (hl),$20

  ret
