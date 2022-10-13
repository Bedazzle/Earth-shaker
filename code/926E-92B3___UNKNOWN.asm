L926e:
  call animate_teleport_in

	NOP_9

  call is_up_pressed_1

  ld de,$001e
  sbc hl,de
  ld (hl),$20
  add hl,de
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
