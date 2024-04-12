ENTRY(_start)

SECTIONS {
    . = 2M;

    .text : ALIGN(4K) {
        *(.multiboot)
        *(.text)
    }

    .rodata : ALIGN(4K) {
        *(.rodata)
    }

    .data : ALIGN(4K) {
        *(.data)
    }

    .bss : ALIGN(4K) {
        *(COMMON)
        *(.bss)
    }

    # https://stackoverflow.com/questions/77812688/how-do-i-completely-get-rid-of-dynsym-dynstr-and-dynamic-sections
    # if we don't add this then multiboot won't work
    /DISCARD/ : { *(.dynsym) *(.dynstr) *(.dynamic) *(.gnu.hash) *(.hash) *(.comment) }
}