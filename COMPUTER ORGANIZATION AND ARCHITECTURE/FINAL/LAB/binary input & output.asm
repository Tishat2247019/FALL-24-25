.model small
.stack 100h
.data
    input db 'Enter a 8 bits binary number: $'
    output db 'Binary output: $'
    newline db 10, 13, '$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, input
    int 21h

    mov cx, 8
    mov si, 0
    mov bl, 0

input_loop:
    mov ah, 1
    int 21h
    cmp al, '0'
    je zero_bit
    cmp al, '1'
    je one_bit
    jmp invalid_input

zero_bit:
    shl bl, 1
    jmp next_bit

one_bit:
    shl bl, 1
    or bl, 1

next_bit:
    inc si
    cmp si, 8
    jne input_loop

    mov ah, 9
    lea dx, newline
    int 21h

    mov ah, 9
    lea dx, output
    int 21h

    mov cx, 8
    mov si, 7

output_loop:
    mov dl, bl
    and dl, 10000000b
    cmp dl, 0
    je print_zero
    mov dl, '1'
    jmp print_char

print_zero:
    mov dl, '0'

print_char:
    mov ah, 2
    int 21h
    shl bl, 1
    loop output_loop

    mov ah, 4Ch
    int 21h

invalid_input:
    mov ah, 9
    lea dx, newline
    int 21h
    mov ah, 9
    lea dx, newline
    int 21h

main endp
end main
