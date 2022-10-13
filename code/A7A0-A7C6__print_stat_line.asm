print_stat_line:
  call score_from_gravity

  ld a,$09
  ld (byte_FD8B),a

  ld a,$09
  ld (byte_FD8C),a

  ld a,$63
  ld (byte_FD8D),a

  ld hl,byte_FD8C
  ld d,$02
  ld bc,$1712
  call print_number

  ld de,ARROW_UP
  ld bc,$170f
  call show_spritecell

  ret
