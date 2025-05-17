.equ FLAGS, 1
.equ MAGIC, 0x1badb002
.equ CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .align 4
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .bss
    .align 16
    stack_bottom:
        .skip 16384
    stack_top:

.section .text
    .global _start
    .type _start, @function
    _start:
        mov $stack_top, %esp
        push %eax
        push %ebx
        call main