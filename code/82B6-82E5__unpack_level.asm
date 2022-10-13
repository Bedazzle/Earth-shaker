unpack_level:
	ld      a, (CURRENT_LEVEL)
	ld      b, a
	ld      hl, LEVELS_DATA-314		; BEC6 ; 48838 = 49152-314 (level length)
	ld      de, $013A      ; 314

loop_search:
	add     hl, de
	djnz    loop_search

	ld      bc, $012C      ; 300 bytes of level
	ld      de, UNPACKED_LEVEL

unpack_map:
	ld      a, (hl)
	and     $0F
	ld      (de), a
	inc     de
	ld      a, (hl)
	and     $F0
	rrca
	rrca
	rrca
	rrca
	ld      (de), a
	inc     de
	inc     hl
	dec     bc
	ld      a, b
	or      c
	jr      nz, unpack_map

	ld      de, CRYSTALS_COUNT
	ld      bc, $000E
	ldir

	ret
