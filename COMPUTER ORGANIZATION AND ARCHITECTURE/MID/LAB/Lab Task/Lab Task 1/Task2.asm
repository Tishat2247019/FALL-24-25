.model small
.stack 100h
.data

predefined db 97
.code

main proc
   
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 2
    mov dl, bl
    int 21h
    
    mov ah, 2
    mov dl, predefined
    int 21h
    
 mov ah, 4ch
 int 21h
 main endp

end main
