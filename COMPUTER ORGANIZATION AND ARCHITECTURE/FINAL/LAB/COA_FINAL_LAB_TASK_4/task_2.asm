.model small
.stack 100h
.data
.code

main proc
    mov ax, 1234h
    mov bx, 5678h
    mov cx, 9ABCh
    mov sp, 100h

    push ax
    push bx
    xchg ax, cx
    pop cx
    push ax
    pop bx

    exit:
    mov ah,4ch
    int 21h
    main endp
end main