	MACRO COPY_MEM
		ld a,(hl)
		ld (de),a
	ENDM

	MACRO COPY_AND_RIGHT
		COPY_MEM
		inc l
		inc e
	ENDM

	MACRO COPY_AND_DOWN
		COPY_MEM
		inc l
		inc d
	ENDM

	MACRO COPY_AND_LEFT
		COPY_MEM
		inc l
		dec e
	ENDM

colored_sprite:
  call find_spritedata

  nop

  ld a,(de)
  ld l,a
  inc de
  ld a,(de)
  ld h,a

  call find_attr_DE

	; --------------------------
  COPY_AND_RIGHT	; top left attribute
  
  COPY_MEM			; top right
  inc l
  set 5,e

  COPY_AND_LEFT		; bottom right

  COPY_MEM			; bottom left
  inc hl
  res 5,e
  ld a,d
  and $03
  rlca
  rlca
  rlca
  or $40
  ld d,a			; screen address

	DUP 3
		COPY_AND_RIGHT
		COPY_AND_DOWN
		COPY_AND_LEFT

		COPY_MEM
		inc hl
		inc d
	EDUP

	COPY_AND_RIGHT
	COPY_AND_DOWN
	COPY_AND_LEFT

  COPY_MEM
  inc hl

  ld a,d
  sub $07
  ld d,a
  set 5,e

	DUP 3
		COPY_AND_RIGHT
		COPY_AND_DOWN
		COPY_AND_LEFT

		COPY_MEM
		inc hl
		inc d
	EDUP

	COPY_AND_RIGHT
	COPY_AND_DOWN
	COPY_AND_LEFT

  COPY_MEM

  ret
