L7f7a:
  ld b,$01
L7f7a_0:
  push bc
  call L7f60
  pop bc
  jr nc,L7f7a_1

  inc b

  ld a,b
  cp $06
  jr nz,L7f7a_0

  ret

L7f7a_1:
  push bc
  call fade_attributes
  pop bc
  push bc
  ld hl,$fd05
  ld de,$000f

L7f7a_2:
  add hl,de
  djnz L7f7a_2

  pop bc
  push bc
  push hl
  pop de
  push de

  ld a,$05
  sub b
  jr z,L7f7a_4

  ld b,a
  ld hl,SCORE_PREV
  ld de,SCORE_LAST

L7f7a_3:
  push bc
  push hl
  push de
  ld bc,$000f   ; 15 = length of score + name
  ldir

  pop de
  pop hl
  pop bc
  ld a,l
  sub $0f
  ld l,a
  ld a,e
  sub $0f
  ld e,a
  djnz L7f7a_3

L7f7a_4:
  pop de
  ld hl,unk_FD94
  ld bc,$0006
  ldir
  call show_scores

  pop bc
  push bc
  ld a,b
  rlca
  add a,$0a
  ld b,a
  ld c,$0f

  ld d,$09
  ld hl,str_emptystring
  call print_string

  pop bc
  push bc
  ld hl,$fd0b
  ld de,$000f

L7f7a_5:
  add hl,de
  djnz L7f7a_5

  ld b,$09
L7f7a_6:
  ld (hl),$20
  inc hl
  djnz L7f7a_6

  pop bc
  call sub_7F00

  ret
