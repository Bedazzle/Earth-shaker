scan_keyboard:
  ld b,$28		; keyboard table size 5x8
  ld hl,KEYBOARD

loop_scankey:
  ld a,(hl)
  out ($ff),a

  in a,(PORT_KEY)

  inc hl
  and (hl)
  ret z

  inc hl
  inc hl
  djnz loop_scankey

  jr scan_keyboard
