collect_crystal:
  ld a,(DONE_CRYSTALS)
  inc a
  ld (DONE_CRYSTALS),a

  ld hl,CRYSTALS_COUNT
  cp (hl)
  jr nz,after_flash

  ld hl,EXIT_FLASH
  ld (hl),$ff
after_flash:

	NOP_6

  ld hl,CRYSTALS_GOT
  ld b,$02
  call increase_digit

  ld hl,CRYSTALS_GOT
  ld bc,$1709
  ld d,$02
  call print_number

  call play_bleep

  ret
