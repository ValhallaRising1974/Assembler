; Portable x86_64 NASM + libc (printf)
; Assemble: nasm -f macho64|elf64 ...
; Link: cc/clang hello_printf.o -o hello_printf

%ifidn __OUTPUT_FORMAT__, macho64
  %define MAIN _main
  %define EXTERN(x) _ %+ x
%else
  %define MAIN main
  %define EXTERN(x) x
%endif

global MAIN
extern EXTERN(printf)

section .rodata
fmt:   db "Hello from UNIX ASM, %s!", 10, 0
name:  db "Lyra", 0

section .text
MAIN:
    ; prólogo padrão
    push rbp
    mov  rbp, rsp

    ; alinhar a pilha a 16 bytes antes do call (RSP%16==8 em main)
    sub  rsp, 8

    lea  rdi, [rel fmt]    ; 1º arg: format
    lea  rsi, [rel name]   ; 2º arg: string
    xor  eax, eax          ; número de XMM regs usados por variádica
    call EXTERN(printf)

    add  rsp, 8
    xor  eax, eax          ; return 0
    leave
    ret