# Указываем путь к библиотекам и заголовочным файлам UEFI
EFI_INCLUDE_DIR = /usr/include/efi
EFI_LIB_DIR = /usr/lib

# Компилятор
CC = gcc

# Флаги компилятора и линковщика
CFLAGS = -ffreestanding -O2 -nostdlib -nostartfiles -I$(EFI_INCLUDE_DIR) -I$(EFI_INCLUDE_DIR)/x86_64
LDFLAGS = -nostdlib -nostartfiles -L$(EFI_LIB_DIR) -lefi -lgnuefi

# Имя итогового исполняемого файла
OUTPUT = main.efi

# Все цели по умолчанию
all: $(OUTPUT)

# Как компилировать и линковать .efi файл
$(OUTPUT): main.c
	$(CC) $(CFLAGS) -o $(OUTPUT) main.c $(LDFLAGS)

# Удаление всех файлов
clean:
	rm -f *.o $(OUTPUT)

