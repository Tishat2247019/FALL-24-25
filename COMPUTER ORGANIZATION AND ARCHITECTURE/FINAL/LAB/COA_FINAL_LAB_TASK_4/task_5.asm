.model small
.stack 100h
.data
input_prompt db "Provide two numbers: $"
result_msg db "Calculation Result: $"
.code

main proc
    mov ax,@data
    mov ds,ax
    
    input_values proc
        mov ah,9
        lea dx,input_prompt
        int 21h
        
        mov ah,1
        int 21h
        mov bl,al
        int 21h
        mov bh,al
        call calculate_difference
        ret
        
    calculate_difference proc
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov ah,9
        lea dx,result_msg
        int 21h
        sub bl,bh 
        add bl,'0'
        mov ah,2
        mov dl,bl
        int 21h
            
        cmp bl,13
        jmp terminate 
            
    terminate:
    mov ah,4ch
    int 21h
end main
