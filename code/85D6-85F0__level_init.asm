level_init:
  ld hl,$0100
  ld (unk_FD7E),hl

  call password_to_level
  nop

  ld hl,LIVES
  ld (hl),INIT_LIVES

  inc hl
  ld (hl),$00
  ld de,unk_FD95
  ld bc,$0005
  ldir

  ret
