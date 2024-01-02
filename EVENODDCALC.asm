
org 100h
            
            
            
.STACK 100H 


EVENCALC MACRO ARRAY, ARRSIZE 
    
    MOV AH, 9           
    LEA DX, MSG2
    INT 21H 
    
    XOR CX, CX
    MOV CL, ARRSIZE
        
    LEA SI, ARRAY
    
    EVEN:
    XOR AH,AH
    
    MOV AL, [SI]
    MOV BL, 2
    DIV BL
    
    CMP AH, 0
    JNE SKIP1
    
    MOV DL, [SI]  
    ADD DL, 48
    MOV AH,2
    INT 21H 
    
    MOV DL, " "  
    MOV AH,2
    INT 21H
    
    SKIP1:
    INC SI 
    LOOP EVEN
   
ENDM 
 
ODDCALC MACRO INARRAY, INARRSIZE 
    
    MOV AH, 9           
    LEA DX, MSG3
    INT 21H 
    
    XOR CX, CX
    MOV CL, INARRSIZE
        
    LEA SI, INARRAY
    
    ODD:
    XOR AH,AH
    
    MOV AL, [SI]
    MOV BL, 2
    DIV BL
    
    CMP AH, 0
    JE SKIP
    
    MOV DL, [SI]  
    ADD DL, 48
    MOV AH,2
    INT 21H
     
    MOV DL, " "  
    MOV AH,2
    INT 21H 
    
    SKIP:
    INC SI 
    LOOP ODD
    
    
ENDM


.DATA
    ARR DB 10 DUP (?)
    SIZE DB 0 
    ENENNUM DB 0
    ODDNUM DB 0
    
    MSG DB 10,13, "ENTER THE SIZE OF THE ARRAY: $"
    MSG1 DB 10,13,  "ENTER THE ELEMENT OF THE ARRAY: $"  
    MSG2 DB 10,13,  "THE EVEN NUMBERS ARE: $"
    MSG3 DB 10,13,  "THE ODD NUMBERS ARE: $"

.CODE
MAIN PROC
       
    MOV AX, @DATA
    MOV DS, AX
               
    MOV AH, 9           
    LEA DX, MSG
    INT 21H
        
    MOV AH, 01
    INT 21H
    SUB AL, 48
    MOV SIZE, AL
    
    MOV AH, 9           
    LEA DX, MSG1
    INT 21H
    
    LEA SI, ARR
    XOR CX,CX
    
    MOV CL, SIZE
    
    INPUT:    
        MOV AH, 01
        INT 21H     
        SUB AL, 48
        MOV [SI], AL 
        INC SI 
        
        MOV AH, 2
        MOV DL, " " 
        INT 21H
    LOOP INPUT 
    
    EVENCALC ARR, SIZE
    ODDCALC ARR, SIZE        
           
MAIN ENDP    
     
END MAIN

ret
