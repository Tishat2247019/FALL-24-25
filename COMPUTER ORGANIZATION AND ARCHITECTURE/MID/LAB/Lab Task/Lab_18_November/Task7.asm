.model small
.stack
.data

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, 4

    cmp al, 1
    je display_o
    cmp al, 3
    je display_o
    cmp al, 2
    je display_e
    cmp al, 4
    je display_e

    jmp exit_program

display_o:
    mov dl, 'o'
    jmp display_char

display_e:
    mov dl, 'e'

display_char:
    mov ah, 2
    int 21h

exit_program:
    mov ah, 4ch
    int 21h

main endp
end main
