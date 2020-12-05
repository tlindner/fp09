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
_fp09_FPCMP EXPORT

_fp09_FPCMP:
 clrb
 pshs u,b
 ldx 11,s				; parameter
 ldu 9,s				; arg1
 ldy 7,s				; arg2
 ldd 5,s				; FPCB address
 lbsr _float09+$3D
 fcb $8e
 puls u,b
 bne skip
 incb
skip:
 clra
 rts
 endsect
