show_info_attr:
  ld de,$5ac0
  ld bc,$0040
  ld hl,INFOLINE_ATTRIB
  ldir

  ret
