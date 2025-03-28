.model small
.stack 100h

.data
    msg1 db 'Enter a character: $'
    msg2 db 0Dh, 0Ah, 'You entered: $'
    userInput db ?  ; Reserve a byte for user input

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Display the first message
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Read a character from the user
    mov ah, 01h
    int 21h
    mov userInput, al  ; Store the input character

    ; Move to the next line
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Display the user input character
    mov dl, userInput
    mov ah, 02h
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

end main
