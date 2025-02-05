.model small
.stack 100h
.data
.code

main proc
    mov ax, 5
    mov bx, 6

    push ax
    push bx

    pop ax
    pop bx

    exit:
    mov ah,4ch
    int 21h
    main endp
end main
