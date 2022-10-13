; code similar to 955E-95A3

L9518:
  call animate_teleport_in

	NOP_9

  call is_right_pressed_4	; <--

  inc hl						; <--
  ld (hl),$20
  dec hl						; <--

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
