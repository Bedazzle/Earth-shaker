reset_counter4:
  ld a,$03
  ld (COUNTER_4),a

  call L8687

  ret
