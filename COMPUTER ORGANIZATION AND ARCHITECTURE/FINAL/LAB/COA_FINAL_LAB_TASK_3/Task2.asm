.model small
.stack 100h

.data
    prompt_msg db 'Please enter a 2-digit hexadecimal number: $'
    result_msg db 'You entered the hexadecimal: $'
    error_msg db 'Your input is invalid.Please enter numbers between(1-9), char between(A-F)', 0Dh, 0Ah, '$'
    newline db 0Dh, 0Ah, '$'

.code
main:
    mov ax, @data
    mov ds, ax
 
 get_input_label:
    mov ah, 09h
    lea dx, prompt_msg
    int 21h

get_hex_input:
    xor bx, bx
    mov cx, 2

read_hex_input:
    mov ah, 01h
    int 21h
    mov ah, 0
    cmp al, '0'
    jl invalid_input_label
    cmp al, '9'
    jg check_hex_upper_case

    sub al, '0'
    jmp store_hex_digit

check_hex_upper_case:
    cmp al, 'A'
    jl invalid_input_label
    cmp al, 'F'
    jg invalid_input_label

    sub al, 'A' - 10

store_hex_digit:
    shl bx, 4
    or bx, ax
    loop read_hex_input

    mov ah, 09h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, result_msg
    int 21h

    mov al, bl
    shr al, 4
    cmp al, 9
    jbe display_hex_digit_number
    add al, 'A' - 10
    jmp output_hex_char

display_hex_digit_number:
    add al, '0'

output_hex_char:
    mov dl, al
    mov ah, 02h
    int 21h

    mov al, bl
    and al, 0Fh
    cmp al, 9
    jbe display_hex_digit_number_lower
    add al, 'A' - 10
    jmp output_hex_char_lower

display_hex_digit_number_lower:
    add al, '0'

output_hex_char_lower:
    mov dl, al
    mov ah, 02h
    int 21h

exit_program:
    mov ah, 4Ch
    int 21h

invalid_input_label:
    mov ah, 09h
    lea dx, newline
    int 21h
    lea dx, error_msg
    int 21h
    jmp get_input_label
