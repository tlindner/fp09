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
_fp09_FMOV EXPORT

_fp09_FMOV:
 pshs u
 ldx 10,s				; result
 ldy 8,s				; arg2
 ldu 6,s				; parameter
 ldd 4,s				; FPCB address
 lbsr _float09+$3D
 fcb $9a
 puls u,pc
 endsect
