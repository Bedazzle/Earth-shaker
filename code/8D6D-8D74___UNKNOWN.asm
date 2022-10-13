L8d6d:
  ld      de, $001F
  add     hl, de
  ld      (hl), a
  inc     hl
  ld      (hl), a

  ret
