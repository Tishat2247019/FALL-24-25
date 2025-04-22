.model small
.stack 100

.data

.code
main proc  
    
    mov ah, 2
    mov cx, 49
    
    mov dx, 1
    ;sub dx, '0'
    
    mov bx, 4
    ;sub bx, '0'
    
    print_loop:
    add dx, bx
    add dx, '0'
    int 21h
    dec cx
    jnz print_loop 
    
    ;mov ah, 2
    ;sub dx, '0'
    ;int 21h
    
    mov ah, 4ch
    int 21h
    main endp
end main