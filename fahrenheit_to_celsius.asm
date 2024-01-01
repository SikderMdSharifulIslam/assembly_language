;Formula
;Fahrenheit = (celsius*9/5)+32
org 100h
.data
f dw 46
c dw ?
.code
mov ax,@data
mov ds,ax
mov ax,f
sub ax,32
mov c,ax

mov bx,5
mul bx
xor dx,dx
mov bx,9
div bx
mov c,ax
ret
