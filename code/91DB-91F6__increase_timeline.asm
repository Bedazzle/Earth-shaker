increase_timeline:
  ld hl,$52c0	; timeline screen address
  ld b,$04		; timeline thickness

loop_increase_line:
  push bc
  push hl
  ld b,$20
  nop
  nop
  nop
  scf

loop_byte_grow:
  rr (hl)
  inc hl
  djnz loop_byte_grow

  nop
  pop hl
  ld bc,$0100	; next line (inc HL)
  add hl,bc
  pop bc
  djnz loop_increase_line

  ret
