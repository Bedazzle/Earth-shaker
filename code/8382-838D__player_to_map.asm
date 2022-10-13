player_to_map:
  ld hl,(PLAYER_COORDS)
  ld de,UNPACKED_LEVEL
  add hl,de

  ld a,(PLAYER_SPRITE)
  ld (hl),a

  ret
