List p=18f4520 ;???PIC18F4520
    ;???PIC18F
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x00 ; ???0x00???????

MOVLW b'10000001'
MOVWF 0x000
MOVLW 0x05
MOVWF 0x010
	
MOVLW 0x08
MOVWF 0x020

loop:
BTFSC 0x000, 0
GOTO notmul24
BTFSC 0x000, 1
GOTO mul2
GOTO mul4
notmul24:
DECF 0x010
GOTO checkloop
mul2:
INCF 0x010
GOTO checkloop
mul4:
INCF 0x010
INCF 0x010
GOTO checkloop
checkloop:
RRNCF 0x000
DECFSZ 0x020
GOTO loop
    
end
