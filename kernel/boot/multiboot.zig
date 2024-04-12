// multiboot structs, for use in OwOS
// public domain
// do not use this in your own projects without reading the multiboot spec
// and implementing any struct necesssary to your project
pub const MultibootMmap = packed struct {
    size: u32,
    address: u64,
    len: u64,
    type: u32
};

pub const MultibootSymTab = packed struct {
    num: u32,
    size: u32,
    addr: u32,
    shndx: u32
};

pub const MultibootHeader = packed struct {
    flags: u32,
    mem_lower: u32,
    mem_upper: u32,
    boot_device: u32,
    cmdline: u32,
    mods_count: u32,
    mods_addr: u32,
    syms: MultibootSymTab,
    mmap_length: u32,
    mmap_addr: u32,
    drives_length: u32,
    drives_addr: u32,
    config_table: u32,
    boot_loader_name: u32,
    apm_table: u32,
    vbe_control_info: u32,
    vbe_mode_info: u32,
    vbe_mode: u32,
    vbe_interface_seg: u32,
    vbe_interface_off: u32,
    vbe_interface_len: u32,
    framebuffer_addr: u32,
    framebuffer_pitch: u32,
    framebuffer_width: u32,
    framebuffer_height: u32,
    framebuffer_bpp: u32,
    framebuffer_type: u8,
    color_info: u32
};