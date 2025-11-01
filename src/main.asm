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

str_to_int:
        push rbp
        mov rsp, rbp
        sub rsp, 4

        mov qword [rbp-4], rax
        mov r15, [rbp-4]
        xor rax, rax

        .top:
                movzx r10, byte [r15]

                inc r15
                cmp r15, '0'

                jb .done
                cmp r15, '9'

                ja .done
                sub r15, '0'

                imul rax, 10
                add rax, r15
                jmp .top

        .done:
                leave
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

        mov rax, uinp1
        call str_to_int
        mov r10, rax
        add r10, 2

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
