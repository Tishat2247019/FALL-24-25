.model small
.stack 100h

.data

.code
main proc
    mov ax, @data       
    mov ds, ax

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
