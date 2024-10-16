List p=18f4520 ;???PIC18F4520
    ;???PIC18F
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x00 ; ???0x00???????

MOVLW 0x02
MOVWF 0x020 ;xh
MOVLW 0x0C
MOVWF 0x021 ;xl
MOVLW 0x00
MOVWF 0x022 ;yh
MOVLW 0x0F
MOVWF 0x023 ;yl
CLRF 0x000
CLRF 0x001
CLRF 0x010
CLRF 0x011
CLRF 0x030

Sub_Mul MACRO xh, xl, yh, yl
    MOVF yl, W
    SUBWF xl, W
    MOVWF 0x001
    MOVF yh, W
    SUBWFB xh, W
    MOVWF 0x000
    MOVF 0x000, W
    MULWF 0x001
    MOVFF PRODH, 0x010
    MOVFF PRODL, 0x011
    ENDM

Sub_Mul 0x020, 0x021, 0x022, 0x023

end
