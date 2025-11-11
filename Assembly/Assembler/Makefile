UNAME_S := $(shell uname -s)

# NASM (x86_64) + clang/cc
ASM      := nasm
ifeq ($(UNAME_S),Darwin)
FORMAT   := macho64
CC       := clang
else
FORMAT   := elf64
CC       := cc
endif

CFLAGS   := -O2 -pipe -Wall
LDFLAGS  :=

# Alvos x86_64 (NASM)
X86_DIR  := x86_64-nasm
X86_OBJS := $(X86_DIR)/hello_printf.o $(X86_DIR)/write_text.o $(X86_DIR)/args_print.o
X86_BINS := hello_printf write_text args_print

# Alvo ARM64 (GAS)
ARM_DIR  := arm64-gas
ARM_BINS := hello_printf_arm64

.PHONY: all clean x86 arm64

all: x86

x86: $(X86_BINS)

hello_printf: $(X86_DIR)/hello_printf.o
	$(CC) $(LDFLAGS) -o $@ $^

write_text: $(X86_DIR)/write_text.o
	$(CC) $(LDFLAGS) -o $@ $^

args_print: $(X86_DIR)/args_print.o
	$(CC) $(LDFLAGS) -o $@ $^

$(X86_DIR)/%.o: $(X86_DIR)/%.asm
	$(ASM) -f $(FORMAT) -g -F dwarf -o $@ $<

arm64: $(ARM_BINS)

hello_printf_arm64: $(ARM_DIR)/hello_printf.S
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(X86_DIR)/*.o $(X86_BINS) $(ARM_BINS)