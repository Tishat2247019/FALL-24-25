.model small
.stack
.data

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, 4

    cmp al, 0
    jnbe else_

    mov ah, 0FFh
    jmp exit

else_:
    mov ah, 0

exit:
    mov ah, 4ch
    int 21h

main endp
end main
