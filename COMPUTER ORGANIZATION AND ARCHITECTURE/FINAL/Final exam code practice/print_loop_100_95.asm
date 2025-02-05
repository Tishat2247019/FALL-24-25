.model small
.stack 100h

.code
main proc
    
    mov ax, 100
    mov bx, 0
    mov cx, 19
    
sum_loop:
    add bx, ax
    sub ax, 5
    loop sum_loop
    
    mov dx, bx
    
    mov ah, 4ch
    int 21h
    main endp
