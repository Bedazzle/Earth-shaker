is_left_pressed:
  ld a,KEYS_YUIOP
  out ($ff),a		; !!! SMC

  in a,(PORT_KEY)
loc_83C9:
  and $02			; !!! SMC  key O
  ret nz

  ld hl,PLAYER_SPRITE
  ld (hl),$04

  ld hl,KEY_PRESSED
  ld (hl),$ff

  ld hl,(PLAYER_COORDS)
  ld b,$14
  ld de,$001e
is_left_pressed_0:
  sbc hl,de
  ret z
  djnz is_left_pressed_0

  ld hl,(PLAYER_COORDS)
  dec hl
  ld de,UNPACKED_LEVEL
  add hl,de
  ld a,$01
  cp (hl)
  jr nz,is_left_pressed_1

  ld a,(EXIT_FLASH)
  or a
  ret z
  ld a,$ff
  ld (EXIT_STATUS),a
  ret
is_left_pressed_1:
  ld a,$02
  cp (hl)
  jr nz,is_left_pressed_3
  ld hl,(PLAYER_COORDS)
  dec hl
  ld b,$14
  ld de,$001e
is_left_pressed_2:
  sbc hl,de
  ret z
  djnz is_left_pressed_2
  ld hl,(PLAYER_COORDS)
  dec hl
  dec hl

  ld de,UNPACKED_LEVEL
  add hl,de
  xor a
  call Le81f
  nop
  jr is_left_pressed_4
is_left_pressed_3:
  call Le869
  nop
  ld a,$06
  cp (hl)
  jp c,check_left_object

is_left_pressed_4:
  ld hl,(PLAYER_COORDS)
  dec hl
  ld (PLAYER_COORDS),hl
  inc hl
  ld de,UNPACKED_LEVEL
  add hl,de
  ld (hl),$00
  ret
