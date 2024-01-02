.model small
.stack 100h 
print  macro p1
  mov ah,9
  lea dx,p1
  int 21h
endm

selection_sort macro start, finish, array
  mov min,100
  
  xor cx,cx 
  mov ax,finish
  sub ax,start
  add ax,1
  mov cx,ax
  mov si,start
  
  minimum:
      mov al,min
      mov dl, array[si] 
      cmp al,dl
      ja l1
         jmp end
      
      l1:   
        mov min,dl
        mov index,si
        jmp end
        end: inc si
        loop minimum
  mov ah,2
  mov dl,min 
  add dl,48
  int 21h 
  mov bx,index
  mov al,min
  endm

.data
array db 4,2,3,7,6,1,"$"
length dw 6 
msg1 db "Array before sorting : $" 
min db ? 
control db ? 
i db ? 
last dw ?  
first dw ?
index dw ? 
temp db ?
.code
main proc
  mov ax,@data
  mov ds,ax 
  
  print msg1
  
  mov cx,0
  mov cl,6 
  mov si, offset array
  
  output:
    mov ah,2
    mov dl,array[si]  
    add dl,48
    int 21h
    inc si
    loop output 
    
  xor cx,cx
  mov cl,6
  mov si,offset array
  mov ax,length
  sub ax,1
  mov last, ax
 
  sort:
     mov control,cl 
     mov first,si 
     selection_sort  si,last,array
     mov si,first 
     mov dl,array[si]
     mov array[si],al
     mov array[bx],dl
     mov cl,control
     
     inc si
     loop sort
  
  
  mov ah,4ch
  int 21h
  main endp
end main    
