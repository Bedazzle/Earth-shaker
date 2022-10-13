animate_things:
  push hl
  push de
  push bc

  call L9dfc		; sprite area

	NOP_8

  ld de,$0024

  ld hl,FIRE_COLORED
  ld a,(COUNTER_4)
  or a
  jr z,animate_things_1

  ld b,a
animate_things_0:
  add hl,de
  djnz animate_things_0

animate_things_1:
  ld (ADDR_FIRE),hl

  ld hl,POTION_COLORED
  ld a,(COUNTER_4)
  or a
  jr z,animate_things_3

  ld b,a
animate_things_2:
  add hl,de
  djnz animate_things_2

animate_things_3:
  ld (ADDR_POTION),hl

  ld hl,BUBBLE_COLORED
  ld a,(COUNTER_4)
  or a
  jr z,animate_things_5

  ld b,a
animate_things_4:
  add hl,de
  djnz animate_things_4

animate_things_5:
  ld (ADDR_BUBBLE),hl

  ld a,(COUNTER_8)
  inc a
  and $07
  ld (COUNTER_8),a

  ld hl,WAVE1_COLORED
  ld a,(COUNTER_8)
  or a
  jr z,animate_things_7

  ld b,a
animate_things_6:
  add hl,de
  djnz animate_things_6

animate_things_7:
  ld (ADDR_WAVE),hl

  ld hl,GRAVITY_COLORED
  ld a,(COUNTER_4)
  or a
  jr z,animate_things_9

  ld b,a
animate_things_8:
  add hl,de
  djnz animate_things_8

animate_things_9:
  ld (ADDR_GRAVITY),hl

  ld a,(COUNTER_12)
  inc a
  cp $0c
  jr nz,animate_things_10

  xor a
animate_things_10:
  ld (COUNTER_12),a

  ld hl,TELEPORT1_COLORED
  ld a,(COUNTER_12)
  or a
  jr z,animate_things_12

  ld b,a
animate_things_11:
  add hl,de
  djnz animate_things_11

animate_things_12:
  ld (ADDR_TELEPORT),hl

  ld hl,EXTRATIME_COLORED
  ld a,(COUNTER_4)
  or a
  jr z,animate_things_14

  ld b,a
animate_things_13:
  add hl,de
  djnz animate_things_13

animate_things_14:
  ld (ADDR_EXTRATIME),hl

  pop bc
  pop de
  pop hl

  ret
