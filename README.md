# ⚔️ Assembler

<p align="center">
  <img src="https://img.shields.io/github/actions/workflow/status/ValhallaRising1974/Assembler/ci.yml?branch=main" />
  <img src="https://img.shields.io/badge/language-C-blue" />
  <img src="https://img.shields.io/github/last-commit/ValhallaRising1974/Assembler" />
  <img src="https://img.shields.io/github/license/ValhallaRising1974/Assembler" />
</p>

---

## 🌍 About (EN-CA)

**Assembler** is a living laboratory of **C programming, compilation, and disassembly**.  
Every commit triggers **GitHub Actions** to automatically:
1. Compile the source code (`C/src/*.c`) with `gcc`.
2. Execute the program, showing its output in the workflow logs.
3. Generate the **binary** and its **assembly disassembly** using `objdump`.
4. Upload both as **artifacts**, available for download.

This repository demonstrates the beauty of low-level computing: how high-level logic in C is transformed into machine instructions.

---

## 🌍 À propos (FR-CA)

**Assembler** est un laboratoire vivant de **programmation en C, compilation et désassemblage**.  
Chaque commit déclenche **GitHub Actions** pour :
1. Compiler le code source (`C/src/*.c`) avec `gcc`.
2. Exécuter le programme et afficher la sortie dans les journaux du workflow.
3. Générer le **binaire** et son **désassemblage assembleur** avec `objdump`.
4. Télécharger les deux en tant qu’**artifacts**, disponibles pour consultation et téléchargement.

Ce dépôt illustre la beauté du bas niveau : comment une logique en C se transforme en instructions machines.

---

## ⚙️ How to Run (Local)

```bash
# Compile
# ASM Core – YASM (Linux x86_64)

Minimal assembly studies with **YASM** targeting **ELF64** on Linux (built on GitHub Actions).

- Toolchain: yasm + ld
- CI: GitHub Actions (`.github/workflows/asm-build.yml`)
- Entry: `_start` (syscalls)

## Build status
![Build](https://github.com/ValhallaRising1974/asm-core/actions/workflows/asm-build.yml/badge.svg)

## Files
- `src/hello.asm` — writes a message and exits.gcc -O0 -g -o build/sum C/src/sum.c

# Run
./build/sum
