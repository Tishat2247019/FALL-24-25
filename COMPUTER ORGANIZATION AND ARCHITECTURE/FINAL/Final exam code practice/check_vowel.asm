.model small
.stack 100h 

.data
y db "yes vowel $"
n db "not vowel $"

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
   
    cmp al, 'a'
   je print_yes
     cmp al, 'e'
   je print_yes    
     cmp al, 'i'
   je print_yes    
     cmp al, 'o'
   je print_yes
     cmp al, 'u'
   je print_yes
   
   
   print_no:
   mov ah, 9
   lea dx, n
   int 21h
   jmp exit_
    
    
    print_yes:
    mov ah, 9
    lea dx, y
    int 21h
    
        
    exit_:
    mov ah, 4ch
    int 21h
    main endp
