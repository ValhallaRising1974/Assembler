// Build: clang -O2 -o hello_printf_arm64 arm64-gas/hello_printf.S
// Run:   ./hello_printf_arm64

        .text
        .globl  main
        .align  2

// int main(void)
main:
        // Prologue
        stp     x29, x30, [sp, -16]!
        mov     x29, sp

        // printf("Hello from UNIX ASM, %s!\n", "Lyra");
        adrp    x0, fmt@PAGE
        add     x0, x0, fmt@PAGEOFF        // x0 = &fmt
        adrp    x1, name@PAGE
        add     x1, x1, name@PAGEOFF       // x1 = &name
        bl      printf

        // return 0
        mov     w0, #0
        ldp     x29, x30, [sp], 16
        ret

        .section __TEXT,__const
fmt:    .asciz  "Hello from UNIX ASM, %s!\n"
name:   .asciz  "Lyra"

        .subsections_via_symbols