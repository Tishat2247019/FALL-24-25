

.model small
.stack 100h
.data
input db "Please enter a number : $"
output db 10, 13," the number is :$ "

.code

main proc

mov ax, @data
mov ds, ax

mov cx, 256
mov dl, 0
mov ah, 2
print_:
    int 21h
    inc dl
    dec cx
    jnz print_
    
mov ah, 4ch
int 21h

main endp
end main

