.MODEL SMALL
.STACK 100H
.DATA
    
    M1 DB "Enter 1st number : $"
    M2 DB "Enter 2nd number : $"
    M3 DB "Result : $"
    
.CODE
MAIN PROC  
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;SHOWING 1ST MESSAGE
    MOV AH,9
    LEA DX,M1
    INT 21H
    
    ;TAKING 1ST INPUT
    MOV AH,1
    INT 21H
    SUB AL, '0'
    MOV BL,AL
        
    
    ;FIXING THE POSITION OF THE MESSAGE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H 
    
    ;SHOWING 2ND MESSAGE
    MOV AH,9
    LEA DX,M2
    INT 21H
    
    ;TAKING 2ND INPUT
    MOV AH,1
    INT 21H
    SUB AL, '0' 
    MOV BH,AL
    
    ;FIXING THE POSITION OF THE MESSAGE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H 
    
    ;SHOWING 3RD MESSAGE
    MOV AH,9
    LEA DX,M3
    INT 21H  
    
    ;ADDING
    ADD BL,BH
    ADD BL, '0'
    
    ; DISPLAY RESULT
    MOV AH,2
    MOV DL, BL
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN