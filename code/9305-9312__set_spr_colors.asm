set_spr_colors:
	or      $40       ; set brightness
	ld      (hl), a
	and     $3F       ; reset brightness
	inc     hl
	ld      (hl), a
	inc     hl
	ld      (hl), a
	or      $40       ; set brightness
	inc     hl
	ld      (hl), a

	ret
