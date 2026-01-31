; void memxor(uint8_t *dst, const uint8_t *src, size_t n)
; System V: rdi=dst, rsi=src, rdx=n

global memxor
section .text
memxor:
    ; loop básico em 8 bytes, depois resíduos
    mov     rcx, rdx
    shr     rcx, 3              ; qwords
    jz      .tail

align 16
.qloop:
    mov     r8,  [rsi]
    xor     [rdi], r8
    add     rdi, 8
    add     rsi, 8
    dec     rcx
    jnz     .qloop

.tail:
    ; bytes restantes
    and     rdx, 7
    jz      .done
.tloop:
    mov     al, [rsi]
    xor     [rdi], al
    inc     rdi
    inc     rsi
    dec     rdx
    jnz     .tloop

.done:
    ret
