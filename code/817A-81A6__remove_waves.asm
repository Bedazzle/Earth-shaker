remove_waves:
  ld a,(L_7FFC)
  or a
  jr z,remove_waves_4

  ld hl,UNPACKED_LEVEL
  ld b, 20

loop_remove_rows:
  push bc

  ld b, 30

loop_remove_cols:
  ld a,(hl)
  cp OBJECT.WAVE
  jr nz,check_monitor

  ld (hl),$20
check_monitor:
  ld a,(hl)
  cp OBJECT.MONITOR
  jr nz,loop_remove

  ld (hl),$20
loop_remove:
  inc hl
  djnz loop_remove_cols

  pop bc
  djnz loop_remove_rows

  call score_from_waves

  xor a
  ld (L_7FFC),a

remove_waves_4:
  call La7cd

  ret
