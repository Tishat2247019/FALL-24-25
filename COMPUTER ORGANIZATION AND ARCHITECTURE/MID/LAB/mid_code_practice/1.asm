.model small
.stack 100h
.data
x db 'Enter two alphabets: $'
y db 'The corrct order : $'
.code
main proc  
    mov ax, @data
    mov ds, ax
    
   mov ah, 2
   mov dl, '@'
   int 21h
   int 21h
   int 21h
   int 21h
   int 21h 
   
   mov ah , 2
   mov dl, 10
   int 21h
   
   mov dl, 13
   int 21h    
   
   mov ah, 9
   lea dx, x
   int 21h
   
   mov ah, 1
   int 21h
   mov bl, al
   
   mov ah, 1
   int 21h
   mov bh, al   
   
   mov ah , 2 ; new line
   mov dl, 10
   int 21h
   
   mov dl, 13
   int 21h  
   
   mov ah, 2
   mov dl, bl
   int 21h
   
   mov ah, 2
   mov dl, bh
   int 21h
   
   cmp bl, bh
   jge bl_greater
   
   mov ch, bl
   xchg ch, bh
   mov bl, ch
     
   bl_greater:
    mov dl, bl
    int 21h
    
    mov dl, bh
    int 21h

        
    exit:
        mov ah, 4ch
        int 21h
        main endp
    end main