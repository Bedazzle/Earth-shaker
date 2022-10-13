L8117:
  ld a,(de)
  cp $03
  ret z

  cp $04
  ret z

  cp $06
  ret z

  cp $20
  ret z

  ld a,b
  cp $01
  jr z,L8117_1

  dec hl
  dec de

  ld a,(de)
  or (hl)
  jr z,L8117_0

  inc hl
  inc de

  jr L8117_1

L8117_0:
  inc hl
  ld a,(hl)
  dec hl
  ld (hl),a
  inc hl

  ld a,$20
  ld (de),a
  ld (hl),a
  inc de

  ret
L8117_1:
  ld a,b
  cp $1e
  ret z

  inc de
  inc hl

  ld a,(de)
  or (hl)
  jr z,L8117_2

  dec de
  dec hl

  ret

L8117_2:
  dec hl
  ld a,(hl)
  inc hl
  ld (hl),a
  dec hl
  ld a,$20
  ld (de),a
  ld (hl),a
  dec de

  ret
