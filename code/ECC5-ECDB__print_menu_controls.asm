print_menu_controls:
  ld hl,str_keyboard
  ld d,$18
  ld bc,$0f04
  call print_string
 
  ld hl,str_joystick
  ld d,$18
  ld bc,$1104
  call print_string

  ret
