// void memxor(uint8_t *dst, const uint8_t *src, size_t n)
// AAPCS64: x0=dst, x1=src, x2=n

        .text
        .globl  memxor
        .align  2
memxor:
        // processa em 8 bytes
        mov     x3, x2
        lsr     x3, x3, #3        // qwords
        cbz     x3, 2f
1:
        ldr     x4, [x1], #8
        ldr     x5, [x0]
        eor     x5, x5, x4
        str     x5, [x0], #8
        subs    x3, x3, #1
        b.ne    1b

2:      // restos
        and     x2, x2, #7
        cbz     x2, 4f
3:
        ldrb    w4, [x1], #1
        ldrb    w5, [x0]
        eor     w5, w5, w4
        strb    w5, [x0], #1
        subs    x2, x2, #1
        b.ne    3b

4:      ret
