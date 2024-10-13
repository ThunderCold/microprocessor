List p=18f4520 ;???PIC18F4520
    ;???PIC18F
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x00 ; ???0x00???????

init:
    MOVLW d'9'
    MOVWF 0x010 ;n
    CLRF 0x011 ;i
    MOVFF 0x010, 0x012 ;0x012 is also n
    CLRF 0x020
    CLRF 0x021
    CLRF 0x030
    MOVLW d'1'
    MOVWF 0x031
    MOVLW d'2'
    CPFSLT 0x010
    RCALL fib
    RCALL ans
    GOTO theend
    
fib:
    BTFSC 0x011, 0
    GOTO fib_odd
    GOTO fib_even
    fib_odd:
    MOVFF 0x021, WREG
    ADDWF 0x031, F
    MOVFF 0x020, WREG
    ADDWFC 0x030, F
    GOTO fib_end
    fib_even:
    MOVFF 0x031, WREG
    ADDWF 0x021, F
    MOVFF 0x030, WREG
    ADDWFC 0x020, F
    fib_end:
    INCF 0x011
    DECFSZ 0x010
    GOTO fib
    RETURN
    
ans:
    BTFSC 0x012, 0
    GOTO ans_odd
    GOTO ans_even
    ans_odd:
    MOVFF 0x030, 0x000
    MOVFF 0x031, 0x001
    GOTO ans_end
    ans_even:
    MOVFF 0x020, 0x000
    MOVFF 0x021, 0x001
    ans_end:
    RETURN
    
theend:
    end
