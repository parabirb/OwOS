/*
    stolen from xinos, used chatgpt to convert to at&t
    because i'm lazy like that
*/
.equ FLAGS, (1 << 0) | (1 << 1)
.equ MAGIC, 0x1badb002
.equ CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot, "a"
    .align 4
    .long MAGIC
    .long FLAGS
    .long CHECKSUM