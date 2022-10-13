stop_walking:
  ld hl,IS_WALKING
  ld (hl),$00

  jp Le82f