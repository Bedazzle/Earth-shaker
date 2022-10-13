L8da6:
  ld bc,$0000
  ld hl,(PLAYER_COORDS)
  ld de,$001e			; 30
L8da6_0:
  inc c
  sbc hl,de
  jr nc,L8da6_0

  dec c
  add hl,de
  ld a,l
  cp $08
  jr nc,L8da6_1

  ld l,$08
L8da6_1:
  cp $16				; 22
  jr c,L8da6_2

  ld l,$16				; 22
L8da6_2:
  ld a,c
  cp $05
  jr nc,L8da6_3

  ld c,$05
L8da6_3:
  cp $0e				; 14
  jr c,L8da6_4

  ld c,$0e				; 14
L8da6_4:
  ld de,$001e			; 30
  ld b,c
  inc b
  ld h,$00
L8da6_5:
  add hl,de
  djnz L8da6_5

  ld de,$00bc			; 188
  sbc hl,de
  ld (word_FD70),hl

  ret
