muz_player:
  di

muz_player_0:
  ld a,(hl)
  inc hl

  cp $01
  jr nz,muz_player_1

  push hl
  push de
  push bc
  push af

  ld de,$0003
  ld hl,$020b
  call BEEPER

  di
  pop af
  pop bc
  pop de
  pop hl

muz_player_1:
  cp $02
  jr nz,muz_player_2

  push hl
  push de
  push bc
  push af

  ld de,$0005
  ld hl,$0106
  call BEEPER

  di
  pop af
  pop bc
  pop de
  pop hl

muz_player_2:
  ld a,KEYS_54321
  out ($ff),a

  in a,(PORT_KEY)
  and $1f

  cp $1f
  jr nz,muz_player_3

  ld a,(hl)
  cp $ff
  jr nz,muz_player_4

muz_player_3:
  ei

  ret

muz_player_4:
  push hl
  rlca
  ld l,a
  ld h,$bc
  ld d,(hl)
  inc hl
  ld e,(hl)
  push de
  pop ix
  pop hl
  ld a,(hl)
  inc hl
  nop
  nop
  nop
  dec ix
  push hl
  ld a,(hl)
  rlca
  ld l,a
  ld h,$bc
  ld b,(hl)
  inc hl
  ld c,(hl)
  push bc
  pop iy
  pop hl
  inc hl
  push hl
  ld h,(hl)
  ld l,$00

muz_player_5:
  dec de
  ld a,d
  or e
  jr nz,muz_player_6

  xor a
  out ($fe),a

  ld a,$10
  out ($fe),a

  push ix
  pop de
muz_player_6:
  dec bc
  ld a,b
  or c
  jr nz,muz_player_7

  ld a,$10
  out ($fe),a

  xor a
  out ($fe),a

  push iy
  pop bc

muz_player_7:
  dec hl
  ld a,h
  or l
  jr nz,muz_player_5

  pop hl
  inc hl

  jp muz_player_0
