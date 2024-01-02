org 100h

.data
myarray db 5 dup(?)
evenSum db ?
oddSum db ? 

.code
mov ax,@data
mov ds,ax

mov si,0
mov cx,5

mov ah,01

level:
int 21h
sub al,48
mov myarray[si],al
inc si
loop level

mov ah,02
mov dl,10
int 21h
mov ah,02
mov dl,13
int 21h

mov si,0
mov cx,5


level2:
cmp si,4
ja endC
mov al,myarray[si]
mov bl,2
xor ah,ah
div bl
mov bl,al
mov bh,ah
cmp bh,0
je even

odd:
mov bl,myarray[si]
add oddSum,bl
jmp con
even:
mov bl,myarray[si]
add evenSum,bl
con:
inc si
loop level2

endC:
mov ah,02
mov dl,evenSum
add dl,48
int 21h  
 
mov ah,02
mov dl,10
int 21h
mov ah,02
mov dl,13
int 21h 
 
mov ah,02
mov dl,oddSum
add dl,48
int 21h
ret




