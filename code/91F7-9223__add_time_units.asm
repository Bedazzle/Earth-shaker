add_time_units:
  ld b,ADDITIONAL_TIME

loop_one_unit:
  push bc
  ld l,b
  ld h,$00
  ld a,l
  add a,$80
  ld l,a
  ld de,$0014
  call BEEPER

  di
  pop bc
  push bc
  ld a,$20
  sub b
  ld l,a
  ld a,l
  add a,$80
  ld l,a
  ld h,$00
  ld de,$0014
  call BEEPER

  di
  call score_from_time

  pop bc
  djnz loop_one_unit

  jp L9410
