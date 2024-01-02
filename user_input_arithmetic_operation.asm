org 100h

.data 
first db ?
second db ?
sum db ?
difference db ?
product db ?
quotient db ?
reminder db ?

.code
mov ax,@data
mov ds,ax

;first digit
mov ah,01h
int 21h
sub al,48
mov first,al

;second digit
mov ah,01h
int 21h
sub al,48
mov second,al

;addition
mov al,first
add al,second
mov sum,al

;subtraction
mov al,first
sub al,second
mov difference,al

;multiplication
mov al,first
mov bl,second
mul bl
mov product,al

;division
xor ax,ax
xor dx,dx
xor bx,bx
mov al,first    ;if I use 4 instead variable "first" & 2 instead "second"
mov bl,second   ;division result work perfectly, while using variable it's not giving correct result
div bl
mov quotient,al
mov reminder,ah


;newline start
mov dx,10
mov ah,02h
int 21h

mov dx,13
mov ah,02h
int 21h
;newline end

;print sum
mov dl,sum
add dl,48
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
mov dl,difference
add dl,48
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
mov dl,product
add dl,48
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
mov dl,quotient
add dl,48
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
mov dl,reminder
add dl,48
mov ah,02h
int 21h

ret

