is_2left_pressed:
  ld a,KEYS_YUIOP	; !!! SMC
  out ($ff),a

  in a,(PORT_KEY)
loc_8771:
  and $02			; !!! SMC   key O
  ret nz

  ld hl,(PLAYER_COORDS)
  ld b,$15
  ld de,$001e
is_2left_pressed_0:
  sbc hl,de
  ret z
  djnz is_2left_pressed_0

  ld hl,(PLAYER_COORDS)
  ld de,COLOR_EARTH
  add hl,de

  ld a,(hl)
  cp $06
  jr nz,is_2left_pressed_1

  ld (hl),$20
  call Le7fe

  ret
is_2left_pressed_1:
  cp $06
  jr c,L879f

  push hl
  call L9621
  pop hl

  ret

; Unused
L879d:
  defb $00,$00


L879f:
  cp $02
  ret nz

  ld hl,(PLAYER_COORDS)
  dec hl
  ld b,$15
  ld de,$001e
L879f_0:
  sbc hl,de
  ret z
  djnz L879f_0

  ld hl,(PLAYER_COORDS)
  ld de,COLOR_BRICKS
  add hl,de

  xor a
  cp (hl)
  ret nz

  ld (hl),$02
  inc hl

  ld (hl),$20
  call L8228

  ret
