// just export a simple header for now idrc
const MultibootHeader = packed struct {
    magic: u32,
    flags: u32,
    checksum: u32
};

export const multiboot_header align(4) linksection(".multiboot") = MultibootHeader {
    .magic = 0x1BADB002,
    .flags = 0,
    .checksum = ~(multiboot_header.magic +% multiboot_header.flags) +% 1
};