#include <efi.h>
#include <efilib.h>

EFI_STATUS
EFIAPI
efi_main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
{
    // Инициализация интерфейса EFI
    InitializeLib(ImageHandle, SystemTable);

    // Печать сообщения на экран
    Print(L"Hello from UEFI!\n");

    // Бесконечный цикл
    while (1) {
        // Здесь можно добавлять код для обработки команд
    }

    return EFI_SUCCESS;
}

