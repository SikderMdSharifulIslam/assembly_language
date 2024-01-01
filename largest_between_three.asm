org 100h

.data 
msg1 db 10,13,"Enter Three Numbers: $"
msg2 db 10,13,"Largest Number is: $"
num1 db ?
num2 db ?
num3 db ?
largest db ?

.code
 mov ax,@data
 mov ds,ax
 
 mov ah,9
 lea dx,msg1
 int 21h
 
 mov ah,1
 int 21h
 sub al,48
 mov num1,al

 mov ah,1
 int 21h
 sub al,48
 mov num2,al
 
 mov ah,1
 int 21h
 sub al,48
 mov num3,al
 
 mov bl,num2
 cmp al,bl
 jae compare2
 
 mov al,num2
 mov bl,num1
 cmp al,bl
 jae n2
 
 compare2:
 mov bl,num1
 cmp al,bl
 jae n3 
 
 mov ah,9
 lea dx,msg2
 int 21h
 mov dl,num1
 add dl,48
 mov ah,2
 int 21h
 jmp endd
 
 n2:
 mov ah,9
 lea dx,msg2
 int 21h
 mov dl,num2
 add dl,48
 mov ah,2
 int 21h
 jmp endd
 
 n3: 
 mov ah,9
 lea dx,msg2
 int 21h
 mov dl,num3
 add dl,48
 mov ah,2
 int 21h
 jmp endd
 
 endd:

ret




