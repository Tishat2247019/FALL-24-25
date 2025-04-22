.model small
.stack
.data

.code
main proc
    mov ax, @data      
    mov ds, ax

   
    mov dl, 'B'        

    cmp dl, 'A'        
    jl skip_display     
    cmp dl, 'Z'        
    jg skip_display     

    
    mov ah, 2           
    int 21h

skip_display:

exit:
    mov ah, 4ch       
    int 21h
    main endp

end main
