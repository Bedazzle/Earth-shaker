validate_unpacked:
  ld hl,UNPACKED_LEVEL

loop_validate:
  ld a,(hl)
  and $1f
  ld (hl),a
  inc hl
  ld a,h			; check till HL=0 (start of ROM)
  or l
  jr nz,loop_validate

  ret
