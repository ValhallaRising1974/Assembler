; sum_array.asm — soma inteiros de um vetor e imprime via sys_write (decimal simples)
; Montagem: yasm -f elf64 sum_array.asm -o sum_array.o
; Link:     ld sum_array.o -o sum_array

BITS 64
        global  _start

section .data
arr:    dq  10, 20, 30, 40, 50
n:      equ 5

buf:    times 32 db 0     ; buffer para número + '\n'

section .text
; Converte unsigned em decimal no buffer (termina com '\n'), retorna RSI=ptr e RDX=len
utoa10:
        ; entrada: RDI=valor, RSI=ptr buffer (fim), o buffer deve ter espaço
        ; saída: RSI=ptr inicial, RDX=len
        mov     rax, rdi
        mov     rcx, 0
        mov     rbx, 10
.conv:
        xor     rdx, rdx
        div     rbx
        add     rdx, '0'
        dec     rsi
        mov     [rsi], dl
        inc     rcx
        test    rax, rax
        jnz     .conv
        dec     rsi
        mov     byte [rsi], 10   ; '\n'
        inc     rcx
        mov     rdx, rcx
        ret

_start:
        ; soma
        xor     rax, rax         ; soma em RAX
        xor     rcx, rcx
.loop:
        cmp     rcx, n
        jge     .print
        add     rax, [arr + rcx*8]
        inc     rcx
        jmp     .loop

.print:
        ; converter RAX para decimal em buf
        lea     rsi, [buf + 32]
        mov     rdi, rax
        call    utoa10           ; RSI=ptr, RDX=len

        ; write(1, RSI, RDX)
        mov     rax, 1
        mov     rdi, 1
        syscall

        ; exit(0)
        mov     rax, 60
        xor     rdi, rdi
        syscall
