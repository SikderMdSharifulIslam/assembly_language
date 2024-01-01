org 100h

.data
msg1 db 10,13,"Enter a number: $"
msg2 db 10,13,"Factorial: $"
fact db ?

.code
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    xor cx,cx
    mov cl,al
    mov fact,al
    dec cl
    
    start:
    mov al,fact
    mov bl,cl
    mul bl
    mov fact,al
    loop start
    
    mov ah,9
    lea dx,msg2
    int 21h  
    
    ;MSB
    xor ax,ax
    xor bx,bx
    mov al,fact
    mov bl,100
    div bl
    xor dx,dx
    mov dl,al
    mov fact,ah
    
    mov ah,2
    add dl,48
    int 21h
     
    ;2nd digit 
    xor ax,ax
    xor bx,bx
    mov al,fact
    mov bl,10
    div bl
    xor dx,dx
    mov dl,al
    mov fact,ah
    
    mov ah,2
    add dl,48
    int 21h
    
    ;LSB 
    xor ax,ax
    xor bx,bx
    mov al,fact
    mov bl,1
    div bl
    xor dx,dx
    mov dl,al
    mov fact,ah
    
    mov ah,2
    add dl,48
    int 21h   

ret




