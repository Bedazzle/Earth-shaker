find_spritedata:
  and $1f
  rlca
  ld e,a
  ld d, high COLORED_SPRITES		;$80

  ret
