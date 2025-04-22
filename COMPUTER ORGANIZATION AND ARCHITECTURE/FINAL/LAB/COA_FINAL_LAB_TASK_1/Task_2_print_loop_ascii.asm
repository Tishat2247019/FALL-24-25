.model small
.stack 100h

.code
main proc
    mov cx, 50
    mov ax, 1
    mov dx, 0         
    mov bx, 4

sum_loop:
    add dx, ax          
    add ax, bx          
    loop sum_loop 

    mov ah, 4ch
    int 21h
main endp
end main
