check_password:
  ld hl,PASSWORDS_TABLE
  ld b,$00
check_sentence:
  push bc
  ld b,$14
  push hl
  ld de,ENTERED_PASS
check_letter:
  ld c,(hl)
  ld a,(de)

  cp c
  jr nz,next_password

  inc hl
  inc de
  djnz check_letter

  pop hl
  pop bc

  ret

next_password:
  pop hl
  ld de,$0014
  add hl,de
  pop bc
  inc b
  ld a,b

  cp $32
  jr nz,check_sentence

  ret
