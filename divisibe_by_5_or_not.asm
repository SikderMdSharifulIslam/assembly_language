org 100h

.data
msg1 db 10,13,"Enter Number: $"
msg2 db 10,13,"Divisible by 5 $"
msg3 db 10,13,"Not Divisible by 5 $"  
num db ?

.code
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov num,al
    xor ax,ax
    xor bx,bx
    mov al,num
    mov bl,5
    div bl
    
    cmp ah,0
    jne notDivi
    
    mov ah,9
    lea dx,msg2
    int 21h
    jmp endd
    
    
    notDivi:
    mov ah,9
    lea dx,msg3
    int 21h
    
    endd:

ret




