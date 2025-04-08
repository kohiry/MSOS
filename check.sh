#!/bin/bash

# Проверка наличия gcc
echo "Проверка наличия gcc..."
if ! command -v gcc &> /dev/null
then
    echo "Ошибка: gcc не установлен. Установите его с помощью: sudo pacman -S gcc"
    exit 1
else
    echo "gcc найден: $(gcc --version | head -n 1)"
fi

# Проверка наличия make
echo "Проверка наличия make..."
if ! command -v make &> /dev/null
then
    echo "Ошибка: make не установлен. Установите его с помощью: sudo pacman -S make"
    exit 1
else
    echo "make найден: $(make --version | head -n 1)"
fi

# Проверка наличия пакета gnu-efi
echo "Проверка наличия gnu-efi..."
if ! pacman -Qs gnu-efi &> /dev/null
then
    echo "Ошибка: gnu-efi не установлен. Установите его с помощью: sudo pacman -S gnu-efi"
    exit 1
else
    echo "gnu-efi найден."
fi

# Проверка наличия линковочного скрипта elf_x86_64_efi.lds
echo "Проверка наличия линковочного скрипта elf_x86_64_efi.lds..."
if ! find /usr/lib -name elf_x86_64_efi.lds &> /dev/null
then
    echo "Ошибка: линковочный скрипт elf_x86_64_efi.lds не найден. Убедитесь, что установлен gnu-efi."
    exit 1
else
    echo "Линковочный скрипт elf_x86_64_efi.lds найден."
fi

# Проверка наличия библиотеки libefi.so
echo "Проверка наличия библиотеки libefi.so..."
if ! ldconfig -p | grep libefi &> /dev/null
then
    echo "Ошибка: библиотека libefi.so не найдена. Убедитесь, что установлен gnu-efi."
    exit 1
else
    echo "Библиотека libefi.so найдена."
fi

# Проверка наличия библиотеки libgnuefi.so
echo "Проверка наличия библиотеки libgnuefi.so..."
if ! ldconfig -p | grep libgnuefi &> /dev/null
then
    echo "Ошибка: библиотека libgnuefi.so не найдена. Убедитесь, что установлен gnu-efi."
    exit 1
else
    echo "Библиотека libgnuefi.so найдена."
fi

# Проверка наличия efibootmgr
echo "Проверка наличия efibootmgr..."
if ! command -v efibootmgr &> /dev/null
then
    echo "Ошибка: efibootmgr не установлен. Установите его с помощью: sudo pacman -S efibootmgr"
    exit 1
else
    echo "efibootmgr найден: $(efibootmgr -v)"
fi

# Завершающее сообщение
echo "Все проверки завершены. Если ошибок не было, ваши зависимости установлены корректно!"

