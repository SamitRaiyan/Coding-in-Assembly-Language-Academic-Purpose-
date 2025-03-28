.MODEL SMALL    
.STACK 100H
.CODE

MAIN PROC  
    ;First Digit   
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    
    ;Second Digit
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,2
    MOV DL,0AH
    INT 21H 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    
    sub BL,BH
    
    MOV AH,2
    MOV DL,BL
    SUB DL,48
    INT 21H  
    
    MOV AH,4CH
    INT 21H
    
    
MAIN ENDP
END MAIN