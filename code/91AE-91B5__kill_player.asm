kill_player:
  ld a,$ff
  ld (IS_PLAYER_KILLED),a

  jp L9410
