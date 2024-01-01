; N numbers sum = n(n+1)/2 
; natural numbers square sum = (n(n+1)(2n+1))/6

org 100h

.data
n dw ?
sum dw ?
v1 dw ?
v2 dw ?
v3 dw ?

newline db 0dh, 0ah, "$"

.code
mov ax,@data
mov ds, ax

mov ah,1
int 21h
xor ah,ah
sub ax,48
mov bx,10
mul bx
mov n,ax

mov ah,1
int 21h
xor ah,ah
sub ax,48
mov bx,1
mul bx
add n,ax

mov ah,9
lea dx,newline
int 21h

mov sum,0
mov cx,n

start:
add sum,cx
loop start

mov ah,9
lea dx,newline
int 21h

;MSB
xor dx,dx
xor ah,ah
mov ax,sum
mov bx,10000
div bx
mov sum,ax
mov bx,dx

mov ah,2
mov dx,sum
add dx,48
int 21h

; 2nd digit
xor dx,dx
xor ah,ah
mov ax,bx
mov bx,1000
div bx
mov sum,ax
mov bx,dx

mov ah,2
mov dx,sum
add dx,48
int 21h

; 3rd digit
xor dx,dx
xor ah,ah
mov ax,bx
mov bx,100
div bx
mov sum,ax
mov bx,dx

mov ah,2
mov dx,sum
add dx,48
int 21h

; 4th digit
xor dx,dx
xor ah,ah
mov ax,bx
mov bx,10
div bx
mov sum,ax
mov bx,dx

mov ah,2
mov dx,sum
add dx,48
int 21h

; LSB digit
xor dx,dx
xor ah,ah
mov ax,bx
mov bx,1
div bx
mov sum,ax
mov bx,dx

mov ah,2
mov dx,sum
add dx,48
int 21h

ret



