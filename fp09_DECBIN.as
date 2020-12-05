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
_fp09_DECBIN EXPORT

_fp09_DECBIN:
 pshs u
 ldx 8,s				; result address
 ldu 6,s				; BCD input string
 ldd 4,s				; FPCB address
 lbsr _float09+$3d
 fcb $22
 puls u,pc
 endsect
