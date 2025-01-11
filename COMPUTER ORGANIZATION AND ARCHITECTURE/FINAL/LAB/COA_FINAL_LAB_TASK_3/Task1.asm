.model small
.stack 100h
.data
    prompt_msg db 'Please input an 8-bit binary number: $'
    result_msg db 'You entered the binary: $'
    error_msg db 'Invalid input! Please enter only 0 or 1.', 0Dh, 0Ah, '$'
    new_line db 10, 13, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

get_input:

    mov ah, 9
    lea dx, prompt_msg
    int 21h

    mov cx, 8
    mov si, 0
    mov bl, 0

read_binary:
    mov ah, 1
    int 21h

    cmp al, '0'
    je process_zero

    cmp al, '1'
    je process_one

    jmp invalid_input

process_zero:
    shl bl, 1
    jmp next_bit

process_one:
    shl bl, 1
    or bl, 1

next_bit:
    inc si
    cmp si, 8
    jne read_binary

    mov ah, 9
    lea dx, new_line
    int 21h

    mov ah, 9
    lea dx, result_msg
    int 21h

    mov cx, 8
    mov si, 7

display_binary:
    mov dl, bl
    and dl, 10000000b
    cmp dl, 0
    je print_0
    mov dl, '1'
    jmp print_char

print_0:
    mov dl, '0'

print_char:
    mov ah, 2
    int 21h
    shl bl, 1
    loop display_binary

    mov ah, 4Ch
    int 21h

invalid_input:
    mov ah, 9
    lea dx, new_line
    int 21h
    mov ah, 9
    lea dx, error_msg
    int 21h

    jmp get_input

main endp
end main
