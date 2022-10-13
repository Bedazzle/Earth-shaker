animate_player:
  ld a,(COUNTER_4)
  inc a

  cp $04					; player 4 sprites
  jr nz,next_COUNTER_4

  xor a
  ld (COUNTER_4),a

  ld hl,PLAYER1_COLORED
  ld (ADDR_PLAYER1),hl

  ld hl,PLAYER2_COLORED
  ld (ADDR_PLAYER2),hl

  ld hl,(word_FD70)

  ret


next_COUNTER_4:
  ld (COUNTER_4),a

  ld hl,(ADDR_PLAYER1)
  ld de,$0024
  add hl,de
  ld (ADDR_PLAYER1),hl

  ld hl,(ADDR_PLAYER2)
  add hl,de
  ld (ADDR_PLAYER2),hl

  ld hl,(word_FD70)

  ret
