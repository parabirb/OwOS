const cmd = @import("console/cmd.zig");

export fn _start() callconv(.C) noreturn {
    cmd.putString("hello, OwOS!", 0xf, 0x0);
    for (1..26) |i| cmd.putString("\nhello, OwOS!", 0xf, @truncate(i % 4));
    asm volatile ("cli");
    asm volatile ("hlt");
}