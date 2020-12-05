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

        SECTION rodata
        EXPORT _float09
        EXPORT _flot09_end
_float09
        INCLUDEBIN Float09.bin
_flot09_end
        ENDSECTION
