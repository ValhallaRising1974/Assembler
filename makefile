UNAME_S := $(shell uname -s)
ARCH    := $(shell uname -m)

CC      ?= cc
CFLAGS  := -O3 -Wall -Wextra -Iinclude

# Escolha um montador: vamos padronizar em NASM (não yasm)
ASM     ?= nasm

# Formato do NASM por OS
ifeq ($(UNAME_S),Darwin)
  NASM_FMT := macho64
else
  NASM_FMT := elf64
endif

# Fontes por arquitetura (apenas arquivos, nada de diretório)
X86_SRC := $(wildcard src/x86_64/*.asm)
ARM_SRC := $(wildcard src/arm64/*.S)

# Objetos no diretório build espelhando a estrutura
X86_OBJ := $(patsubst src/x86_64/%.asm, build/x86_64/%.o, $(X86_SRC))
ARM_OBJ := $(patsubst src/arm64/%.S,    build/arm64/%.o,    $(ARM_SRC))

# Alvos “binários” de exemplo
ALL_OBJS := $(X86_OBJ) $(ARM_OBJ)

.PHONY: all clean
all: test bench

# Regras de compilação (criando diretórios automaticamente)
build/x86_64/%.o: src/x86_64/%.asm
	@mkdir -p $(@D)
	$(ASM) -f $(NASM_FMT) -o $@ $<

build/arm64/%.o: src/arm64/%.S
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c -o $@ $<

# ---- Seus executáveis (exemplos) ----
# Ajuste se estiver usando o “kit” com testes/bench do passo anterior:
test: $(ALL_OBJS) tests/test_main.o
	$(CC) $(CFLAGS) -o $@ $^
bench: $(ALL_OBJS) bench/bench_strlen.o
	$(CC) $(CFLAGS) -o $@ $^

tests/%.o: tests/%.c include/lyra_asm.h
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c -o $@ $<

bench/%.o: bench/%.c include/lyra_asm.h
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -rf build test bench tests/*.o bench/*.o
