check_level_quit:
  call L937e

  ld a,KEYS_GFDSA
  out ($ff),a

  in a,(PORT_KEY)
  and $10		; key G (level quit)
  ret nz

  pop hl
  pop hl
  pop hl
  pop hl

  ret
