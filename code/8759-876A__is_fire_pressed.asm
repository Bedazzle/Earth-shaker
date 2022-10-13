is_fire_pressed:
  ld a,KEYS_BNMss	; !!! SMC
  out ($ff),a

  in a,(PORT_KEY)
loc_875F:
  and $04			; !!! SMC  key M
  jr z,is_fire_pressed_0

  call check_movement

  ret

is_fire_pressed_0:
  call check_pressed_dir

  ret
