
org 100h



.DATA   
    ARRAY DB 10 DUP (?)
    REVARR DB 10 DUP (?)  
    SIZE DB 0
    
    MSG1 DB 10,13, "ENTER THE SIZE OF THE ARRAY: $"
    MSG2 DB 10,13, "ENTER THE ARRAY DIGITS: $"
    MSG3 DB 10,13, "THE REVERSED ARRAY DIGITS: $"
     
.CODE  

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    MOV DX, OFFSET MSG1
    INT 21H 
    
    MOV AH, 1
    INT 21H 
    SUB AL, 48
    
    MOV SIZE, AL 
                 
    MOV AH, 9
    MOV DX, OFFSET MSG2
    INT 21H  
    
    LEA SI, ARRAY
    XOR CX, CX  
    
    MOV CL, SIZE  
    
    INPUT: 
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MOV [SI], AL 
        
        MOV AH,2
        MOV DL, " "
        INT 21H  
        
        INC SI
        
    LOOP INPUT 
    
    CALL REVERSE 
    
  
    MAIN ENDP

REVERSE PROC
       
    MOV AH, 9
    LEA DX, MSG3
    INT 21H
    
    XOR CX,CX
    MOV CL, SIZE
    
    
    LEA SI, ARRAY 

    
    REV:  
        XOR DX,DX
      
        MOV DL, [SI]
        ADD DL, 48

        
        MOV AH, 2
        INT 21H
        
        
        inc SI

    LOOP REV 
    
    
REVERSE ENDP

END MAIN

ret




