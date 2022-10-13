play_selected:
  ld a,$03
  ld (L_A71F+1),a	; !!! set SMC
  ld a,$03
  ld (L_A736+1),a	; !!! set SMC

  call play_note

  ld a,$04
  ld (L_A71F+1),a	; !!! set SMC
  ld a,$02
  ld (L_A736+1),a	; !!! set SMC
  call play_note

  ld a,$05
  ld (L_A71F+1),a	; !!! set SMC
  ld a,$01
  ld (L_A736+1),a	; !!! set SMC
  call play_note

  ret
