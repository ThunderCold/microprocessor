List p=18f4520 ;???PIC18F4520
    ;???PIC18F
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x00 ; ???0x00???????
	
MOVLW 0x2A
MOVWF 0x000
MOVLW 0x41
MOVWF 0x001
MOVLW d'15'
MOVWF 0x002 ;ans
CLRF 0x003 ;flag

MOVLW 0x08
MOVWF 0x004 ;i
r_1:
BTFSC 0x000, 7 ;if bit7=1
INCF 0x003 ;then flag++
CLRF WREG
CPFSEQ 0x003 ;if flag!=0
GOTO nosub_1
DECF 0x002 ;if flag=0, then ans--
nosub_1:
RLNCF 0x000 ;rotate
DECFSZ 0x004
GOTO r_1
    
MOVLW 0x08
MOVWF 0x004 ;i
r_2:
BTFSC 0x001, 7 ;if bit7=1
INCF 0x003 ;then flag++
CLRF WREG
CPFSEQ 0x003 ;if flag!=0
GOTO nosub_2
DECF 0x002 ;if flag=0, then ans--
nosub_2:
RLNCF 0x001 ;rotate
DECFSZ 0x004
GOTO r_2
    
MOVLW 0x02
CPFSLT 0x003
INCF 0x002

end
    
