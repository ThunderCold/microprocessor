List p=18f4520 ;???PIC18F4520
    ;???PIC18F
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x00 ; ???0x00???????
    
init:
    MOVLW 0xF4
    MOVWF 0x000 ;a1
    MOVLW 0xFD
    MOVWF 0x001 ;a2
    MOVLW 0x03
    MOVWF 0x002 ;a3
    MOVLW 0x06
    MOVWF 0x010 ;b1
    MOVLW 0x0C
    MOVWF 0x011 ;b2
    MOVLW 0x01
    MOVWF 0x012 ;b3
    CLRF 0x020
    CLRF 0x021
    CLRF 0x022
    RCALL cross
    GOTO theend

cross:
    ; c1 = a2*b3 - a3*b2
    MOVF 0x001, W ;a2
    MULWF 0x012 ;b3
    MOVFF PRODL, 0x030
    MOVFF PRODH, 0x031
    MOVF 0x002, W ;a3
    MULWF 0x011 ;b2
    MOVF PRODL, W
    SUBWF 0x030, F
    MOVF PRODH, W
    SUBWFB 0x031, F
    MOVFF 0x030, 0x020 ; Store result in c1

    ; Calculate c2 = a3*b1 - a1*b3
    MOVF 0x002, W ;a3
    MULWF 0x010 ;b1
    MOVFF PRODL, 0x030
    MOVFF PRODH, 0x031
    MOVF 0x000, W ;a1
    MULWF 0x012 ;b3
    MOVF PRODL, W
    SUBWF 0x030, F
    MOVF PRODH, W
    SUBWFB 0x031, F
    MOVFF 0x030, 0x021 ; Store result in c2

    ; Calculate c3 = a1*b2 - a2*b1
    MOVF 0x000, W ;a1
    MULWF 0x011 ;b2
    MOVFF PRODL, 0x030
    MOVFF PRODH, 0x031
    MOVF 0x001, W ;a2
    MULWF 0x010 ;b1
    MOVF PRODL, W
    SUBWF 0x030, F
    MOVF PRODH, W
    SUBWFB 0x031, F
    MOVFF 0x030, 0x022 ; Store result in c3

    RETURN

theend:
    end
