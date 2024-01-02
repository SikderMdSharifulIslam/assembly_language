.model small
.stack 100h
.code
main proc
    mov ah,1    ;read a character from user
    int 21h     ;trigger the 21h interrupt 
    
    mov bl,al   ;save input character into bl
    
    mov ah,2    ;set the ah register to match with the 02 function code (write to STDOUT)
    mov dl,0dh
    ;int 21h
    ;mov dl,0ah  ; line 10 to 13 is used for printing newline
    
    
    mov ah,2    ;for print
    mov dl,bl
    int 21h
    
    
    mov ah,4ch  ;return control to DOS     
    int 21h
    
    main endp
end main
    
    
    
    
    