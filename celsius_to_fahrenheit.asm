;Formula
;Celsius = (fahrenheit-32)*5/9
org 100h
.data
f dw ?
c dw 46
.code
mov ax,@data
mov ds,ax
mov ax,c
mov bx,9
mul bx
mov f,ax
xor dx,dx
mov bx,5
div bx
mov f,ax
mov bx,32
add ax,bx
mov f,ax
ret