clear_vars_and_level:
  ld hl,VARIABLES
  ld de,VARIABLES+1
  ld bc,$028a
  ld (hl),$00
  ldir

  ret
