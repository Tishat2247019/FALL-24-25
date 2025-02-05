

.model small
.stack 100h
.data
input db "Please enter 8 bit binary number : $"
output db 10, 13," Reversed order is :$ "

.code

main proc

mov ax, @data
mov ds, ax

mov ah, 9
lea dx, input
int 21h

xor bx, bx
mov cx, 8

input_:
mov ah, 1
int 21h
and al, 0fh
shl bx, 1
or bl, al

loop input_

mov ah, 9
lea dx, output
int 21h


mov cx, 8

reverse_print_:
mov ah, 2
ror bx, 1
mov dl, '0'
jnc print_
mov dl, '1'

print_:
	int 21h
	loop reverse_print_

mov ah, 4ch
int 21h

main endp
end main

