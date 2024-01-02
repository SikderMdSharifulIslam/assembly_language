org 100h

.data
myarray db 5 dup(?)

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

mov ah,02

level2:
cmp si,4
ja endC
mov dl,myarray[si]
add dl,48
int 21h
inc si
inc si
loop level2

endC:
ret




