org 100h

.data
myArray db 100 dup(?)
N db ?
avg db ?
large db ?
small db ? 

msg dw "Enter N: $"
msg0 dw "Enter Inputs: $"
msg1 dw "Average: $"
msg2 dw "Largest: $"
msg3 dw "Smallest: $"

.code
main proc
    mov ax,@data
    mov ds,ax 
    
    mov ah,09
    lea dx,msg
    int 21h
    
    mov ah,01
    int 21h
    sub al,48
    mov N,al
    
    ;newline start
    mov dx,10
    mov ah,02h
    int 21h

    mov dx,13
    mov ah,02h
    int 21h
    ;newline end
    
    mov si,0
    xor cx,cx
    mov cl,N
    
    
    mov ah,09
    lea dx,msg0
    int 21h
    
    mov ah,01
    loopA:
    int 21h
    sub al,48
    mov myArray[si], al
    inc si
    loop loopA
    
    ;newline start
    mov dx,10
    mov ah,02h
    int 21h

    mov dx,13
    mov ah,02h
    int 21h
    ;newline end
    
    mov ah,09
    lea dx,msg1
    int 21h 
    
    call avgV
    
    ;newline start
    mov dx,10
    mov ah,02h
    int 21h

    mov dx,13
    mov ah,02h
    int 21h
    ;newline end 
    
    mov ah,09
    lea dx,msg2
    int 21h 
    
    call largest
    
    ;newline start
    mov dx,10
    mov ah,02h
    int 21h

    mov dx,13
    mov ah,02h
    int 21h
    ;newline end
    
    mov ah,09
    lea dx,msg3
    int 21h
    
    call smallest
ret

avgV proc
    mov si,0
    xor cx,cx
    mov cl,N  
    mov avg,0
    
    sum:
    mov dl,myArray[si]
    add avg,dl
    inc si
    loop sum

    xor ax,ax
    mov al,avg
    mov dl,N
    div dl
    mov avg,al
    
    xor dx,dx
    mov dl,avg
    add dl,48
    mov ah,02h
    int 21h    
ret
    
largest proc 
    xor dx,dx
    mov dl,myArray[0]
    mov large,dl 
    mov si,0
    xor cx,cx
    mov cl,N
    
    findLarge:
    mov al,myArray[si]
    mov bl,large
    cmp al,bl
    
    jae setLarge
    
    inc si
    loop findLarge
       
    setLarge:
    mov large,al
    inc si
    loop findLarge
    
    mov ah,2
    mov dl,large
    add dl,48
    int 21h    
ret

smallest proc
    xor dx,dx
    mov dl,myArray[0] 
    mov small,dl
    mov si,0
    xor cx,cx
    mov cl,N
    
    findSmall:
    mov al,myArray[si]
    mov bl,small
    cmp al,bl
    
    jae setSmall
    
    mov small,dl
    inc si
    loop findSmall
    
    setSmall:
    inc si
    loop findSmall
    
    mov ah,2
    mov dl,small
    add dl,48
    int 21h
ret