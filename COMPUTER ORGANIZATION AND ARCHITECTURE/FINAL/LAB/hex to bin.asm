.model small
.stack 100h

.data
    input db 'Enter a hexadecimal digit: $'
    error db 'Invalid input!', 0Dh, 0Ah, '$'
    binary db 'Binary: $'
    binary_output db '0000$', 0
    newline db 0Dh, 0Ah, '$'

.code
main:
    
    mov ax, @data
    mov ds, ax

get_hex_input:
   
    mov ah, 09h
    lea dx, input
    int 21h

    
    mov ah, 01h
    int 21h
    mov bl, al         
    cmp bl, '0'
    jl invalid_input
    cmp bl, '9'
    jle valid_digit
    cmp bl, 'A'
    jl invalid_input
    cmp bl, 'F'
    jg invalid_input

valid_digit:
    
    cmp bl, '9'
    jle convert_digit
    sub bl, 'A' - 10  
    jmp convert_to_binary

convert_digit:
    sub bl, '0'        

convert_to_binary:
    
    lea di, binary_output
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

    
    mov ah, 09h
    lea dx, binary
    int 21h

    
    lea dx, binary_output
    int 21h

    
    lea dx, newline
    int 21h

   
exit:
    mov ah, 4Ch
    int 21h

invalid_input:
   
    mov ah, 09h
    lea dx, error
    int 21h
    jmp get_hex_input   

end main
