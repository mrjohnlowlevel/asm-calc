section .bss
        uinp: resb 255  ; 8-bit int limit, i don't know what the fuck im doing

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
        mov rsi, uinp
        mov rdx, 255
        call get_user_input

        mov rsi, uinp
        mov rdx, 255
        call print

        mov rax, 60
        xor rdi, rdi
        syscall
