L9621:
  cp OBJECT.FIRE
  ret z

  cp OBJECT.TELEPORT
  ret z
  cp OBJECT.MONITOR
  ret z

  cp OBJECT.WAVE
  ret z

  push hl
  call L9606
  pop hl

  ld a,(hl)
  cp OBJECT.BUBBLE
  jr z,L9621_0

  ld (hl),$20

  ret

L9621_0:
  push hl
  ld hl,L9648
  ld (word_FD87),hl
  pop hl
  ld (word_FD89),hl

  jp L95d5

L9648:
  ld hl, (word_FD89)
  ld (hl), OBJECT.NONE

  ret