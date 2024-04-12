const cmd = @import("console/cmd.zig");

export fn _start() callconv(.C) noreturn {
    cmd.putString("woof!", 0xf, 0x0);
    while (true) {}
}