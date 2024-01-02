org 100h

.data
msg1 db 10,13,"Enter Last Two Digit of ID: $"
id db ? 
msb db ?
lsb db ?

.code
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,10
    mul bl
    mov id,al
    
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,1
    mul bl
    add id,al
    
    xor ah,ah
    mov al,id
    mov bl,2
    div bl
    
    cmp ah,0
    je even
    
    odd:
    xor ah,ah
    mov bl,3
    mov al,id
    div bl
    mov id,al
    xor ax,ax
    mov al,id
    mov bl,10
    div bl
    mov msb,al
    mov lsb,ah
    mov dl,msb
    add dl,48
    mov ah,2
    int 21h
    mov dl,lsb
    add dl,48
    mov ah,2
    int 21h
    jmp endd
    
    even:
    mov bl,10
    div bl
    mov msb,al
    mov lsb,ah
    mov dl,msb
    add dl,48
    mov ah,2
    int 21h
    mov dl,lsb
    add dl,48
    mov ah,2
    int 21h
    
    endd:
    
ret




