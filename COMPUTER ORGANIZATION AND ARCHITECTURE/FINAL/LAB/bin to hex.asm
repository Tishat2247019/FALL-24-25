.model small
.stack 100h

.data
    prompt db 'Enter an 8 bits binary number: $'
    error_msg db 'Invalid input!', 0Dh, 0Ah, '$'
    newline db 0Dh, 0Ah, '$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, prompt
    int 21h

get_binary_input:
    xor bx, bx
    mov cx, 8

read_loop:
    mov ah, 01h
    int 21h

    cmp al, '0'
    je valid_input
    cmp al, '1'
    je valid_input

    mov dx, offset error_msg
    mov ah, 09h
    int 21h
    jmp get_binary_input

valid_input:
    sub al, '0'
    shl bx, 1
    or bx, ax
    loop read_loop

    mov ah, 09h
    lea dx, newline
    int 21h

    mov al, bl
    shr al, 4
    call display_hex_digit

    mov al, bl
    and al, 0Fh
    call display_hex_digit

exit:
    mov ah, 4Ch
    int 21h

display_hex_digit:
    cmp al, 9
    jbe display_digit_number
    add al, 'A' - 10
    jmp output_char

display_digit_number:
    add al, '0'

output_char:
    mov dl, al
    mov ah, 02h
    int 21h
    ret
