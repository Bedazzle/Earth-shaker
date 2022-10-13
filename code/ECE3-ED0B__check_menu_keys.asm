check_menu_keys:
  ld a,KEYS_54321
  out ($ff),a

  in a,(PORT_KEY)
  and $04				; key 3 (keyboard control)
  jr nz,check_menu_joy

  call play_selected
  call restore_keys

  jp GAME_START

check_menu_joy:
  ld a,KEYS_54321
  out ($ff),a

  in a,(PORT_KEY)
  and $08				; key 4 (joystick control)
  jr nz,check_quit

  call play_selected
  call restore_joystick

  jp GAME_START

check_quit:
  jp check_menu_quit
