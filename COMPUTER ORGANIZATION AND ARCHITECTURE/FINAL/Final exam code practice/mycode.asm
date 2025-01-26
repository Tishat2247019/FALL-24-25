.model small
.stack 100h

.data
count db 0          ; Variable to store character count

.code
main proc
    mov ax, @data
    mov ds, ax       ; Initialize data segment

    mov cl, 0        ; Initialize count
    mov ah, 1        ; Read character function

while_:
    
     int 21h         ; Read a character
    cmp al, 13       ; Check for Enter (ASCII 13)
    je word_count    ; If Enter, go to word_count
    inc cl           ; Increment count for each character  
   
    jmp while_       ; loop while

word_count:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 2        ; Display character function
    add cl, 48      ; Convert number to ASCII
    mov dl, cl       ; Load DL with count
    int 21h          ; Print the count
    
    mov ah, 4Ch      ; Terminate program
    int 21h

main endp
end main
