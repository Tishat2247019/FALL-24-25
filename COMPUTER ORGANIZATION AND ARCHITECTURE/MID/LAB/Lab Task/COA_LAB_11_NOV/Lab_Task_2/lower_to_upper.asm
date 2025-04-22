.model small
.stack 100h
.data

x db 'Lower case letter: $'
y db 'Upper case letter: $'

.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, x
    int 21h

    mov ah, 1
    int 21h
    mov bl, al

    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    sub bl, 32

    mov ah, 9
    lea dx, y
    int 21h

    mov dl, bl
    mov ah, 2
    int 21h

    mov ah, 4Ch
    int 21h

main endp
end main
