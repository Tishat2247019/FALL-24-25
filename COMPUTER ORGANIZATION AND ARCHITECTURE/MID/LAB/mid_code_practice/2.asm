.model small
.stack 100h

.data

three db ?
x db "Enter three digits: $"
y db "Your name : MR. John $"
z db "Your ID : $"
a db "Your Age : 20$"

.code 
main proc
   mov ax, @data
   mov ds, ax
   
   mov ah, 9
   lea dx, x
   int 21h
   
   mov ah, 1
   int 21h
   mov bl, al
   
   int 21h
   mov bh, al
   
   int 21h
   mov three, al
 

   mov ah, 2
   mov dl, 10
   int 21h
   
   mov ah, 2
   mov dl, 13
   int 21h
           
           
   mov ah, 9
   lea dx, y
   int 21h

   
   mov ah, 2
   mov dl, 10
   int 21h
   
   mov ah, 2
   mov dl, 13
   int 21h 

   mov ah, 9
   lea dx, z
   int 21h
   
   mov cx, 2 
   mov ah, 2
   mov dl, bl
  
   
   first_digit:
    int 21h
  loop  first_digit
     
     mov ah, 2
     mov dl, '-'
     int 21h
     
     mov cx, 5
     mov dl, bh
     mov ah, 2
     
     second_digit:
     int 21h
     loop second_digit 
     
     
     mov ah, 2
     mov dl, '-'
     int 21h  
     
     mov cx, 1
     mov dl, three
     mov ah, 2
     
     third_digit:
     int 21h
     loop third_digit 
 
    mov ah, 2
   mov dl, 10
   int 21h
   
   mov ah, 2
   mov dl, 13
   int 21h    
     
     mov ah, 9
     lea dx, a
     int 21h
     
   mov ah, 4ch
   int 21h      

 
    main endp

end main