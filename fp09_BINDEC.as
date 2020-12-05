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
_fp09_BINDEC EXPORT

_fp09_BINDEC:
 pshs u
 ldx 10,s
 ldy 8,s
 ldu 6,s
 ldd 4,s
 lbsr _float09+$3d
 fcb $1c
 puls u,pc
 endsect
