.model small
.stack
.data

.code
main proc
    mov ax, @data      
    mov ds, ax

    
    mov ax, 5        
    mov bx, 3          
    mov cx, 8         

   
    cmp ax, bx
    jge skip_if_1       

    
    cmp bx, cx
    jge skip_if_2       

   
    mov ax, 0
    jmp exit_program   

skip_if_2:
    
    mov bx, 0
    jmp exit_program    

skip_if_1:
    
    jmp exit_program

exit_program:
    
    mov ah, 4ch         
    int 21h

main endp
end main
