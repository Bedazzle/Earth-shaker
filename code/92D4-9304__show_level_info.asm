show_level_info:
  call show_lvl_intro

  ld a,(CURRENT_LEVEL)
  ld b,a
  inc b

  ld de,$0014
  ld hl,PASSWORDS_TABLE - $14

loop_passwords:
  add hl,de
  djnz loop_passwords

  push hl
  ld b,$14
skip_trailing_spaces:
  dec hl

  ld a,$20
  cp (hl)
  jr nz,print_level_name
  djnz skip_trailing_spaces

print_level_name:
  ld a,$15
  sub b
  and $fe
  rrca
  add a,$05
  ld c,a
  ld b,$08
  pop hl
  sbc hl,de
  ld de,$1400

  call print_string

  ret
