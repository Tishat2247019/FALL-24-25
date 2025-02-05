.model small
.stack 100h
.data
a db "Pleae enter the first number: $"
b db "Pleae enter the second number : $"
c db "Please enter the thrird umber : $"
d db "The biggest number is : $"

.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 2
    mov dl, 10
    int 21h
    
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, b
    int 21h
    
    mov ah, 1
    int 21h
    mov bh, al
    
    mov ah, 2
    mov dl, 10
    int 21h
    
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, c
    int 21h
    
    mov ah, 1
    int 21h
    mov cl, al
    
    mov ah, 2
    mov dl, 10
    int 21h
    
    mov dl, 13
    int 21h 
    
    mov ah, 9
    lea dx, d
    int 21h
    
    
    comp_a_and_b:
        cmp bl, bh
        jge a_is_greater
        jmp b_is_greater
        
    a_is_greater:
        cmp bl, cl
        jge a_is_greatest
        jmp c_is_greatest
    
    b_is_greater:
        cmp bh, cl
        jge b_is_greatest
        jmp c_is_greatest    
        
    a_is_greatest:
        mov ah, 2
        mov dl, bl
        int 21h
        jmp exit_
    
    b_is_greatest:
        mov ah, 2
        mov dl, bh
        int 21h
        jmp exit_
 
    c_is_greatest:
        mov ah, 2
        mov dl, cl
        int 21h
        jmp exit_
     
     exit_:
        mov ah, 4ch
        int 21h
        
     main endp

end main
        
     