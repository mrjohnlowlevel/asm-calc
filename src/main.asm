section .data
        test_str: db "Hello, World!",10
        testl: equ $-test_str

section .text
        global _start

_start:
        mov rax, 1
        mov rdi, 1
        mov rsi, test_str
        mov rdx, testl
        syscall

        mov rax, 60
        xor rdi, rdi
        syscall
