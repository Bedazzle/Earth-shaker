scroll_screen_columns:
  di
  ld b,$08

loop_by_line:
  push bc
  ld hl,SCREEN
  ld b,$c0			; 192

loop_scroll_pairs:
  push bc
  ld b,$10			; 16

loop_scroll_cols:
  srl (hl)
  inc hl
  sla (hl)
  inc hl
  djnz loop_scroll_cols

  pop bc
  djnz loop_scroll_pairs

  pop bc
  djnz loop_by_line

  ei

  ret
