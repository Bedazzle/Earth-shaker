level_to_screen:
  call animate_objects

sprites_to_screen:
  ld de,UNPACKED_LEVEL
  add hl,de

  ld bc,$0000
loop_next_sprite:
  ld a,(hl)

  push de
  push af
  push bc
  push hl

  call colored_sprite

  pop hl
  pop bc
  pop af
  pop de

	NOP_5

  inc hl
  inc c
  inc c

  ld a,c
  cp $20		; 32 cols
  jr nz,loop_next_sprite

  ld c,$00
  inc b
  inc b

  ld de,$000e	; 30 map cells = 60 screen cells,  (60-32)=14
  add hl,de		; start of next row in map

  ld a,b
  cp $16		; 22 rows
  jr nz,loop_next_sprite

  ret
