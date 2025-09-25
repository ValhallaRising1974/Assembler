# Assembler

![Build Status](https://img.shields.io/github/actions/workflow/status/ValhallaRising1974/Assembler/ci.yml?branch=main)
![Language](https://img.shields.io/badge/language-C-blue)
![Last Commit](https://img.shields.io/github/last-commit/ValhallaRising1974/Assembler)

## About
This repository is a laboratory of **C programming, compilation and disassembly**.  
Every commit triggers GitHub Actions to compile and run the code, generating both the **binary** and its **assembly disassembly**.

## How to Run (local)
```bash
gcc -O0 -g -o build/sum C/src/sum.c
./build/sum
