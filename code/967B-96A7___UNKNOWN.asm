L967b:
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
  jr z,L967b_0

  ld (hl), OBJECT.NONE

  ret

L967b_0:
  push hl
  ld hl,L96a2
  ld (word_FD87),hl
  pop hl
  ld (word_FD89),hl
  jp L934f


L96a2:
  ld      hl, (word_FD89)
  ld      (hl), OBJECT.NONE
  ret