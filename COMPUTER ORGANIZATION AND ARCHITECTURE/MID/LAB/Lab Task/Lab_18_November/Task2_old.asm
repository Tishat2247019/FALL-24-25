.model small
.stack
.data

.code
main proc
    mov ax, @data       ;
    mov ds, ax

   
    mov al, 4           
    mov bl, 2           


    mov ah, 2           
    cmp al, bl          
    jnbe else_         
    mov dl, al          
    jmp display        

else_:
    mov dl, bl          

display:
    int 21h            

exit:
    mov ah, 4ch         
    int 21h

main endp
end main
