is_2down_pressed:
  ld a,KEYS_GFDSA
  out ($ff),a

  in a,(PORT_KEY)
loc_884F:
  and $01		; key A
  ret nz

  ld hl,(PLAYER_COORDS)
  ld de,$023a
  sbc hl,de
  ret nc

  ld de,$fdc6
  ld hl,(PLAYER_COORDS)
  add hl,de

  ld a,(hl)
  cp $06
  jr nz,is_2down_pressed_0

  ld (hl),$20
  call Le7fe

  ret
is_2down_pressed_0:
  cp $06
  ret c

  push hl
  call L96a8
  pop hl

  nop
  nop

  ret
