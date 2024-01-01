org 100h

.data
msg1 db 10,13,"Enter a Character: $"
msg2 db 10,13,"Alphabet $"
msg3 db 10,13,"Digit $"
msg4 db 10,13,"Special Character $"

.code
    mov ax,@data
    mov ds,ax 
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,30h
    jge regular
    
    special:
    mov ah,9
    lea dx,msg4
    int 21h
    jmp endd
    
    regular:
    cmp bl,39h
    jle digit
    jg char
    
    digit:
    mov ah,9
    lea dx,msg3
    int 21h
    jmp endd
           
    char:
    mov ah,9
    lea dx,msg2
    int 21h
    jmp endd          
    
    endd:

ret




