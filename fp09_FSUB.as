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
_fp09_FSUB EXPORT

_fp09_FSUB:
 pshs u
 ldx 10,s				; result address
 ldu 8,s				; arg1
 ldy 6,s				; arg2
 ldd 4,s				; FPCB address
 lbsr _float09+$3D
 fcb $02
 puls u,pc
 endsect
