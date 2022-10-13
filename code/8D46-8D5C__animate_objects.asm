animate_objects:
  ld a,(EXIT_COLORFLASH)
  ld hl,CRYSTAL_COLORED

  ld (hl),a
  dec a
  inc hl

  ld (hl),a
  dec a
  inc hl

  ld (hl),a
  inc a
  inc hl

  ld (hl),a

  call animate_player
  call animate_things

  ret
