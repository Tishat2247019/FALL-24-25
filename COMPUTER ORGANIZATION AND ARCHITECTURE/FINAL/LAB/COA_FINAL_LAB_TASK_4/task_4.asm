.model small
.stack 100h
.data
    input_msg db 'Enter characters: $'
    output_msg db 'Reversed characters: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, input_msg
    mov ah, 09h
    int 21h 

    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h

    mov dl, '?'
    int 21h

    xor cx, cx 

    
input_loop:
    mov ah, 1       
    int 21h
    cmp al, 0Dh     
    je process_loop 

    push ax         
    inc cx          
    jmp input_loop  

process_loop:
    
    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h

    lea dx, output_msg
    mov ah, 09h
    int 21h 
    
    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
display_loop:
    pop ax          
    mov dl, al       
    mov ah, 2       
    int 21h
    loop display_loop 

    exit:
    mov ah,4ch
    int 21h
    main endp
end main
