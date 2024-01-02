
org 100h

.DATA 
    ARRAY DB 50 DUP (?)
    SIZE DB 0
    
    SEARCH_VALUE DB 0
    
    PROMPT1 DB 10,13,"ENTER THE SIZE OF THE ARRAY: $"
    PROMPT2 DB 10,13,"ENTER THE ARRAY ELEMENTS: $"
    PROMPT3 DB 10,13,"THE VALUE IS PRESENT$"
    PROMPT4 DB 10,13,"THE VALUE IS NOT PRESENT$" 
    PROMPT DB 10,13, "ENTER THE SEARCH ELEMENT: $"



.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV AH,9
    LEA DX, PROMPT1
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
    
    MOV SIZE, AL
    
    
    MOV AH,9
    LEA DX, PROMPT2
    INT 21H
    
    LEA SI, ARRAY
    XOR CX,CX
    
    MOV CL, SIZE
    
INPUT:   
    MOV AH, 1
    INT 21H 
    SUB AL, 48
    
    MOV [SI], AL
    INC SI
    
    MOV DL, " "
    MOV AH, 2
    
    INT 21H
    LOOP INPUT
    
    MOV AH,9
    LEA DX, PROMPT
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
    
    MOV SEARCH_VALUE, AL
    
    XOR SI,SI  
     
    SEARCH: 
    
    MOV BX, 0   
    MOV BL, SIZE
    CMP SI,  BX
    JE NOT_FOUND

    MOV AL, [ARRAY + SI]
    CMP AL, SEARCH_VALUE
    JE VALUE_FOUND

    INC SI
    JMP SEARCH
    
    VALUE_FOUND:
    MOV AH,9
    LEA DX, PROMPT3
    INT 21H 
    
    MOV AH, 4CH
    INT 21H
    
    NOT_FOUND:
    MOV AH,9
    LEA DX, PROMPT4
    INT 21H  
    
    MOV AH, 4CH
    INT 21H  
    
    MAIN ENDP

END MAIN

ret




