List p=18f4520 ;???PIC18F4520
    ;???PIC18F
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x00 ; ???0x00???????

MOVLW 0x07
MOVWF 0x000
MOVLW 0x09
MOVWF 0x001
ADDWF 0x000, W
MOVWF 0x002
	
MOVLW 0x12
MOVWF 0x010
MOVLW 0x01
MOVWF 0x011
SUBWF 0x010, W
MOVWF 0x012
	
CPFSEQ 0x002
GOTO noteq
MOVLW 0xBB
MOVWF 0x020
GOTO theend
	
noteq:
CPFSGT 0x002
GOTO A2larger
MOVLW 0xAA
MOVWF 0x020
GOTO theend

A2larger:
MOVLW 0xCC
MOVWF 0x020

theend:
end
