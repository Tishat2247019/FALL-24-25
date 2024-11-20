.model small
.stack
.data

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 5        ; Example value for AX
    mov bx, 3        ; Example value for BX
    mov cx, 8        ; Example value for CX

    cmp ax, bx       ; Compare AX with BX
    jge check_bx_cx  ; Jump if AX >= BX

    mov ax, 0        ; Set AX to 0 if AX < BX
    jmp exit_program ; Exit

check_bx_cx:
    cmp bx, cx       ; Compare BX with CX
    jge set_cx_zero  ; Jump if BX >= CX

    mov bx, 0        ; Set BX to 0 if BX < CX
    jmp exit_program ; Exit

set_cx_zero:
    mov cx, 0        ; Set CX to 0 if BX >= CX

exit_program:
    mov ah, 4ch      ; Terminate program
    int 21h

main endp
end main
