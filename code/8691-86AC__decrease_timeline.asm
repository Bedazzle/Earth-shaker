decrease_timeline:
  ld hl,$50df	; timeline end address
  ld b,$08		; 8 lines

loop_decr_line:
  push bc
  push hl

  ld b,$1f		; 31 bytes
  rl (hl)		; optimize start
  ld a,(hl)		; change to 32 bytes
  dec hl		; optimize end

	; ld b, $20
	; nop: nop: nop: nop

loop_decr_byte:
  rl (hl)
  dec hl
  djnz loop_decr_byte

  dec hl		; ? optimize by removing
  pop hl

  ld bc,$0100
  add hl,bc

  pop bc
  djnz loop_decr_line

  ret
