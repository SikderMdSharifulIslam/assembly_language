
org 100h

.MODEL SMALL
.STACK 100H

INPUT MACRO ARRIN, ARRSIZE
	LEA SI, ARR
	MOV CL, SIZE
	XOR CH, CH 
	
	INPUTLOOP:
	    MOV AH, 1
		INT 21H
		SUB AL, 30H
		MOV [SI], AL
		
		INC SI
		
		MOV AH, 2
		MOV DL, " "
		INT 21H	
	LOOP INPUTLOOP
ENDM
    .DATA
     SIZE DB ?
     SIZEMSG DB "ENTER THE SIZE OF ARRAY(Upto 9): $"
     ARR DB 9 DUP(?) 
     ARRMSG DB 10,13,"ENTER THE ARRAY ELEMENTS: $" 
     EVENSUM DB ?
     ODDSUM DB ?
     PROMPT_2 DB 0Dh, 0Ah, 'ODD Digits: ', '$'
     PROMPT_3 DB 0Dh, 0Ah, 'EVEN Digits: ', '$'
     PROMPT_4 DB 0Dh, 0Ah, 'ODD SUM: ', '$'     
     PROMPT_5 DB 0Dh, 0Ah, 'EVEN SUM: ', '$'
.CODE
	MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	
	LEA DX, SIZEMSG
	MOV AH, 9
	INT 21H	
	
	MOV AH, 1
	INT 21H
	SUB AL, 30H
	MOV SIZE, AL
		
	LEA DX, ARRMSG
	MOV AH, 9
	INT 21H
	
	INPUT ARR, SIZE
	
	CALL Odd_Numbers
	CALL Even_Numbers
	
	MOV AH, 9
	LEA DX, PROMPT_4
	INT 21H  
	XOR DX, DX
	XOR AX, AX
	MOV AL, EVENSUM   
	MOV BL, 10
	DIV BL
	MOV CL, AH
	MOV DL, AL
	ADD DL, 48 
	MOV AH, 2
	INT 21H   
	MOV DL, CL
	ADD DL, 48 
	MOV AH, 2
	INT 21H 
		
	MOV AH, 9
	LEA DX, PROMPT_5
	INT 21H  
	XOR DX, DX
	XOR AX, AX
	MOV AL, ODDSUM   
	MOV BL, 10
	DIV BL
	MOV CL, AH
	MOV DL, AL
	ADD DL, 48 
	MOV AH, 2
	INT 21H   
	MOV DL, CL
	ADD DL, 48 
	MOV AH, 2
	INT 21H 
	
	MOV AH, 4CH
	INT 21H
 	MAIN ENDP  
 	
 	Odd_Numbers PROC
	
	MOV AH, 9
	LEA DX, PROMPT_2
	INT 21H
	
	MOV CL, SIZE
	MOV CH, 0
	LEA SI, ARR
	XOR BH,BH
	
	Loop_1:
		XOR AX, AX
		MOV AL, [SI]
		SUB AL, 48
		
		MOV BL, 2					 
		DIV BL
		
		CMP AH, 1
		JE Print1
		JL noPrint1
		
		Print1:
			MOV AH, 2
			MOV DX, [SI] 
			ADD DL , 30H
			INT 21h
			
			MOV DX, ' '
			INT 21h
		    add bh, [SI]
		noPrint1:
			INC SI
		
		LOOP Loop_1  
	
	mov ODDSUM,bh 
	RET
	Odd_Numbers ENDP	
		
	Even_Numbers PROC
	
	MOV AH, 9
	LEA DX, PROMPT_3
	INT 21H
	
	MOV CL, SIZE
	MOV CH, 0
	LEA SI, ARR
	XOR BH,BH	
	Loop_2:
		XOR AX, AX
		MOV AL, [SI]
		SUB AL, 48
		
		MOV BL, 2					 
		DIV BL
		
		CMP AH, 0
		JE Print2
		JG noPrint2
		
		
		Print2:
			MOV AH, 2
			MOV DX, [SI] 
			ADD DL , 30H
			INT 21h
			
			MOV DX, ' '
			INT 21h
		    add bh, [SI]
		noPrint2:
			INC SI
			LOOP Loop_2

	mov EVENSUM,bh  
	RET
	Even_Numbers ENDP

END MAIN

ret




