const cmd = @import("console/cmd.zig");
const multiboot = @import("boot/multiboot.zig");

export fn main(mb_info: *multiboot.MultibootHeader, magic: u32) callconv(.C) noreturn {
    cmd.putU32(magic);
    cmd.putString("\nmultiboot info ptr: ", 0xf, 0x0);
    cmd.putU32(@intFromPtr(mb_info));
    cmd.putString("\nmultiboot flags: ", 0xf, 0x0);
    cmd.putU32(mb_info.*.flags);
    while (true) {}
}
