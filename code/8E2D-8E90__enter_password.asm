enter_password:
  call print_enter_pass
  ld hl,ENTERED_PASS
  ld de,ENTERED_PASS+1
  ld bc,$0013
  ld (hl),$20
  ldir					; clear pass

  ld de,ENTERED_PASS
  ld bc,$0406
enter_password_0:
  push bc
  push de
  call scan_keyboard
  pop de
  pop bc

  inc hl
  ld a,(hl)

  cp $30
  jr nz,enter_password_1

  ld a,c

  cp $06
  jr z,enter_password_0

  dec de
  ld a,$20
  ld (de),a
  dec c
  push de
  push bc

  ld d,$01
  ld hl,str_enterpassword
  call print_string

  pop bc
  pop de

  call keypress_beep
  jr enter_password_0

enter_password_1:
  cp $65		; enter
  ret z

  cp ' '		;$20
  jr z,enter_password_2

  cp 'A'-1		;$40
  jr c,enter_password_0

  cp 'Z'+1		;$5b
  jr nc,enter_password_0

enter_password_2:
  ld (de),a
  push de
  pop hl
  push de
  ld d,$01
  push bc
  call print_string

  pop bc
  pop de

  call keypress_beep

  inc c
  inc de
  ld a,c

  cp $1a
  jr nz,enter_password_0

  ret
