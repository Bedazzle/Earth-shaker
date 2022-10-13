show_killed_player:
  ld hl,PLAYERKILL1_COLORED
  ld (ADDR_PLAYER1),hl

  ld hl,PLAYERKILL2_COLORED
  ld (ADDR_PLAYER2),hl
  ld hl,(word_FD70)

  call sprites_to_screen

  ret
