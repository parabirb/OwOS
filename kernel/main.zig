const cmd = @import("console/cmd.zig");
const multiboot = @import("boot/multiboot.zig");

export fn _start(mb_info: *multiboot.MultibootHeader) callconv(.C) noreturn {
    var testU32: u32 = 0;
    asm volatile ("mov %eax, %[testU32]" : [testU32] "=r" (testU32));
    cmd.putU32(testU32);
    cmd.putString("\nmultiboot info ptr: ", 0xf, 0x0);
    cmd.putU32(@intFromPtr(mb_info));
    cmd.putString("\nmultiboot flags: ", 0xf, 0x0);
    cmd.putU32(mb_info.*.flags);
    while (true) {}
}