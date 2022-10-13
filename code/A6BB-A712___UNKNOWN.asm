La6bb:
  ld a,(de)
  or a
  jr nz,La6bb_2
  ld a,(hl)
  ld (hl),$20
  ld (de),a
  cp $02				; boulder
  jr nz,La6bb_0
  ld a,$ff
  ld (byte_7FFF),a
  jr La6bb_1
La6bb_0:
  ld a,$ff
  ld (byte_7FFE),a
La6bb_1:
  ret

La6bb_2:
  ld a,(de)
  cp $03				; player1
  ret z
  cp $04				; player2
  ret z
  cp $06				; earth
  ret z
  cp $20				; none?
  ret z

  ld a,b
  cp $1e				; 30
  jr z,La6bb_4

  dec hl
  dec de
  ld a,(de)
  or (hl)
  jr z,La6bb_3

  inc hl
  inc de
  jr La6bb_4

La6bb_3:
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

La6bb_4:
  ld a,b
  cp $01
  ret z

  inc de
  inc hl
  ld a,(de)
  or (hl)
  jr z,La6bb_5

  dec de
  dec hl
  ret

La6bb_5:
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
