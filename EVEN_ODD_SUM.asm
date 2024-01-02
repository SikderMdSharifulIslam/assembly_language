
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 


EVENODDCALC MACRO INPUTARR, ARRSIZE
    
    XOR CX,CX
    MOV CL, ARRSIZE
    
    LEA SI, INPUTARR 
    
    CALC:
    XOR AH, AH 
    MOV AL, [SI]
    MOV BL,2
    DIV BL
    
    CMP AH, 0
    JNE ODD 
    
    MOV BL, EVENSUM
    ADD BL, [SI]
    MOV EVENSUM, BL
    
    JMP SKIP
     
    ODD: 
    MOV BL, ODDSUM
    ADD BL, [SI]
    MOV ODDSUM, BL
    
    SKIP:
    INC SI
    LOOP CALC    
    
ENDM  

OUTPUT MACRO DIGIT
    
    XOR AX, AX
    MOV AL, DIGIT
    MOV BX, 10 
    DIV BL  
    
    MOV CL, AH
    MOV DL, AL
    ADD DL, 48
    MOV AH , 2
    INT 21H
    
    MOV DL, CL
    ADD DL, 48 
    MOV AH , 2
    INT 21H
    
    
ENDM    


.STACK 100H

.DATA  
    ARR DB  10 DUP(?)
    SIZE DB 0
    EVENSUM DB 0
    ODDSUM DB 0
    
    MSG1 DB "ENTER THE SIZE OF THE ARRAY: $"
    MSG2 DB 10,13, "ENTER THE ARRAY ELEMENTS: $"
    ODDMSG DB 10,13,"THE SUM OF ODD DIGITS ARE: $"
    EVENMSG DB 10,13,"THE SUM OF EVEN DIGITS ARE: $"
    

.CODE

MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    MOV DX, OFFSET MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL, 30H
    MOV SIZE, AL
    
    MOV AH, 9
    MOV DX, OFFSET MSG2
    INT 21H     
    
    MOV AH, 2
    INT 21H
                      
    LEA SI, ARR 

	XOR CX, CX
	MOV CL, SIZE 
	
	INPUT:
	MOV AH, 1
	INT 21H  
	SUB AL, 30H
	MOV [SI], AL
	INC SI
	
	MOV AH, 2
	MOV DL, " "
	INT 21H
	LOOP INPUT
	
	EVENODDCALC ARR,SIZE 
	
	MOV AH, 9
    MOV DX, OFFSET EVENMSG
    INT 21H    
   
	OUTPUT EVENSUM
	
	MOV AH, 9
    MOV DX, OFFSET ODDMSG
    INT 21H      
    
    OUTPUT ODDSUM  
    
    MOV AH, 4CH
	INT 21H          
    
MAIN ENDP    
    
END MAIN

ret




