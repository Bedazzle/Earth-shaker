print_info_numbers:
  ld bc,$1702
  ld d,$02
  ld hl,LEVEL_NO
  call print_number

  ld bc,$1706
  ld d,$02
  ld hl,CRYSTALS_DIGITS
  call print_number

  ld bc,$170c
  ld d,$01
  ld hl,LIVES
  call print_number

  ret
