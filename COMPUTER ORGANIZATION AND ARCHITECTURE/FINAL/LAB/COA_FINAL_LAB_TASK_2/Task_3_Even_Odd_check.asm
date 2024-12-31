.model small
.stack 100
.data
    msg_input db 'Please enter a number to check even/odd: $'
    msg_odd db ' is an odd number.$'
    msg_even db ' is an even number.$'
    msg_error db ' is not a number.$'

    input db ?

.code
main proc
    mov ax, @data
    mov ds, ax 

    mov ah, 9
    lea dx, msg_input
    int 21h

    mov ah, 1
    int 21h
    mov input, al

    mov ah, 2
    mov dl, 10
    int 21h

    mov dl, 13
    int 21h

    mov al, input
    cmp al, '0'
    jl not_number
    cmp al, '9'
    jg not_number

    sub al, '0'

    mov bl, al
    test al, 1
    jz even_number

odd_number:
    add bl, '0'
    mov dl, bl
    mov ah, 2
    int 21h

    lea dx, msg_odd
    mov ah, 9
    int 21h
    jmp exit

even_number:
    add bl, '0'
    mov dl, bl
    mov ah, 2
    int 21h

    lea dx, msg_even
    mov ah, 9
    int 21h
    jmp exit

not_number:
    mov dl, input
    mov ah, 2
    int 21h

    lea dx, msg_error
    mov ah, 9
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp
end main
