init_timeline:
  ld b,$04
  ld de,$52c1
  ld hl,$52c0

init_timeline_0:
  push bc
  ld bc,$001f
  push hl
  push de
  ld (hl),$ff
  ldir

  pop de
  pop hl
  pop bc
  inc h
  inc d
  djnz init_timeline_0

  call show_info_attr

  ret
