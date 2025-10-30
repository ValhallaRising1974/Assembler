cat > src/Hi_There.asm <<'EOF'
; hello_world.asm — escreve "Hello, ASM!" e sai (x86-64 Linux)
; Montagem: yasm -f elf64 hello_world.asm -o hello_world.o
; Link:     ld hello_world.o -o hello_world
; Exec:     ./hello_world

BITS 64
        global  _start

section .rodata
msg:    db  "Hello, ASM!", 10
len:    equ $ - msg

section .text
_start:
        ; write(1, msg, len)
        mov     rax, 1          ; sys_write
        mov     rdi, 1          ; stdout
        mov     rsi, msg
        mov     rdx, len
        syscall

        ; exit(0)
        mov     rax, 60         ; sys_exit
        xor     rdi, rdi
        syscall
EOF
