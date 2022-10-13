	device zxspectrum48

STARTBLOCK		EQU $6D42

INIT_LIVES		EQU 5
ADDITIONAL_TIME	EQU $20
TIME_SPEED		EQU $40

	;DEFINE DISPLAYLEVELS
	;DEFINE INFINITE_MAPS


L5800	EQU $5800
;L4000	EQU $4000
;L5aff	EQU $5AFF

	org STARTBLOCK
	include "earth_rzx.asm"
	
	savebin "recompile/earth.bin",STARTBLOCK,$FFFF-STARTBLOCK+1
	savesna "recompile/earth.sna",GAME_START
	
	; labelslist "earth.labels"
