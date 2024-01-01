org 100h

.data
msg1 db 10,13,"Enter Character: $"
msg2 db 10,13,"Vowel $"
msg3 db 10,13,"Consonant $"

.code
    mov ax,@data
    mov ds,ax
    
    start:
    mov ah,9
    lea dx,msg1
    int 21h 
    
    mov ah,1
    int 21h
    mov ah,0
    
    check:
    cmp al,'N'
    je endd
    
    cmp al,'a'
    je vowel
    
    cmp al,'e'
    je vowel  
    
    cmp al,'i'
    je vowel  
    
    cmp al,'o'
    je vowel
    
    cmp al,'u'
    je vowel
    
    
    mov ah,9
    lea dx,msg3
    int 21h
    loop start
    
    
    vowel:
    mov ah,9
    lea dx,msg2
    int 21h
    loop start
    
    
    endd:

ret




