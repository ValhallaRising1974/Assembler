# Fibonacci ASM

A simple NASM x86 Assembly program tested using GitHub Actions.

## Compile and Run (Local - Ubuntu)

```bash
nasm -f elf32 fibonacci.asm -o fibonacci.o
ld -m elf_i386 fibonacci.o -o fibonacci
./fibonacci
