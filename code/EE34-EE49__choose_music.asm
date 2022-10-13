choose_music:
  ; choose new track every 4 levels from 8 songs
  ld a,(CURRENT_LEVEL)
  dec a
  and $fc
  rrca
  add a,$24
  ld e,a
  ld d,$ee		; addresses $EE24 - $EE32
  ld a,(de)	
  ld l,a
  inc de
  ld a,(de)
  ld h,a
  call muz_player

  ret
