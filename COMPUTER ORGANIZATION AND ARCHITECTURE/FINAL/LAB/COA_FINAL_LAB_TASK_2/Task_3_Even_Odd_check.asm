.model small
.stack 100
.data
    msg_input db 'Please enter a number to check even/odd: $'
    msg_the_number db 'The number $'
    msg_odd db ' is an odd number.$'
    msg_even db ' is an even number.$'
    msg_error db ' is not a number.$'
    newline db 13, 10, '$'   ; Carriage return + Line feed for a new line

    input db ?               ; To store the user input

.code
main proc
    mov ax, @data
    mov ds, ax 

    ; Display the input prompt
    mov ah, 9
    lea dx, msg_input
    int 21h

    ; Input a character
    mov ah, 1
    int 21h
    mov input, al            ; Store the input character in 'input'

    ; Add a newline after input
    lea dx, newline
    mov ah, 9
    int 21h

    ; Check if input is a digit (ASCII '0' to '9')
    mov al, input            ; Reload input from memory
    cmp al, '0'
    jl not_number            ; If less than '0', not a number
    cmp al, '9'
    jg not_number            ; If greater than '9', not a number

    ; Convert ASCII digit to numerical value
    sub al, '0'

    ; Use TEST instruction to check if even or odd
    mov bl, al               ; Copy the number into BL for later
    test al, 1               ; Check the least significant bit (LSB)
    jz even_number           ; If LSB = 0, it’s even

odd_number:
    ; Display "The number"
    lea dx, msg_the_number
    mov ah, 9
    int 21h

    ; Display the number
    add bl, '0'              ; Convert back to ASCII
    mov dl, bl
    mov ah, 2
    int 21h

    ; Display " is an odd number."
    lea dx, msg_odd
    mov ah, 9
    int 21h
    jmp exit

even_number:
    ; Display "The number"
    lea dx, msg_the_number
    mov ah, 9
    int 21h

    ; Display the number
    add bl, '0'              ; Convert back to ASCII
    mov dl, bl
    mov ah, 2
    int 21h

    ; Display " is an even number."
    lea dx, msg_even
    mov ah, 9
    int 21h
    jmp exit

not_number:
    ; Display "The number"
    lea dx, msg_the_number
    mov ah, 9
    int 21h

    ; Display the invalid input
    mov dl, input            ; Input character is already in 'input'
    mov ah, 2
    int 21h

    ; Display " is not a number."
    lea dx, msg_error
    mov ah, 9
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp
end main
