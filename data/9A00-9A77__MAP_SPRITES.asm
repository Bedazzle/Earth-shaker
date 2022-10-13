L9a00:
  defs 8

L9a08:
  defm "**&**&**"

; Data block at 9A10
L9a10:
  defb $00,$1c,$3e,$7d

; Message at 9A14
L9a14:
  defm "zU*"

; Data block at 9A17
L9a17:
  defb $14

; Message at 9A18
L9a18:
  defm "<fn"

; Data block at 9A1B
L9a1b:
  defb $7c,$78,$2e,$e2,$83

; Message at 9A20
L9a20:
  defm "<fv>"

; Data block at 9A24
L9a24:
  defb $1e,$74,$47,$c1,$fe,$82,$fe,$00
  defb $ef,$28,$ef,$00,$82,$b0,$06,$58
  defb $03,$50,$02,$48,$38,$7c,$ba,$c6

; Message at 9A3C
L9a3c:
  defm "TT8"

; Data block at 9A3F
L9a3f:
  defb $10,$18

; Message at 9A41
L9a41:
  defm ",,88<<"

; Data block at 9A47
L9a47:
  defb $18,$00,$00,$70,$f8,$ff,$8f,$07
  defb $00,$10,$38,$7c,$38,$7c,$10,$12
  defb $0c,$81,$30,$40,$40,$00,$81,$ff
  defb $ff

; Message at 9A60
L9a60:
  defm "B$$$Z"

; Data block at 9A65
L9a65:
  defb $bd,$81,$7e,$00,$fe,$fe

; Message at 9A6B
L9a6b:
  defm "002>"

; Data block at 9A6F
L9a6f:
  defb $1c,$3c,$42,$b9,$a1,$a1,$81

; Message at 9A76
L9a76:
  defm "B<"
