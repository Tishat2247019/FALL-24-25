.model small
.stack
.data

.code
main proc
    mov ax, @data       ; Set up the data segment
    mov ds, ax

    ; Assuming AL is already loaded with a value.
    mov al, 4           ; Example value for AL, you can change it

    ; Check if AL is less than 0 (signed comparison)
    cmp al, 0           ; Compare AL with 0
    jnbe else_          ; Jump to else_ if AL >= 0 (AL is Not Below or Equal 0)

    ; IF part - if AL < 0
    mov ah, 0FFh        ; Set AH to FFh because AL < 0
    jmp exit            ; Skip to exit after setting AH

else_:
    ; ELSE part - if AL >= 0
    mov ah, 0           ; Set AH to 0 because AL >= 0

exit:
    mov ah, 4ch         ; Terminate the program
    int 21h

main endp
end main
