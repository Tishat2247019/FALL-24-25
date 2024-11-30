.model small
.stack
.data

.code
main proc
    mov ax, @data       
    mov ds, ax

    mov ax, -10         
    cmp ax, 0
    jnl END_IF
    mov bx, -1  

END_IF:

    

exit:
    mov ah, 4ch         
    int 21h

main endp
end main
