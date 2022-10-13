; code similar to 9518-955D

L955e:
  call animate_teleport_in

	NOP_9

  call is_left_pressed_4		; <--

  dec hl						; <--
  ld (hl),$20
  inc hl						; <--

	NOP_4

  ld bc,$0258
  ld hl,UNPACKED_LEVEL

  ld a,$0d
  cpir

  ld a,b
  or c
  ret z

  dec hl
  ld de,UNPACKED_LEVEL
  sbc hl,de
  ld (PLAYER_COORDS),hl

  call L8da6

  ld hl,(word_FD70)

  call sprites_to_screen
  call animate_teleport_out

	NOP_9

  call show_info_attr

  ret
