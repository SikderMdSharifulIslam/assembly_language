.model small
.stack 100h
.code
main proc
    
    ;value insert
    mov ax,5
    mov bx,ax    
    
    ;addition
    add bx,bx ;addition same value from same register like bx=bx+bx
    
    ;subtraction
    sub bx,ax ; bx=bx-ax
    
    ;also ax has 2 part, ah=8 bit & al=8 bit total 16 bit. so we can do operation between these
    mov al,2
    mov ah,4
    add al,ah
    
    ;multiplication
    mul ah  ;al=al*ah note that multiplication always occurs in al or ax register
    ; but here problem is ah will be 0 after operation. because ah is also a part of accumulator
    ; after multiplication the value of dx will be deleted automatically
    
    
    ;division
    div bx  ;ax=ax/bx(result) & dx=ax%bx (reminder)
    ; same things for 8 bit that is al=al/bl(result) & ah=al%bl(reminder) when we do division operation
    ; in division or multiplication we cannot use direct value to do the operation
    ; we have to insert the value into a register then try to do div or mul
    
    main endp
end main