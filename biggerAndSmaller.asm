.model small
.stack 100h
.data
msg1 db 'Enter first digit (0-9): $'
msg2 db 10,13,'Enter second digit (0-9): $'
bigger db 10,13,'Bigger: $'
smaller db 10,13,'Smaller: $'
equal_msg db 10,13,'Digits are Equal$'
invalid db 10,13,'Invalid input!$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; First input
    mov ah, 9
    lea dx, msg1
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'       ; Convert ASCII to digit
    cmp al, 9
    ja invalid_input
    cmp al, 0
    jb invalid_input
    mov bl, al        ; Store first digit in BL

    ; Second input
    mov ah, 9
    lea dx, msg2
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'       ; Convert ASCII to digit
    cmp al, 9
    ja invalid_input
    cmp al, 0
    jb invalid_input
    mov bh, al        ; Store second digit in BH

    ; Compare digits
    cmp bl, bh
    je display_equal   ; If equal, jump to equal message
    jg first_bigger
    jl second_bigger

first_bigger:
    mov ah, 9
    lea dx, bigger
    int 21h
    mov dl, bl
    add dl, '0'
    mov ah, 2
    int 21h

    mov ah, 9
    lea dx, smaller
    int 21h
    mov dl, bh
    add dl, '0'
    mov ah, 2
    int 21h
    jmp exit

second_bigger:
    mov ah, 9
    lea dx, bigger
    int 21h
    mov dl, bh
    add dl, '0'
    mov ah, 2
    int 21h

    mov ah, 9
    lea dx, smaller
    int 21h
    mov dl, bl
    add dl, '0'
    mov ah, 2
    int 21h
    jmp exit

display_equal:
    mov ah, 9
    lea dx, equal_msg
    int 21h
    jmp exit

invalid_input:
    mov ah, 9
    lea dx, invalid
    int 21h

exit:
    mov ah, 4Ch
    int 21h

main endp
end main
