.model small
.stack 100h

.data
    prompt db 'Please enter a hexadecimal digit: $'
    err_msg db 'Your input is invalid.Please enter a number between(1-9), a char between(A-F)', 0Dh, 0Ah, '$'
    bin_label db 'The corresponding binary value is : $'
    bin_output db '0000$', 0
    newline db 0Dh, 0Ah, '$'

.code
start:

    mov ax, @data
    mov ds, ax

get_input:

    mov ah, 09h
    lea dx, prompt
    int 21h

    mov ah, 01h
    int 21h
    mov bl, al         
    cmp bl, '0'
    jl invalid_input
    cmp bl, '9'
    jle valid_hex_digit
    cmp bl, 'A'
    jl invalid_input
    cmp bl, 'F'
    jg invalid_input

valid_hex_digit:

    cmp bl, '9'
    jle convert_hex_digit
    sub bl, 'A' - 10  
    jmp convert_to_binary

convert_hex_digit:
    sub bl, '0'        

convert_to_binary:

    lea di, bin_output
    mov cl, 4            

convert_loop:
    mov al, bl           
    and al, 08h        
    shr al, 3         
    add al, '0'       
    mov [di], al        
    inc di              
    shl bl, 1           
    dec cl                
    jnz convert_loop    


    lea dx, newline
    mov ah, 09h
    int 21h

    mov ah, 09h
    lea dx, bin_label
    int 21h

    lea dx, bin_output
    int 21h

    lea dx, newline
    int 21h

exit_program:
    mov ah, 4Ch
    int 21h

invalid_input:
     
    lea dx, newline
    mov ah, 09h
    int 21h
    mov ah, 09h
    lea dx, err_msg
    int 21h
    jmp get_input   

end start
