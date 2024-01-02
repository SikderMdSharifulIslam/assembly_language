org 100h

print macro p1
    mov ah,9
    int dx, p1
    int 21h
    
    mov ah,9
    lea dx,
    
    endm

.data
msg db "Hello! $"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    print msg,msg2

ret




