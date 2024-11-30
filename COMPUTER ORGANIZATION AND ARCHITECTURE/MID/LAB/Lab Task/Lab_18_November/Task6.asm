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
    jge check_bx_cx

    mov ax, 0
    jmp exit_program

check_bx_cx:
    cmp bx, cx
    jge set_cx_zero

    mov bx, 0
    jmp exit_program

set_cx_zero:
    mov cx, 0

exit_program:
    mov ah, 4ch
    int 21h

main endp
end main
