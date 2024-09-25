List p=18f4520 ;???PIC18F4520
    ;???PIC18F
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x00 ; ???0x00???????

MOVLW 0x28
MOVWF 0x000
MOVLW 0x34
MOVWF 0x001
MOVLW 0x7A
MOVWF 0x002
MOVLW 0x80
MOVWF 0x003
MOVLW 0xA7
MOVWF 0x004
MOVLW 0xD1
MOVWF 0x005
MOVLW 0xFE
MOVWF 0x006
MOVLW 0x89 ;target
MOVWF 0x010

LFSR 0, 0x000 ;FSR0=0x000
LFSR 1, 0x006 ;FSR1=0x006
	
binarySearch:
MOVF FSR1L, W
CPFSGT FSR0L
GOTO start
GOTO not_found
start:
MOVF FSR0L, W ;calculate the middle position
ADDWF FSR1L, W
RRCF WREG, W ;divide by 2
MOVWF FSR2L ;FSR2=middle position
MOVF INDF2, W
CPFSEQ 0x010 ;detect target
GOTO not_equal
GOTO equal
not_equal:
CPFSLT 0x010 ;detect target
GOTO greater
GOTO less
equal:
MOVLW 0xFF
MOVWF 0x011
GOTO theend
greater:
MOVF FSR2L, W
MOVWF FSR0L ;update left bound
INCF FSR0L
GOTO binarySearch
less:
MOVF FSR2L, W
MOVWF FSR1L ;update right bound
DECF FSR1L
GOTO binarySearch
not_found:
MOVLW 0x00
MOVWF 0x011
theend:
end
