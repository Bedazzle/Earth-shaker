graphics_init:
  call init_colors

  ld hl,EMPTYSPRITE_COLORED
  ld (COLORED_SPRITES),hl

  ld a,$be				; cp (hl)
  ld (loc_809A),a       ; !!! set SMC
  ld (loc_A67A),a		; !!! set SMC

  ld a,(ADDR_EARTH + 1)	; !!! high byte

  cp $a4
  ret nz

  xor a 
  ld (loc_809A),a		; !!! set SMC
  ld (loc_A67A),a		; !!! set SMC

  ret