.MODEL SAMLL
.STACK 100H
.DATA  

      STR1 DB "HI BRO$" 
      STR2 DB "WHAT'S UP$"
      
.CODE
MAIN PROC   
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,STR1
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H 
    
    MOV AH,9
    LEA DX,STR2
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN