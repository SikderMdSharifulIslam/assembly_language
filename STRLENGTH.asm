
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA  
     STRING DB 'HELLO WORLD', 0
     
     
        
  
.CODE 
MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX
    
    MOV SI, OFFSET STRING
    
    MOV CX, 0
    
    LEN:
    
    CMP BYTE [SI], 0
    JE EN
    
    INC SI
    INC CX
    
    JMP LEN 
    
    EN:
   
    XOR AX, AX
    MOV AX, CX 
    MOV BX, 10
    DIV BL
    
    MOV CL,AH
    MOV DL,AL
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

ret




