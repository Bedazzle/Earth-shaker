check_movement:
  call stop_walking

  ld (hl),$00

  ld a,(byte_FD9D)
  ld hl,PLAYER_COORDS
  or (hl)
  jr z,check_movement_0

  call is_left_pressed

  ld hl,KEY_PRESSED

  ld a,$ff
  cp (hl)
  jr z,check_movement_1

check_movement_0:
  call is_right_pressed

  ld hl,KEY_PRESSED

  ld a,$ff
  cp (hl)
  jr z,check_movement_1

  call is_up_pressed

  ld hl,KEY_PRESSED

  ld a,$ff
  cp (hl)
  jr z,check_movement_1

  call is_down_pressed

  ld hl,KEY_PRESSED

  ld a,$ff
  cp (hl)
  jr z,check_movement_1

  ret

check_movement_1:
  call walking_sound

  ret
