L96a8:
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
  jr z,L96a8_0

  ld (hl), OBJECT.NONE

  ret

L96a8_0:
  push hl
  ld hl,L96cf
  ld (word_FD87),hl
  pop hl
  ld (word_FD89),hl
  jp L946b


L96cf:
  ld hl,(word_FD89)
  ld (hl), OBJECT.NONE
  ret