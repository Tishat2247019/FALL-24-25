.model small
.stack
.data

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 5
    mov bx, 3
    mov cx, 8

    cmp ax, bx
    jge skip_or

    mov dx, 0
    jmp exit_program

skip_or:
    cmp bx, cx
    jge set_one

    mov dx, 0
    jmp exit_program

set_one:
    mov dx, 1

exit_program:
    mov ah, 4ch
    int 21h

main endp
end main
