prepare_game:
  ld hl,$0000
  ld (EXIT_STATUS),hl
  ld (unk_FD82),hl

  xor a
  ld (DONE_CRYSTALS),a

  call graphics_init
  call init_player_animation
  call print_info_line
  call print_scoreinfo
  call print_info_numbers

  ret
