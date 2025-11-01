section .bss
        uinp1: resb 255
        uinp2: resb 255
        uinp3: resb 255

section .text
        global _start

get_user_input:
        mov rax, 0
        mov rdi, 0
        syscall
        ret

print:
        mov rax, 1
        mov rdi, 1
        syscall
        ret

_start:
        mov rsi, user_digit1_str
        mov rdx, user_digit1_len
        call print

        mov rsi, uinp1
        mov rdx, 255
        call get_user_input

        mov rsi, user_oper_str
        mov rdx, user_oper_len
        call print

        mov rsi, uinp2
        mov rdx, 255
        call get_user_input

        mov rsi, user_digit2_str
        mov rdx, user_digit2_len
        call print

        mov rsi, uinp3
        mov rdx, 255
        call get_user_input

        mov rax, 60
        xor rdi, rdi
        syscall


section .data
        user_digit1_str: db "Enter a number: "
        user_digit1_len: equ $-user_digit1_str

        user_oper_str: db "Enter an operator [+ - * /]: "
        user_oper_len: equ $-user_oper_str

        user_digit2_str: db "Enter another number: "
        user_digit2_len: equ $-user_digit2_str
