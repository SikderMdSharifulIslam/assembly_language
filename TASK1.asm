
.MODEL SMALL
.STACK 100H
.DATA

   A DB 1
   ADDS DB ?
   
.CODE
    
    MAIN PROC
        
        MOV AX, @DATA 
        MOV DS, AX
        
        MOV AH, 01H
        INT 21H
        SUB AL,  48
        
        MOV CX,0        
        MOV CL,AL
        MOV BX,0
        MOV AX,0
        
        SUM:
        
            MOV AL, A
            MUL AL
            ADD BX, AX
            
            INC A
            LOOP SUM  
            
 		MOV ADDS, BL 
 		
 		MOV AH, 2
 		MOV DL, 10
 		INT 21H
 		MOV DL, 13
 		INT 21H
 		
 		MOV AH, 0
 		MOV AL, ADDS   
		MOV BL, 10
		DIV BL
		MOV CL, AH
		MOV DL, AL
		ADD DL, 48 
		MOV AH, 2
		INT 21H   
		MOV DL, CL
		ADD DL, 48 
		MOV AH, 2
		INT 21H 
            
	MOV AH, 4CH
	INT 21H            
            
    MAIN ENDP
    
END MAIN
RET