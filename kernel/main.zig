const cmd = @import("console/cmd.zig");

export fn _start() callconv(.C) noreturn {
    cmd.putString("hello, OwOS!", 0xf, 0x0);
    while (true) {
        asm volatile ("hlt");
    }
}