org 100h

.data 
msg1 db 10,13,"Enter Number: $"
msg2 db 10,13,"Even $"
msg3 db 10,13,"Odd $"

.code
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h  
    
    mov ah,1
    int 21h
    mov ah,0
    
    check:
    mov dl,2
    div dl
    cmp ah,0
    
    jne odd 
    
    even:
    mov ah,9
    lea dx,msg2
    int 21h
    jmp endd
    
    odd:
    mov ah,9
    lea dx,msg3
    int 21h
    
    endd:
ret




