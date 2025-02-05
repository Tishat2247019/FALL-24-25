.model small
.stack 100h

.data
    input db 'Enter a 2-digit hexadecimal number: $'
    error_msg db 'Invalid input!', 0Dh, 0Ah, '$'
    newline db 0Dh, 0Ah, '$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, input
    int 21h

get_hex_input:
    xor bx, bx
    mov cx, 2

read_loop:
    mov ah, 01h
    int 21h
    mov ah, 0
    cmp al, '0'
    jl invalid_input
    cmp al, '9'
    jg check_upper_case

    sub al, '0'
    jmp store_digit

check_upper_case:
    cmp al, 'A'
    jl invalid_input
    cmp al, 'F'
    jg invalid_input

    sub al, 'A' - 10

store_digit:
    shl bx, 4
    or bx, ax
    loop read_loop

    mov ah, 09h
    lea dx, newline
    int 21h

    mov al, bl
    shr al, 4
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

    mov al, bl
    and al, 0Fh
    cmp al, 9
    jbe display_digit_number_lower
    add al, 'A' - 10
    jmp output_char_lower

display_digit_number_lower:
    add al, '0'

output_char_lower:
    mov dl, al
    mov ah, 02h
    int 21h

exit:
    mov ah, 4Ch
    int 21h

invalid_input:
    mov dx, offset error_msg
    mov ah, 09h
    int 21h
    jmp get_hex_input
