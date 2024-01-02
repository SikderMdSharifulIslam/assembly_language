org 100h

linear_search macro myArray,key
    mov cl,6
    mov si,0
    stt:
    mov al,myArray[si]
    cmp al,key
    je found
    inc si
    loop stt
    
    mov ah,9
    lea dx,msg3
    int 21h
    jmp endd
    
    found:
    mov ah,9
    lea dx,msg2
    int 21h
    
    endd:
    
endm

.data 
msg1 db 10,13,"Input Data: $"
msg2 db 10,13,"Data Found: $"
msg3 db 10,13,"Data Not Found: $"
myArray db 100 dup(?)
key db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov si,0
    mov cl,6
    
    start:
    mov ah,1
    int 21h
    sub al,48
    mov myArray[si],al
    inc si
    loop start
    
    call print_reverse 
    
    mov ah,1
    int 21h
    sub al,48
    mov key,al
    
    linear_search myArray,key

ret


print_reverse:
    mov si,5
    mov cl,6
    
    star:
    mov al,myArray[si]
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    dec si
    loop star

