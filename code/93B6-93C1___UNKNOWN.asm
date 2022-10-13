L93b6:
  call play_screech

  ld b,100
  call loop_score_inc
  call print_scoreinfo

  ret
