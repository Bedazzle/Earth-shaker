L9606:
  call sub_A63E

	NOP_3

  cp OBJECT.CRYSTAL
  jp z,crystal_collected

  cp OBJECT.TIME
  jp z,add_time_units

  cp OBJECT.BOTTLE
  jp z,increase_lives

  cp OBJECT.ANTIGRAV
  jp z,print_stat_line

L9620:
  ret