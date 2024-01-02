org 100h

.data
msg1 db 10,13,"Enter Values of A B C D: $"
msg2 db 10,13,"Accepted values $"
msg3 db 10,13,"Values not accepted $"
a db ?
b db ?
c db ?
d db ? 
sum1 db ?
sum2 db ?

.code
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov a,al
    
    mov ah,1
    int 21h
    sub al,48
    mov b,al
    
    mov ah,1
    int 21h
    sub al,48
    mov c,al
    
    mov ah,1
    int 21h
    sub al,48
    mov d,al
    
    mov bl,b
    cmp bl,c
    jg check2
    
    mov ah,9
    lea dx,msg3
    int 21h
    jmp endd
    
    check2:
    mov bl,d
    cmp bl,a
    jg level2
    
    mov ah,9
    lea dx,msg3
    int 21h
    jmp endd
    
    level2:
    mov al,c
    add al,d
    mov sum1,al
    mov al,a
    add al,b
    mov sum2,al
    
    mov bl,sum1
    cmp bl,sum2
    
    jg checkEven
    
    mov ah,9
    lea dx,msg3
    int 21h
    jmp endd
    
    
    checkEven:
    xor ax,ax
    xor bx,bx
    mov al,a
    mov bl,2
    div bl
    
    cmp ah,0
    
    je accepted
    
    mov ah,9
    lea dx,msg3
    int 21h
    
    accepted:
    mov ah,9
    lea dx,msg2
    int 21h
    
    
    endd:

ret




