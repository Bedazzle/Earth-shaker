is_2right_pressed:
  ld a,KEYS_YUIOP	; !!! SMC
  out ($ff),a

  in a,(PORT_KEY)
loc_87C9:
  and $01			; !!! SMC	key P
  ret nz

  ld hl,(PLAYER_COORDS)
  inc hl
  ld b,$15
  ld de,$001e

is_2right_pressed_0:
  sbc hl,de
  ret z
  djnz is_2right_pressed_0

  ld hl,(PLAYER_COORDS)
  ld de,$fda9
  add hl,de

  ld a,(hl)
  cp $06
  jr nz,is_2right_pressed_1

  ld (hl),$20
  call Le7fe

  ret

is_2right_pressed_1:
  cp $06
  jr c,is_2right_pressed_2

  push hl
  call L964e
  pop hl

  nop
  nop

  ret

is_2right_pressed_2:
  cp $02
  ret nz

  ld hl,(PLAYER_COORDS)
  inc hl
  inc hl
  ld b,$15
  ld de,$001e

is_2right_pressed_3:
  sbc hl,de
  ret z
  djnz is_2right_pressed_3

  ld hl,(PLAYER_COORDS)
  ld de,$fdaa
  add hl,de

  xor a
  cp (hl)
  ret nz

  ld (hl),$02
  dec hl
  ld (hl),$20

  call L8228

  ret
