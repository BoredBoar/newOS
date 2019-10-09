global loader                       ;the entry symbol for ELF

MAGIC_NUMBER    equ 0x1BADB002      ;THE MAGIC NUMBER
FLAGS           equ 0x0             ;multiboot flags
CHECKSUM        equ -MAGIC_NUMBER   ;get the checksum

section .text:                      ;start of the text section
align 4                             ;must be 4 byte aligned
    dd MAGIC_NUMBER                 ;copy the MAGIC_NUMBER
    dd FLAGS                        ;next comes the flags
    dd CHECKSUM                     ;and finally the checksum

loader:
    mov eax, 0xCAFEBABE             ;Place the constant into the eax register
.loop:
    jmp .loop                       ;loop forever