.model small
.stack 100h

; in data segment declare some variable with value and without value using ? sign. dw means data word
.data
A dw 11
B dw 4
sum dw ?
difference dw ?
multiplication dw ?
division dw ?  
reminder dw ?

.code
main proc    
    ;mov data to accumulator then mov it to data segement register
    mov ax,@data
    mov ds,ax
    
    ;addition
    mov ax,A
    add ax,B
    mov sum,ax
    
    ;subtraction
    mov ax,A
    sub ax,B
    mov difference,ax
    
    ;multiplication
    mov ax,A
    mul B
    mov multiplication,ax
    
    ;division
    mov ax,A
    div B
    mov division,ax
    mov reminder,dx
    
    main endp
end main
    
   