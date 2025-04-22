.model small
.stack 100h
.data
    input_msg db "Enter characters: $"
    output_msg db "Reversed characters: $"
.code

main proc
    mov ax, @data
    mov ds, ax

    lea dx, input_msg      
    mov ah, 9             
    int 21h

    xor cx, cx            

capture_input:
    mov ah, 1             
    int 21h
    cmp al, 0Dh           
    je finish_input       
    push ax               
    inc cx                
    jmp capture_input     

finish_input:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    lea dx, output_msg    
    mov ah, 9             
    int 21h

    mov cx, cx            

display_reversed:
    pop ax                
    mov dl, al           
    mov ah, 2           
    int 21h             
    loop display_reversed

    exit:
    mov ah,4ch
    int 21h
    main endp
end main
