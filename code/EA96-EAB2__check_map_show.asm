check_map_show:
  ld a,KEYS_GFDSA
  out ($ff),a

  in a,(PORT_KEY)
  and $08		; key F (show map)
  jr nz,no_map

  ld a,(MAP_IS_SHOWN)
  cp $ff
  jr z,no_map

	IFNDEF INFINITE_MAPS
  ld a,$ff
	ELSE
  ld a,0
	ENDIF
  ld (MAP_IS_SHOWN),a

  call show_level_map

no_map:
  call level_to_screen

  ret
