do_exit_flash:
  ld a,(EXIT_FLASH)
  or a
  ret z

  ld a,(EXIT_COLORFLASH)	; left part is bright
  ld (EXIT_COLORED),a
  ld (EXIT_COLORED+3),a
  and $3f					; right part is dark
  ld (EXIT_COLORED+1),a
  ld (EXIT_COLORED+2),a

  ret
