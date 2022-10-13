play_walk_beep:
  ld hl,$00ff	; rst $38	maskable interrupt
  ld a,(hl)
  and $18		; 0001 1000  mic and beeper
  out ($fe),a

  dec hl

  ld a,h
  or l
  jr nz,play_walk_beep + 2	;$854a

  ret
