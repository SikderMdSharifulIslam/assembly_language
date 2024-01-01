org 100h

.data                 
msg1 db 10,13,"Enter Array Size: $"
msg2 db 10,13,"Enter Value: $"
msg3 db 10,13,"Given Array: $"
n db ?
myArray db 5 db dup(?)

.code
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov n,al
    
    mov si,0
    mov cl,n
    
    start:
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov myArray[si],al
    inc si
    loop start
    
    
    mov ah,9
    lea dx,msg3
    int 21h
    
    mov si,0
    mov cl,n
    
    output:
    mov ah,2
    mov dl,myArray[si]
    add dl,48
    int 21h
    inc si
    loop output

ret




