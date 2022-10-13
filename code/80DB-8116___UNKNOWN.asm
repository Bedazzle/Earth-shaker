L80db:
  ld a,(de)
  or a
  jr nz,L8117

  ld a,(hl)
  ld (hl),$20
  ld (de),a

  cp $02
  jr nz,L80db_0

  call Le78c

  nop
  nop
  jr L80db_1

L80db_0:
  ld a,$ff
  ld (byte_7FFE),a
L80db_1:
  push hl

  ld hl,$001e
  add hl,de
  ld a,(hl)
  pop hl

  cp $03
  jr nz,L8104

  jp L9abc

L8101:
  defb $00,$00,$00


L8104:
  cp $04
  jr nz,L810e

  jp L9abc

; Unused
L810b:
  defb $00,$00,$00


L810e:
  cp $0b
  ret nz

  ld a,$ff
  ld (L_7FFC),a

  ret
