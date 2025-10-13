; src/hello.asm  — Linux x86_64 (YASM/NASM syntax)
; write(1, msg, len) ; exit(0)

        section .data
msg:    db  "Hello from ASM on GitHub!", 10
len:    equ $-msg

        section .text
        global _start

_start:
        ; syscall: write
        mov     rax, 1          ; sys_write
        mov     rdi, 1          ; fd = stdout
        mov     rsi, msg        ; buf
        mov     rdx, len        ; count
        syscall

        ; syscall: exit(0)
        mov     rax, 60         ; sys_exit
        xor     rdi, rdi        ; status = 0
        syscall
