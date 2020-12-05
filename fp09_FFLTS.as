;/*********************
;* Motorola MC6839
;* Floating-Point ROM for the MC6809
;* © 1982 Motorola
;*
;* C wrapper compiled by tim lindner
;* <tlindner@macmess.org>
;*
;* December 2020
;*
;* This wrapper is in the public domain
;*
;**********************/

 section code

_float09 IMPORT
_fp09_FFLTS EXPORT

_fp09_FFLTS:
 ldx 6,s				; result address
 ldy 4,s				; arg2 address
 ldd 2,s				; FPCB address
 lbsr _float09+$3D
 fcb $24
 rts
 endsect
