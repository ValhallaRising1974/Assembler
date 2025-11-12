UNAME_S := $(shell uname -s)
CC      ?= cc
CFLAGS  := -O3 -Wall -Wextra -Iinclude
LDFLAGS := 

# detecção de arq
ifeq ($(UNAME_S),Darwin)
  ARCH := $(shell uname -m)
else
  ARCH := $(shell uname -m)
endif

OBJS_COMMON := tests/test_main.o bench/bench_strlen.o

ifeq ($(ARCH),x86_64)
  ASM_OBJS := src/x86_64/fast_strlen.o src/x86_64/memxor.o
  ASM_X86 := 1
  NASM ?= nasm
  ASMFLAGS := -f elf64
  ifeq ($(UNAME_S),Darwin)
    ASMFLAGS := -f macho64
  endif
else ifneq (,$(findstring arm64,$(ARCH)))
  ASM_OBJS := src/arm64/fast_strlen.o src/arm64/memxor.o
  ASM_ARM := 1
else ifneq (,$(findstring aarch64,$(ARCH)))
  ASM_OBJS := src/arm64/fast_strlen.o src/arm64/memxor.o
  ASM_ARM := 1
else
  $(error Arquitetura não suportada: $(ARCH))
endif

all: test bench

test: $(ASM_OBJS) tests/test_main.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

bench: $(ASM_OBJS) bench/bench_strlen.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

# regras
tests/%.o: tests/%.c include/lyra_asm.h
	$(CC) $(CFLAGS) -c -o $@ $<

bench/%.o: bench/%.c include/lyra_asm.h
	$(CC) $(CFLAGS) -c -o $@ $<

src/x86_64/%.o: src/x86_64/%.asm
	$(NASM) $(ASMFLAGS) -o $@ $<

src/arm64/%.o: src/arm64/%.S
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f test bench $(ASM_OBJS) $(OBJS_COMMON)
