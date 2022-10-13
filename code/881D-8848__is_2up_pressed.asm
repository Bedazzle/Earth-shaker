is_2up_pressed:
  ld a,KEYS_TREWQ
  out ($ff),a

  in a,(PORT_KEY)
loc_8823:
  and $01		; key Q
  ret nz

  ld hl,(PLAYER_COORDS)
  ld de,$001e
  sbc hl,de
  ret c

  ld de,UNPACKED_LEVEL
  add hl,de

  ld a,(hl)
  cp $06
  jr nz,is_2up_pressed_0

  ld (hl),$20
  call Le7fe

  ret
is_2up_pressed_0:
  cp $06
  ret c

  push hl
  call L967b
  pop hl

  nop
  nop

  ret
