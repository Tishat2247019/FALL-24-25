.model small
.stack 100
.data
    msg_input db 'Enter a letter to convert to Upper/Lower: $'
    msg_result db 'Converted case: $'
    msg_error db 'Not a valid letter.$'
    input db ?
    output db ?

.code
main proc
    mov ax, @data
    mov ds, ax 
    
    mov ah, 9
    lea dx, msg_input
    int 21h
    
    mov ah, 1
    int 21h
    mov input, al
 
    cmp al, 'A'
    jl check_lowercase
    cmp al, 'Z'
    jg check_lowercase

    or al, 20h           
    mov output, al
    jmp print_result

check_lowercase:
    cmp al, 'a'
    jl not_letter
    cmp al, 'z'
    jg not_letter

    and al, 5Fh          
    mov output, al
    jmp print_result

not_letter:
    lea dx, msg_error
    mov ah, 9
    int 21h
    jmp exit

print_result:
    mov ah, 2
    mov dl, 10
    int 21h
    
    mov dl, 13
    int 21h
    
    lea dx, msg_result
    mov ah, 9
    int 21h
    mov dl, output
    mov ah, 2
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp
end main
