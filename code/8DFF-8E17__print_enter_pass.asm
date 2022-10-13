print_enter_pass:
  call fade_attributes

  ld bc,$0000
  ld d,$20
  ld hl,str_enter
  call print_string

  ld bc,$0000
  ld d,$20
  ld a,$43
  call colorize_string

  ret
