find_attr_DE:
  ld a,b
  sra a
  sra a
  sra a
  add a,$58
  ld d,a
  ld a,b
  and $07
  rrca
  rrca
  rrca
  add a,c
  ld e,a

  ret
