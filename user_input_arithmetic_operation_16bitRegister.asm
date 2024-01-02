org 100h

.data 
first dw ?
second dw ?
sum dw ?
difference dw ?
product dw ?
quotient dw ?
reminder dw ?

.code
mov ax,@data
mov ds,ax

;first digit
mov ah,01h
int 21h
xor ah,ah
sub ax,48
mov first,ax

;second digit
mov ah,01h
int 21h
xor ah,ah
sub ax,48
mov second,ax

;addition
mov ax,first
add ax,second
mov sum,ax

;subtraction
mov ax,first
sub ax,second
mov difference,ax

;multiplication
mov ax,first
mov bx,second
mul bx
mov product,ax

;division
xor ax,ax
xor dx,dx
xor bx,bx
mov ax,first    ;if I use 4 instead variable "first" & 2 instead "second"
mov bx,second   ;division result work perfectly, while using variable it's not giving correct result
div bx
mov quotient,ax
mov reminder,dx


;newline start
mov dx,10
mov ah,02h
int 21h

mov dx,13
mov ah,02h
int 21h
;newline end

;print sum
mov dx,sum
add dx,48
mov ah,02h
int 21h

;newline start
mov dx,10
mov ah,02h
int 21h

mov dx,13
mov ah,02h
int 21h
;newline end

;print difference
mov dx,difference
add dx,48
mov ah,02h
int 21h

;newline start
mov dx,10
mov ah,02h
int 21h

mov dx,13
mov ah,02h
int 21h
;newline end

;print product
mov dx,product
add dx,48
mov ah,02h
int 21h

;newline start
mov dx,10
mov ah,02h
int 21h

mov dx,13
mov ah,02h
int 21h
;newline end

;print quotient
mov dx,quotient
add dx,48
mov ah,02h
int 21h

;newline start
mov dx,10
mov ah,02h
int 21h

mov dx,13
mov ah,02h
int 21h
;newline end

;print reminder
mov dx,reminder
add dx,48
mov ah,02h
int 21h


ret