; Imprime argv[0] e argc via printf
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
fmt: db "argc=%d, argv[0]=%s", 10, 0

section .text
MAIN:
    push rbp
    mov  rbp, rsp
    ; assinatura de main(int argc, char** argv):
    ; rdi = argc, rsi = argv

    sub  rsp, 8                   ; alinhar antes do call

    ; preparar argumentos pra printf(fmt, argc, argv[0])
    lea  rax, [rel fmt]           ; fmt
    mov  rcx, [rsi + 0]           ; argv[0] (char*)
    mov  rdx, rdi                 ; argc (int -> estendido em rdx)
    ; ordem: rdi, rsi, rdx, rcx, r8, r9
    mov  rdi, rax
    mov  rsi, rdx
    mov  rdx, rcx
    xor  eax, eax                 ; variádica
    call EXTERN(printf)

    add  rsp, 8
    xor  eax, eax
    leave
    ret