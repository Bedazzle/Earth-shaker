is_right_pressed:
  ld a,KEYS_YUIOP
  out ($ff),a		; !!! SMC

  in a,(PORT_KEY)
loc_843D:
  and $01			; !!! SMC  key P
  ret nz

  ld hl,PLAYER_SPRITE
  ld (hl),$03

  ld hl,KEY_PRESSED
  ld (hl),$ff

  ld hl,(PLAYER_COORDS)
  inc hl

  ld b,$15
  ld de,$001e
is_right_pressed_0:
  sbc hl,de
  ret z
  djnz is_right_pressed_0

  ld hl,(PLAYER_COORDS)
  inc hl
  ld de,UNPACKED_LEVEL
  add hl,de
  ld a,$01
  cp (hl)
  jr nz,is_right_pressed_1

  ld a,(EXIT_FLASH)
  or a
  ret z
  ld a,$ff
  ld (EXIT_STATUS),a
  ret
is_right_pressed_1:
  ld a,$02
  cp (hl)
  jr nz,is_right_pressed_3
  ld hl,(PLAYER_COORDS)
  inc hl
  inc hl
  ld b,$15
  ld de,$001e
is_right_pressed_2:
  sbc hl,de
  ret z
  djnz is_right_pressed_2
  ld hl,(PLAYER_COORDS)
  inc hl
  inc hl

  ld de,UNPACKED_LEVEL
  add hl,de
  xor a
  call Le81f
  nop
  jr is_right_pressed_4
is_right_pressed_3:
  call Le869
  nop
  ld a,$06
  cp (hl)
  jp c,check_right_object

is_right_pressed_4:
  ld hl,(PLAYER_COORDS)
  inc hl
  ld (PLAYER_COORDS),hl
  dec hl
  ld de,UNPACKED_LEVEL
  add hl,de
  ld (hl),$00
  ret
