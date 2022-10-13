teleport_in:
  ld hl,ATTRIB_TELEPORT
  ld de,$0300
  ld a,(COUNTER_4)
  inc a
  and $03
  ld (COUNTER_4),a
  or a
  jr z,teleport_in_ldir

  ld b,a
loop_inc:
  add hl,de
  djnz loop_inc

teleport_in_ldir:
  ld de,L5800
  ld bc,$0300
  ldir

  ret


teleport_out:
  ld hl,ATTRIB_TELEPORT
  ld de,$0300
  ld a,(COUNTER_4)
  dec a
  and $03
  ld (COUNTER_4),a
  or a
  jr z,teleport_out_ldir

  ld b,a
loop_dec:
  add hl,de
  djnz loop_dec

teleport_out_ldir:
  ld de,L5800
  ld bc,$0300
  ldir

  ret
