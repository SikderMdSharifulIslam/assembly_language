.model small
.stack 100h

.data
msg db "Enter the number of elements: $"
line db 0ah, 0dh, "$"
a db 100 dup(?)
counter db ?
result db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    mov dx, offset msg
    int 21h
    
    xor cx,cx
    mov ah,1
    int 21h
    mov cl,al
    sub cl,48
    mov counter,cl
    
    mov si,offset a
    
    input:
        mov ah,9
        mov dx,offset line
        int 21h
        
        mov ah,1
        int 21h
        mov a[si],al
        sub a[si],48
        inc si
        loop input
        
    mov cl,counter
    mov bl,0
    mov si,offset a
    
    
    sum:
        add bl,a[si]
        inc si
        loop sum
    
    mov result, bl
    mov ah,4ch
    int 21h
    main endp
end main
    