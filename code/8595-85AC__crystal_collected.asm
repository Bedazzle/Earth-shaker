crystal_collected:
  call score_crystal
  call print_scoreinfo
  call collect_crystal

  ld hl,EXIT_FLASH
  ld a,$ff
  cp (hl)

  ret nz

  call play_open_door

	NOP_4

  ret
