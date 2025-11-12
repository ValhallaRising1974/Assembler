; size_t fast_strlen(const char *s)
; System V x86_64: arg0 = rdi, retorno = rax
; Usa repne scasb para achar o '\0' rapidamente.

%ifidn __OUTPUT_FORMAT__, macho64
  %define EXTERN(x) _ %+ x
%else
  %define EXTERN(x) x
%endif

global fast_strlen

section .text
fast_strlen:
    ; rdi = s
    mov     rax, rdi        ; guardar base
    mov     rcx, -1         ; "infinito" (0xFFFFFFFFFFFFFFFF)
    xor     al, al          ; AL = 0 (byte a procurar)
    repne scasb             ; varre até encontrar '\0'
    ; após scasb:
    ; rdi aponta para (s + len + 1)
    ; rcx = ~len
    not     rcx
    dec     rcx             ; len
    mov     rax, rcx
    ret
