password_to_level:
  call enter_password
  call check_password

  ld a,b
  cp $32					; 50?! passwords to check
  jr nz,set_matched_level

pass_mismatch:
  call just_a_ret

  ld a,$01
  ld (CURRENT_LEVEL),a
  ld hl,$0100
  ld (unk_FD7E),hl
  ret

set_matched_level:
  inc a
  ld (CURRENT_LEVEL),a

  ld hl,$0000
  ld (unk_FD7E),hl

loop_level_search:
  ld hl,LEVEL_NO
  ld b,$02

  push hl
  push af
  call increase_digit
  pop af
  pop hl

  dec a
  jr nz,loop_level_search

  call sub_8EE4

  ret
