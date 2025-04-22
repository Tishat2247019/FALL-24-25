.model small
.stack 100h 
.data 
my_name db 'md. abu Towsif$'  
my_id db '22-47019-1$'
my_dept db 'cse$'
.code

main proc
    mov ax, @data
    mov ds,ax 
    
    mov ah, 9
    lea dx, my_name
    int 21h       
    
    mov ah, 2
    mov dl, 10
    int 21h
    
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, my_id
    int 21h
    
    mov ah, 2
    mov dl, 10
    int 21h
    
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, my_dept
    int 21h
    
    mov ah, 4ch
    int 21h
    
    main endp

end main