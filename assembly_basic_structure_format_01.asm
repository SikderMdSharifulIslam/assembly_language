.MODEL SMALL
.STACK 100H

.DATA
;All Data (Variable, String, Array, Etc Declaration & Initialization) Goes Here

.CODE   
MAIN PROC

    ;All Code Goes Here
                       
                           
    MOV AH, 4CH ; return control to DOS
    INT 21H
    
    MAIN ENDP
END MAIN   
