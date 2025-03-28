.model small
.stack 100h
.data
    msg1 db 'Input: $'
    msg2 db 0Dh, 0Ah, 'Output: $'  ; 0Dh is carriage return, 0Ah is line feed for new line
    inputChar db ?                 ; Variable to store input character

.code
main:
    ; Initialize DS register
    mov ax, @data
    mov ds, ax

    ; Display "Input: "
    mov ah, 09h      ; Function 09h: Display string
    lea dx, msg1     ; Load address of msg1 into DX
    int 21h          ; Call interrupt 21H

    ; Read a character from the keyboard
    mov ah, 01h      ; Function 01h: Read character from standard input
    int 21h          ; Call interrupt 21H
    mov inputChar, al ; Store the input character in inputChar

    ; Display a new line and "Output: "
    mov ah, 09h      ; Function 09h: Display string
    lea dx, msg2     ; Load address of msg2 into DX
    int 21h          ; Call interrupt 21H

    ; Display the input character
    mov ah, 02h      ; Function 02h: Display character
    mov dl, inputChar ; Load the input character into DL for output
    int 21h          ; Call interrupt 21H

    ; Exit the program
    mov ah, 4Ch      ; Function 4Ch: Terminate program
    int 21h          ; Call interrupt 21H


end main
