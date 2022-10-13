L8079:
  ld (byte_7FFE),a
  ld hl,$ffe1
  ld de,$ffff
  ld b,$13
L8079_0:
  push bc
  ld b,$1e
L8079_1:
  ld a,$02			; boulder
  cp (hl)
  jr nz,L8079_2

  ld a,(de)
  cp $0f				; fire
  jr nz,L8079_2

  ld (hl),$15
  ld a,$07			; crystal
  ld (word_7FFB),a

L8079_2:
  ld a,$06			; earth

loc_809A:
  cp (hl)			; !!! SMC
  jr z,L8079_3
  xor a

  cp (hl)
  jr z,L8079_3

  ld a,$05			; brick
  cp (hl)
  jr z,L8079_3

  ld a,$09			; wave
  cp (hl)
  jr z,L8079_3

  ld a,$0e			; bubble
  cp (hl)
  jr z,L8079_3

  ld a,$0d			; teleport
  cp (hl)
  jr z,L8079_3

  ld a,$01			; exit
  cp (hl)
  jr z,L8079_3

  ld a,$0b			; monitor
  cp (hl)
  jr z,L8079_3

  ld a,$03			; player1
  cp (hl)
  jr z,L8079_3

  ld a,$04			; player2
  cp (hl)
  jr z,L8079_3

  ld a,$10			; ???
  cp (hl)
  jr c,L8079_3

  push bc
  call L9aa6
  pop bc
L8079_3:
  dec hl
  dec de
  djnz L8079_1

  pop bc
  djnz L8079_0
  
  ret
