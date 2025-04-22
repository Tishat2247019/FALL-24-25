.model small
.stack 100h

.data
    prompt_msg db 'Please input an 8-bit binary number: $'
    result_msg db 'The corresponding hexadecimal value is: $'
    error_msg db 'Invalid input! Please enter only binary digits (0 or 1).', 0Dh, 0Ah, '$'
    newline db 0Dh, 0Ah, '$'

.code
main:
    mov ax, @data
    mov ds, ax

get_input_label:
    mov ah, 09h
    lea dx, prompt_msg
    int 21h

get_binary_input_label:
    xor bx, bx
    mov cx, 8

read_binary_loop:
    mov ah, 01h
    int 21h

    cmp al, '0'
    je valid_binary_input
    cmp al, '1'
    je valid_binary_input

    lea dx, newline
    mov ah, 09h
    int 21h
    lea dx, error_msg
    mov ah, 09h
    int 21h

    jmp get_input_label

valid_binary_input:
    sub al, '0'
    shl bx, 1
    or bx, ax
    loop read_binary_loop

    mov ah, 09h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, result_msg
    int 21h

    mov al, bl
    shr al, 4
    call display_hex_digit

    mov al, bl
    and al, 0Fh
    call display_hex_digit

exit_program:
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
