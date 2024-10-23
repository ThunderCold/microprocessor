#include "xc.inc"
GLOBAL _mysqrt
PSECT mytext,local,class=CODE,reloc=2

_mysqrt:
    MOVWF 0x001
    MOVLW 0x00
    MOVWF BSR
    MOVLW 0x01
    MOVWF 0x002
    
loop:
    MOVFF 0x002, WREG
    MULWF 0x002
    MOVFF PRODL, WREG
    CPFSGT 0x001
    GOTO ans
    INCF 0x002
    GOTO loop
    
ans:
    MOVFF 0x002, WREG
    RETURN
    
