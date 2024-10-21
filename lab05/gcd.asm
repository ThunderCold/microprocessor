#include "xc.inc"
GLOBAL _gcd
PSECT mytext,local,class=CODE,reloc=2

_gcd:
    MOVLW 0x00
    MOVWF BSR
    GOTO check
    
check:
    MOVF  0x000, W       ; 將 a 的高位放入 WREG
    SUBWF 0x002, W       ; 比較 a 的高位與 b 的高位
    BZ     check_low     ; 如果高位相等，則跳轉去比較低位
    BNC    b_bigger      ; 如果 b 的高位比較大，跳轉到 b_bigger
    GOTO   a_bigger
    
check_low:
    MOVF  0x001, W       ; 將 a 的低位放入 WREG
    SUBWF 0x003, W       ; 比較 a 的低位與 b 的低位
    BNC    a_bigger      ; 如果 b 的低位比較大，跳轉到 b_bigger
    GOTO   b_bigger
    
a_bigger:
    MOVFF 0x003, WREG
    SUBWF 0x001, F
    MOVFF 0x002, WREG
    SUBWFB 0x000, F
    MOVFF 0x000, WREG
    IORWF 0x001, W
    TSTFSZ WREG
    GOTO check
    MOVFF 0x002, 0x010
    MOVFF 0x003, 0x011
    GOTO done
    
b_bigger:
    MOVFF 0x001, WREG
    SUBWF 0x003, F
    MOVFF 0x000, WREG
    SUBWFB 0x002, F
    MOVFF 0x002, WREG
    IORWF 0x003, W
    TSTFSZ WREG
    GOTO check
    MOVFF 0x000, 0x010
    MOVFF 0x001, 0x011
    GOTO done
    
done:
    RETURN
