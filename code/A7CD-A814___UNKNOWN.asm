La7cd:
  ld a,(byte_FD8D)
  or a
  jr nz,La7cd_0

  call L8075

  ret

La7cd_0:
  dec a

  ld (byte_FD8D),a
  or a
  jr nz,La7cd_1

  ld de,ARROW_DOWN
  ld bc,$170f
  call show_spritecell

La7cd_1:
  ld hl,byte_FD8C
  ld b,$02
La7cd_2:
  ld a,(hl)
  dec a
  ld (hl),a

  cp $ff
  jr nz,La7cd_3

  ld (hl),$09
  dec hl
  djnz La7cd_2

La7cd_3:
  ld hl,byte_FD8C
  ld bc,$1712
  ld d,$02
  call print_number

  call La655

  ld a,(byte_FD8D)
  rlca

  ld de,$000a
  ld l,a
  ld h,$00
  call BEEPER
  di

  ret
