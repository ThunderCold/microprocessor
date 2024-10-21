#include "xc.inc"
GLOBAL _mysqrt
PSECT mytext,local,class=CODE,reloc=2

_mysqrt:
    MOVFF 0x001, WREG
    MOVLW 1
    MOVWF 0x002, 1
    
loop:
    MULWF 0x002
    MOVFF PRODL, WREG
    CPFSGT 0x001, 1
    GOTO ans
    INCF 0x002, 1, 1
    GOTO loop
    
ans:
    MOVFF 0x002, 0x001
    CLRF 0x002
    
    RETURN
    
