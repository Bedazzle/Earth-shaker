print_info_line:
  ld d,$20			; length
  ld bc,$1700		; position
  ld hl,LEVEL_BOTTOM
  call print_string

  ret
