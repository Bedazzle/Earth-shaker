show_lvl_intro:
  ld bc,$060b		; position
  ld d,$08			; length
  ld a,PAPER.BLACK + COLOR.YELLOW + COLOR.BRIGHT
  call colorize_string

  ld bc,$0a09
  ld d,$0d
  ld a,PAPER.BLACK + COLOR.GREEN	+ COLOR.BRIGHT
  call colorize_string

  ld bc,$0c09
  ld d,$0d
  ld a,PAPER.BLACK + COLOR.RED + COLOR.BRIGHT
  call colorize_string

  call level_intro

  ret
