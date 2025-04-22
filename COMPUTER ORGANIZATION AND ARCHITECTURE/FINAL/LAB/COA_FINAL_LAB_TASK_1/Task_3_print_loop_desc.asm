.model small
.stack 100h

.code
main proc
    mov cx, 19
    mov dx, 100
    mov ax, 0         
    mov bx, 5

sum_loop:
    add ax, dx          
    sub dx, bx          
    loop sum_loop 

    mov ah, 4ch
    int 21h
main endp
end main
