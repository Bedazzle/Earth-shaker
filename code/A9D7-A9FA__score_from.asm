score_from_time:
  call increase_timeline

  ld b, 2
  call loop_score_inc

  call print_scoreinfo

  ret


score_from_waves:
  call play_selected

  ld b, 250
  call loop_score_inc

  call print_scoreinfo

  ret


score_from_gravity:
  call play_gravity

  ld b, 200
  call loop_score_inc

  call print_scoreinfo

  ret
