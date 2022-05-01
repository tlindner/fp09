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
_fp09_FCMP EXPORT

_fp09_FCMP:
 pshs u
 ldx 10,s				; parameter
 ldu 8,s				; arg1
 ldy 6,s				; arg2
 ldd 4,s				; FPCB address
 lbsr _float09+$3D
 fcb $8a
 tfr cc,b
 andb #$0f
 clra
 puls u,pc
 endsect
