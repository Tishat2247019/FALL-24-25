.model small
.stack 100h 

.data
input db "Pleae enter a number to check :  $"
even db " it is a even number$"
odd db "it is a odd number $"
error db "not a number $" 
newline db 10, 13, "$"


.code
main proc 
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, input
    int 21h 
    
    mov ah, 1
    int 21h
    
    cmp al, '0'
    jl error_ 
    cmp al, '9'
    jg error_ 

    and al, 0FH
    mov bl, al 
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    test bl, 1
    jz even_ 
  
    
    odd_:   
 mov ah, 9
    lea dx, odd
    int 21h
    jmp exit_ 
    
    even_:   
    mov ah, 9
    lea dx, even
    int 21h 
    jmp exit_
    
     error_:   
    mov ah, 9
    lea dx, error
    int 21h 

    exit_:
    mov ah, 4ch
    int 21h
    main endp
