animate_exit_flash:
  ld a,(EXIT_COLORFLASH)
  cp $46
  jr nz,animate_exit_flash_0

  ld hl,byte_FD8E
  ld (hl),$ff
animate_exit_flash_0:
  cp $43
  jr nz,animate_exit_flash_1

  ld hl,byte_FD8E
  ld (hl),$01

animate_exit_flash_1:
  ld hl,EXIT_COLORFLASH

  ld a,(byte_FD8E)
  cp $ff
  jr z,animate_exit_flash_2

  inc (hl)
  call do_exit_flash

  ret

animate_exit_flash_2:
  dec (hl)

  call do_exit_flash

  ret
