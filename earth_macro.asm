NOP_3	MACRO
		DUP 3
			nop
		EDUP
	ENDM

NOP_4	MACRO
		NOP_3
		nop
	ENDM

NOP_5	MACRO
		NOP_4
		nop
	ENDM

NOP_6	MACRO
		NOP_5
		nop
	ENDM

NOP_7	MACRO
		NOP_6
		nop
	ENDM

NOP_8	MACRO
		NOP_7
		nop
	ENDM

NOP_9	MACRO
		NOP_8
		nop
	ENDM