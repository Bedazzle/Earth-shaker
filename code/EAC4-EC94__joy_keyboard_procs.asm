; 000FUDLR Kempston joystick
;     8421 

check_joy_left:
	NOP_4
	in      a, (PORT_JOY)
	and     JOY_LEFT
	ret     z

check_joy_right:
	NOP_4
	in      a, (PORT_JOY)
	and     JOY_RIGHT
	ret     z

check_joy_up:
	NOP_4
	in      a, (PORT_JOY)
	and     JOY_UP
	ret     z

check_joy_down:
	NOP_4
	in      a, (PORT_JOY)
	and     JOY_DOWN
	ret     z  

check_joy_fire:
	NOP_4
	in      a, (PORT_JOY)
	and     JOY_FIRE
	defb  $20		; jr nz,...

	; ----------------------------

check_2joy_left:
	NOP_4
	in      a, (PORT_JOY)
	and     JOY_LEFT
	ret     z

check_2joy_right:
	NOP_4
	in      a, (PORT_JOY)
	and     JOY_RIGHT
	ret     z

check_2joy_up:
	NOP_4
	in      a, (PORT_JOY)
	and     JOY_UP
	ret     z

check_2joy_down:
	NOP_4
	in      a, (PORT_JOY)
	and     JOY_DOWN
	ret     z

	; ----------------------------

check_key_left:
	ld      a, KEYS_YUIOP	;$DF
	out     ($FF), a
	in      a, (PORT_KEY)
	and     2			; key O
	ret     nz

check_key_right:
	ld      a, KEYS_YUIOP	;$DF
	out     ($FF), a
	in      a, (PORT_KEY)
	and     1			; key P
	ret     nz

check_key_up:
	ld      a, KEYS_TREWQ	;$FB
	out     ($FF), a
	in      a, (PORT_KEY)
	and     1			; key Q
	ret     nz

check_key_down:
	ld      a, KEYS_GFDSA	;$FD
	out     ($FF), a
	in      a, (PORT_KEY)
	and     1			; key A
	ret     nz

check_key_fire:
	ld      a, KEYS_BNMss	;$7F
	out     ($FF), a
	in      a, (PORT_KEY)
	and     4			; key N
	defb  $28		; jr z, ...

	; ----------------------------

check_2key_left:
	ld      a, KEYS_YUIOP	;$DF
	out     ($FF), a
	in      a, (PORT_KEY)
	and     2		; key O
	ret     nz

check_2key_right:
	ld      a, KEYS_YUIOP	;$DF
	out     ($FF), a
	in      a, (PORT_KEY)
	and     1		; key P
	ret     nz

check_2key_up:
	ld      a, KEYS_TREWQ	;$FB
	out     ($FF), a
	in      a, (PORT_KEY)
	and     1		; key Q
	ret     nz

check_2key_down:
	ld      a, KEYS_GFDSA	;$FD
	out     ($FF), a
	in      a, (PORT_KEY)
	and     1		; key A
	ret     nz

	; ----------------------------
  
save_keys:
	ld      bc, $0009
	ld      hl, is_left_pressed
	ld      de, check_key_left	; LD DE's can be optimized by removing, all are consequent
	ldir

	ld      bc, $0009
	ld      hl, is_right_pressed
	ld      de, check_key_right
	ldir

	ld      bc, $0009
	ld      hl, is_up_pressed
	ld      de, check_key_up
	ldir

	ld      bc, $0009
	ld      hl, is_down_pressed
	ld      de, check_key_down
	ldir

	ld      bc, $0009
	ld      hl, is_fire_pressed
	ld      de, check_key_fire
	ldir

	ld      bc, $0009
	ld      hl, is_2left_pressed
	ld      de, check_2key_left
	ldir

	ld      bc, $0009
	ld      hl, is_2right_pressed
	ld      de, check_2key_right
	ldir

	ld      bc, $0009
	ld      hl, is_2up_pressed
	ld      de, check_2key_up
	ldir

	ld      bc, $0009
	ld      hl, is_2down_pressed
	ld      de, check_2key_down
	ldir

	ret



restore_keys:
  ld bc,$0009
  ld de,is_left_pressed
  ld hl,check_key_left	; LD HL's can be optimized by removing, all are consequent
  ldir

  ld bc,$0009
  ld de,is_right_pressed
  ld hl,check_key_right
  ldir

  ld bc,$0009
  ld de,is_up_pressed
  ld hl,check_key_up
  ldir

  ld bc,$0009
  ld de,is_down_pressed
  ld hl,check_key_down
  ldir

  ld bc,$0009
  ld de,is_fire_pressed
  ld hl,check_key_fire
  ldir

  ld bc,$0009
  ld de,is_2left_pressed
  ld hl,check_2key_left
  ldir

  ld bc,$0009
  ld de,is_2right_pressed
  ld hl,check_2key_right
  ldir

  ld bc,$0009
  ld de,is_2up_pressed
  ld hl,check_2key_up
  ldir

  ld bc,$0009
  ld de,is_2down_pressed
  ld hl,check_2key_down
  ldir

  ret




restore_joystick:
  call save_keys
  ld bc,$0009
  ld de,is_left_pressed
  ld hl,check_joy_left	; LD HL's can be optimized by removing, all are consequent
  ldir

  ld bc,$0009
  ld de,is_right_pressed
  ld hl,check_joy_right
  ldir

  ld bc,$0009
  ld de,is_up_pressed
  ld hl,check_joy_up
  ldir

  ld bc,$0009
  ld de,is_down_pressed
  ld hl,check_joy_down
  ldir

  ld bc,$0009
  ld de,is_fire_pressed
  ld hl,check_joy_fire
  ldir

  ld bc,$0009
  ld de,is_2left_pressed
  ld hl,check_2joy_left
  ldir

  ld bc,$0009
  ld de,is_2right_pressed
  ld hl,check_2joy_right
  ldir

  ld bc,$0009
  ld de,is_2up_pressed
  ld hl,check_2joy_up
  ldir

  ld bc,$0009
  ld de,is_2down_pressed
  ld hl,check_2joy_down
  ldir

  ret
