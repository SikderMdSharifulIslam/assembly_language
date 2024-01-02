;db means 8-bit, so all operation will be held into 8-bit register. ? means default value 0
;dw means 16-bit, so all operation will be held into 16-bit register. So, db=data byte & dw=data word means types of variable

org 100h

.data
a dw 111 
b dw 100
sum dw ?
difference dw ?
product dw ?
quotient dw ?
reminder dw ? 

.code 

;data fetching & storing into data segment register DS
mov ax,@data
mov ds,ax

;addition
mov ax,a
add ax,b
mov sum,ax

;subtraction
mov ax,a
sub ax,b
mov difference,ax

;multiplication
mov ax,a
mul b
mov product,ax

;division
xor dx,dx ;set dx=0 because reminder will store into it
mov ax,a
div b
mov quotient,ax
mov reminder,dx

ret
