.equ FLAGS, 0
.equ MAGIC, 0x1badb002
.equ CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .align 4
    .long MAGIC
    .long FLAGS
    .long CHECKSUM