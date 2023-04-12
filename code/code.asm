.include "/sdcard/Download/FWC/gate2/m328Pdef.inc"

ldi r17, 0b11110011
out DDRD,r17 
ldi r17,0b11111111 
ldi r16,0b00000001
out DDRB,r16    
start:           
        in r17,PIND  
;Taking Q
        ldi r24,0b00000100 
	mov r18,r17
        and r18,r24 
	ldi r25,0b00000010
        loopQ:  lsr r18
	dec r25
        brne    loopQ   
	.DEF Q = r18
;Taking A
        mov r19,r17
	ldi r24,0b00001000
	and r19,r24
	ldi r25,0b00000011
        loopA:  lsr r19
        dec r25         
	brne loopA
        .DEF A = r19
        ldi r21,0x00
        ldi r22,0x00        
        .DEF T1 = r21     
	.DEF T2 = r22
	;D=(AQ)'  
        mov T1,Q     
        mov T2,A
        and T1,T2  
	com T1
	out PORTB,T1
       rjmp start
