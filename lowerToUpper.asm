.model small
.stack 100h
.data
a db 'Input (LowerCase) : $'
b db 10,13,'Result (UpperCase) : $'
invalid db 10,13,'Result : Invalid input $'

.code 
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9  ; first message
    lea dx,a
    int 21h
    
    mov ah,1  ; input
    int 21h
    mov bl,al
    
    ; Check if input is in range a-z
    cmp bl,'a'
    jl invalid_input
    cmp bl,'z'
    jg invalid_input 
    
    mov ah,9  ;second message
    lea dx,b
    int 21h
    
    mov ah,2  ;output
    sub bl,32
    mov dl,bl
    int 21h 
    
    jmp exit
    
invalid_input:
    mov ah,9  ; invalid message
    lea dx,invalid
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
