#include "xc.inc"
GLOBAL _sqrt
PSECT mytext,local,class=CODE,reloc=2
_sqrt:
    MOVFF 0x001, WREG
    MOVLW d'1'
    MOVWF 0x002

    loop:
    MULWF 0x002, W
    MOVFF PRODL, WREG
    CPFSGT 0x001
    GOTO ans
    INCF 0x002
    GOTO loop

    ans:
    MOVFF 0x002, WREG

    RETURN
