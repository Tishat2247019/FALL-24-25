.model
.stack 100h

.data
a db 'Please enter a character to check : $'
b db ' is a vowel$' 
c db ' is not a vowel$' 

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
    
    mov ah,2
    mov dl, 10
    int 21h 
        
    mov dl, 13
    int 21h   
    
    cmp bl, 'a'
    je is_vowel
    cmp bl, 'e'
    je is_vowel
    cmp bl, 'i'
    je is_vowel
    cmp bl, 'o'
    je is_vowel
    cmp bl, 'u'
    je is_vowel
    
    not_vowel:
        mov ah, 2
        mov dl, bl
        int 21h 
        
        mov ah, 9
        lea dx, c
        int 21h
        
        jmp exit
        
    
    is_vowel:
        mov ah, 2
        mov dl, bl
        int 21h  
        mov ah, 9
        lea dx, b
        int 21h
        
   exit: 
    mov ah, 4ch
    int 21h
    
    main endp

end 


                                    
