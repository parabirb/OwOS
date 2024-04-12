# Get memory map from the bootloader
.equ FLAGS, 1
# multiboot1 magic
.equ MAGIC, 0x1badb002
# checksum
.equ CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .align 4
    .long MAGIC
    .long FLAGS
    .long CHECKSUM