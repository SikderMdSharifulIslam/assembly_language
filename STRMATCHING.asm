
org 100h

.DATA

    STRING DB 10,13, "ENTER THE SIZE OF THE 1ST STRING: $" 
    
    STRING0 DB 10,13,"ENTER THE SIZE OF THE 2ND STRING: $"
    
    PROMPT DB 10,13,"ENTER THE VALUE OF THE STRING: $"
    
    SIZE DB 0
    SIZE1 DB 0
    
    STRING1 DB 100 DUP (?)  
    STRING2 DB 100 DUP (?) 
      
    STRING3 DB 10,13,'MATCHED$'
    STRING4 DB 10,13,'NOT MATCHED $'
        

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, STRING
    MOV AH, 9
    INT 21H
                 
    MOV AH, 1
    INT 21H 
    SUB AL, 48
    MOV SIZE, AL
    
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H
    
    LEA SI, STRING1
    XOR CX,CX
    
    MOV CL, SIZE
    
    INPUT:    
        MOV AH, 01
        INT 21H     
        MOV [SI], AL 
        INC SI 
        
        MOV AH, 2
        MOV DL, " " 
        INT 21H
    LOOP INPUT 
    
    
    LEA DX, STRING0
    MOV AH, 9
    INT 21H
                 
    MOV AH, 1
    INT 21H 
    SUB AL, 48
    MOV SIZE1, AL
    
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H
    
    LEA DI, STRING2
    XOR CX,CX
    
    MOV CL, SIZE1
    
    INPUT1:    
        MOV AH, 01
        INT 21H     
        MOV [DI], AL 
        INC DI 
        
        MOV AH, 2
        MOV DL, " " 
        INT 21H
    LOOP INPUT1 
    
    COMPARE: 
    MOV CL,SIZE 
    MOV BL, SIZE1
    
    CMP CL,BL
    JNE STRING_NOT_EQUAL 
  
    XOR AX,AX
    XOR BX,BX
    
    LEA SI, STRING1
    MOV AL, [SI]   
    
    LEA DI, STRING2
    MOV BL, [DI]  
    
    CMP AL, BL
    
    JNE STRING_NOT_EQUAL 
    JE STRING_EQUAL 
    
    INC SI
    INC DI
    JMP COMPARE
    
    STRING_NOT_EQUAL:
    LEA DX, STRING4
    MOV AH, 9
    INT 21H 
    
    MOV AH, 4CH
    INT 21H
    
    STRING_EQUAL:
    LEA DX, STRING3
    MOV AH, 9
    INT 21H
    
     
    MAIN ENDP

END MAIN
ret