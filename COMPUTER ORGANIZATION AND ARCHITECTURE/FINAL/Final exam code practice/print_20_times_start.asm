.model small
.stack 100h

.data
count db 0          ; Variable to store character count

.code
main proc
    mov ax, @data
    mov ds, ax       ; Initialize data segment

    mov cx, 20
    mov ah, 2
    mov dl, '*'
    
print_:
    int 21h
    ;loop print_
    dec cx
    jz exit_
    jmp print_
    
    exit_:
    mov ah, 4Ch      ; Terminate program
    int 21h

main endp
end main
