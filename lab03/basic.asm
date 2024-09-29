List p=18f4520 ;設備是PIC18F4520
    ;初始化PIC18F
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x00 ; 程式從0x00的位置開始執行

MOVLW 0x5F
MOVWF 0x000
RLNCF 0x000
BTFSC 0x000, 7
GOTO one
GOTO zero
one:
MOVLW 0x80
GOTO or
zero:
MOVLW 0x00
or:
RRNCF 0x000
IORWF 0x000, F

end
