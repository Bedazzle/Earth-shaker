redefine_keys:
  call Lecdc
  
  ld b,$06

redefine_keys_0:
  ld c,$05				; start column
  ld a,COLOR.GREEN + PAPER.BLACK + COLOR.BRIGHT
  ld d,$13				; length
  call colorize_string

  ld c,$19
  ld d,$01
  ld a,COLOR.YELLOW + PAPER.BLACK + COLOR.BRIGHT
  call colorize_string

  inc b
  inc b
  ld a,b

  cp $10
  jr nz,redefine_keys_0

  ld bc,$0605
  ld d,$13
  ld hl,str_key_left
  call print_string

  call scan_keyboard
  inc hl

  ld bc,$0619
  ld d,$01
  push hl
  call print_string

  pop hl
  dec hl
  ld a,(hl)
  ld (loc_83C9+1),a		; !!! set SMC
  ld (loc_8771+1),a		; !!! set SMC
  dec hl
  ld a,(hl)
  ld (is_left_pressed+1),a			; !!! set SMC
  ld (is_2left_pressed+1),a			; !!! set SMC
  call play_screech

	NOP_6

  ld bc,$0805
  ld d,$13
  ld hl,str_key_right
  call print_string

  call scan_keyboard
  inc hl

  ld bc,$0819
  ld d,$01
  push hl
  call print_string

  pop hl
  dec hl
  ld a,(hl)
  ld (loc_843D+1),a		; !!! set SMC
  ld (loc_87C9+1),a		; !!! set SMC
  dec hl
  ld a,(hl)
  ld (is_right_pressed+1),a			; !!! set SMC
  ld (is_2right_pressed+1),a			; !!! set SMC
  call play_screech

	NOP_6

  ld bc,$0a05
  ld d,$13
  ld hl,str_key_up
  call print_string

  call scan_keyboard
  inc hl

  ld bc,$0a19
  ld d,$01
  push hl
  call print_string

  pop hl
  dec hl
  ld a,(hl)
  ld (loc_84B3+1),a		; !!! set SMC
  ld (loc_8823+1),a		; !!! set SMC
  dec hl
  ld a,(hl)
  ld (is_up_pressed+1),a			; !!! set SMC
  ld (is_2up_pressed+1),a			; !!! set SMC
  call play_screech

	NOP_6

  ld bc,$0c05
  ld d,$13
  ld hl,str_key_down
  call print_string

  call scan_keyboard
  inc hl

  ld bc,$0c19
  ld d,$01
  push hl
  call print_string

  pop hl
  dec hl
  ld a,(hl)
  ld (loc_84FF+1),a		; !!! set SMC
  ld (loc_884F+1),a		; !!! set SMC
  dec hl
  ld a,(hl)
  ld (is_down_pressed+1),a			; !!! set SMC
  ld (is_2down_pressed+1),a			; !!! set SMC
  call play_screech

	NOP_6

  ld bc,$0e05
  ld d,$13
  ld hl,str_key_fire
  call print_string

  call scan_keyboard
  inc hl

  ld bc,$0e19
  ld d,$01
  push hl
  call print_string

  pop hl
  dec hl
  ld a,(hl)
  ld (loc_875F+1),a		; !!! set SMC
  dec hl
  ld a,(hl)
  ld (is_fire_pressed+1),a			; !!! set SMC
  call play_screech

	NOP_6

  call fade_attributes

  ret
