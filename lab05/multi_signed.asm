#include "xc.inc"
GLOBAL _multi_signed
PSECT mytext,local,class=CODE,reloc=2
    
_multi_signed:
    MOVWF 0x003 ;a
    MOVLW 0x00
    MOVWF BSR
    CLRF 0x020 ;flag
    MOVLW 0x04
    MOVWF 0x021 ;i
    GOTO check_a
    
check_a:
    BTFSS 0x003, 7
    GOTO check_b
    INCF 0x020
    COMF 0x003
    INCF 0x003
    
check_b:
    BTFSS 0x001, 3
    GOTO mul
    INCF 0x020
    COMF 0x001
    INCF 0x001
    
mul:
    BTFSS 0x001, 0
    GOTO check_loop
    MOVFF 0x003, WREG
    ADDWF 0x011
    CLRF WREG
    ADDWFC 0x010
    
check_loop:
    BCF STATUS, 0
    RRCF 0x001
    BCF STATUS, 0
    RRCF 0x010
    RRCF 0x011
    RRCF 0x012
    DECFSZ 0x021
    GOTO mul
    GOTO check_sign
    
check_sign:
    BCF STATUS, 0
    RLCF 0x012
    RLCF 0x011
    RLCF 0x010
    RLCF 0x012
    RLCF 0x011
    RLCF 0x010
    RLCF 0x012
    RLCF 0x011
    RLCF 0x010
    RLCF 0x012
    RLCF 0x011
    RLCF 0x010
    BTFSS 0x020, 0
    GOTO done
    COMF 0x010
    COMF 0x011
    INCF 0x011
    GOTO done
    
done:
    MOVFF 0x010, 0x002
    MOVFF 0x011, 0x001
    RETURN
    
