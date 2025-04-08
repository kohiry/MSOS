CC = gcc
CFLAGS = -ffreestanding -O2 -nostdlib -nostartfiles -I/usr/include/efi -I/usr/include/efi/x86_64
LDFLAGS = -L/usr/lib -lefi -lgnuefi -T/usr/lib/elf_x86_64_efi.lds

SRC = main.c
OBJ = main.o
OUT = main.efi

all: $(OUT)

$(OUT): $(OBJ)
	$(CC) $(OBJ) -o $(OUT) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(OUT)

