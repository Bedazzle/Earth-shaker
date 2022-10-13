print_game_over:
  ld hl,aGameOver
  ld bc,$080c
  ld d,$09
  call print_string
  
  ld hl,aYouScored
  ld bc,$0a08
  ld d,$0a
  call print_string
  
  ld bc,$0a18
  ld d,$06
  ld hl,SCORE
  call print_number

  ld hl,aAndReachedLeve
  ld bc,$0c07
  ld d,$11
  call print_string

  ld bc,$0c1a
  ld d,$02
  ld hl,LEVEL_NO
  call print_number

  ld bc,$080c
  ld d,$09
  ld a,$44
  call colorize_string

  ld bc,$0a08
  ld d,$0a
  ld a,$45
  call colorize_string

  ld bc,$0c07
  ld d,$11
  ld a,$45
  call colorize_string

  ret
