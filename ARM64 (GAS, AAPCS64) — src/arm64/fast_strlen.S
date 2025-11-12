// size_t fast_strlen(const char *s)
// AAPCS64: x0 = s, retorno em x0
// Loop por bytes: simples e portável (pode ser vetorizado futuramente).

        .text
        .globl  fast_strlen
        .align  2
fast_strlen:
        mov     x1, x0            // base
        // loop
1:
        ldrb    w2, [x0]
        cbz     w2, 2f
        add     x0, x0, #1
        b       1b
2:
        sub     x0, x0, x1        // len = end - base
        ret
