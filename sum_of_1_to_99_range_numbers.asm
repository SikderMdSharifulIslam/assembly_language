org 100h

.data
n dw ?
sum dw ?
v dw ?

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

mov cx,n

mov ah,9
lea dx,newline
int 21h

mov sum,0

start:
xor ah,ah 
mov bx,cx
add sum,bx
loop start

mov ah,9
lea dx,newline
int 21h

;MSB
xor dx,dx
xor ah,ah
mov ax,sum
mov bx,1000
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
mov bx,100
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




