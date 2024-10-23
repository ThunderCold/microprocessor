#include "xc.inc"
GLOBAL _gcd
PSECT mytext,local,class=CODE,reloc=2

_gcd:
    MOVLW 0x00
    MOVWF BSR
    GOTO check
    
check:
    MOVF  0x002, W
    SUBWF 0x004, W
    BZ     check_low
    BNC    a_bigger
    GOTO   b_bigger
    
check_low:
    MOVF  0x001, W
    SUBWF 0x003, W
    BNC    a_bigger
    GOTO   b_bigger
    
a_bigger:
    MOVFF 0x003, WREG
    SUBWF 0x001, F
    MOVFF 0x004, WREG
    SUBWFB 0x002, F
    MOVFF 0x002, WREG
    IORWF 0x001, W
    TSTFSZ WREG
    GOTO check
    MOVFF 0x004, 0x010
    MOVFF 0x003, 0x011
    GOTO done
    
b_bigger:
    MOVFF 0x001, WREG
    SUBWF 0x003, F
    MOVFF 0x002, WREG
    SUBWFB 0x004, F
    MOVFF 0x004, WREG ;check if zero
    IORWF 0x003, W
    TSTFSZ WREG
    GOTO check
    ;MOVFF 0x002, 0x010
    ;MOVFF 0x001, 0x011
    GOTO done
    
done:
    RETURN
