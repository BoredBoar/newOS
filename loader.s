extern test_func
global loader                       ;the entry symbol for ELF

MAGIC_NUMBER    equ 0x1BADB002      ;THE MAGIC NUMBER
FLAGS           equ 0x0             ;multiboot flags
CHECKSUM        equ -MAGIC_NUMBER   ;get the checksum
KERNEL_STACK_SIZE equ 4096          ;size of the stack in bytes

section .text:                      ;start of the text section
align 4                             ;must be 4 byte aligned
    dd MAGIC_NUMBER                 ;copy the MAGIC_NUMBER
    dd FLAGS                        ;next comes the flags
    dd CHECKSUM                     ;and finally the checksum
    dd kernel_stack
    dd KERNEL_STACK_SIZE

loader:
    mov eax, 0xCAFEBABE             ;Place the constant into the eax register
    mov esp, kernel_stack + KERNEL_STACK_SIZE
    call test_func
    
.loop:
    jmp .loop                       ;loop forever

section .bss
align   4                           ;align at 4 bytes
kernel_stack:                       ;label for the beginning of memory
    resb KERNEL_STACK_SIZE          ;reserve stack for the kernel