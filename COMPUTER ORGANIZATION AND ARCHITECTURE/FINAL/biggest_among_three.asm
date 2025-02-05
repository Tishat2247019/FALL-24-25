.model small
.stack 100h
 .data
.code
main proc   
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    mov bh, al
    
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 1
    int 21h
    mov cl, al 
    
    
    mov ah, 2
    mov dl, 10
    int 21h
    
    mov dl, 13
    int 21h
    
    cmp bh, bl
    jge a_greater
    jmp b_greater
    
    a_greater:
      cmp bh, cl
      jge a_greatest
      jmp c_greatest
    
    b_greater:
    
    cmp bl, cl
    jge b_greatest
    jmp c_greatest
    
    
    a_greatest:
    
    mov ah, 2
    mov dl, bh
    int 21h
    jmp exit_
    
    
    b_greatest:
    
    mov ah, 2
    mov dl, bl
    int 21h
    jmp exit_
    
    
    c_greatest:
    
    mov ah, 2
    mov dl, cl
    int 21h
    jmp exit_
    
    exit_:
    
    mov ah, 4ch
    int 21h
    
    main endp
end main
    
    
    
    
    




