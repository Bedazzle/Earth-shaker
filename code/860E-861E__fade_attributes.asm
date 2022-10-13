fade_attributes:
  ld hl,ATTRIB
  ld de,ATTRIB+1
  ld bc,ATTRIB_LEN-1
  ld (hl),$47
  ldir
  call scroll_screen_columns

  ret
