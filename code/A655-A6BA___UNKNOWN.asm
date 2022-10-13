La655:
  xor a
  call Le850
  ld (byte_7FFE),a

  ld hl,$fdc6
  ld de,UNPACKED_LEVEL

  ld b,$13		; 19
La655_0:
  push bc

  ld b,$1e		; 30
La655_1:
  ld a,$02		; boulder?
  cp (hl)
  jr nz,La655_2

  ld a,(de)
  cp $0f			; fire?
  jr nz,La655_2

  ld (hl),$15
  ld a,$07
  ld (word_7FFB),a
La655_2:
  ld a,$06		; earth?

loc_A67A:
  cp (hl)		; !!! SMC
  jr z,La655_3

  xor a			; empty?
  cp (hl)
  jr z,La655_3

  ld a,$05		; brick
  cp (hl)
  jr z,La655_3

  ld a,$09		; wave
  cp (hl)
  jr z,La655_3

  ld a,$0e		; bubble
  cp (hl)
  jr z,La655_3

  ld a,$0d		; teleport
  cp (hl)
  jr z,La655_3

  ld a,$01		; exit
  cp (hl)
  jr z,La655_3

  ld a,$0b		; monitor
  cp (hl)
  jr z,La655_3

  ld a,$03		; player1
  cp (hl)
  jr z,La655_3

  ld a,$04		; player2
  cp (hl)
  jr z,La655_3

  ld a,$10
  cp (hl)
  jr c,La655_3

  push bc
  call La6bb
  pop bc

La655_3:
  inc hl
  inc de
  djnz La655_1

  pop bc
  djnz La655_0

  ret
