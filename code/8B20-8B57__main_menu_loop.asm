GAME_START:
  call game_init
  call show_main_menu

loop_main:
  call play_main_note

  ld de,MAIN_MUSIC_END
  sbc hl,de
  jr nz,check_menu_start

  call scroller_and_main
  jr z,loop_main

check_menu_start:
  ld a,KEYS_54321
  out ($ff),a

  in a,(PORT_KEY)
  and $01				; key 1 (start game)
  jr nz,check_menu_redefine

  call L8be5
  jp GAME_START

check_menu_redefine:
  ld a,KEYS_54321
  out ($ff),a

  in a,(PORT_KEY)
  and $02				; key 2 (redefine keys)
  jr nz,menu_keys

  call redefine_keys
  jp GAME_START

menu_keys:
  jp check_menu_keys
