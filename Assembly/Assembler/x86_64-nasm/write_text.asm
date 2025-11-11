; Escreve um arquivo via libc (fopen/fputs/fclose) — 100% POSIX-friendly
%ifidn __OUTPUT_FORMAT__, macho64
  %define MAIN _main
  %define EXTERN(x) _ %+ x
%else
  %define MAIN main
  %define EXTERN(x) x
%endif

global MAIN
extern EXTERN(fopen)
extern EXTERN(fputs)
extern EXTERN(fclose)

section .rodata
fname: db "out.txt", 0
mode:  db "w", 0
msg:   db "Portable ASM on UNIX (POSIX via libc).", 10, 0

section .text
MAIN:
    push rbp
    mov  rbp, rsp
    sub  rsp, 8            ; alinhar antes das chamadas

    ; FILE* f = fopen("out.txt","w");
    lea  rdi, [rel fname]  ; arg1
    lea  rsi, [rel mode]   ; arg2
    call EXTERN(fopen)
    test rax, rax
    jz   .done             ; se NULL, encerra
    mov  rbx, rax          ; guardar FILE* (callee-saved não necessário, mas ok)

    ; fputs(msg, f);
    lea  rdi, [rel msg]    ; arg1: const char*
    mov  rsi, rbx          ; arg2: FILE*
    call EXTERN(fputs)

    ; fclose(f);
    mov  rdi, rbx
    call EXTERN(fclose)

.done:
    add  rsp, 8
    xor  eax, eax
    leave
    ret