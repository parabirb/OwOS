const std = @import("std");

pub fn build(b: *std.build.Builder) !void {
    var target: std.zig.CrossTarget = .{
        .cpu_arch = .x86,
        .os_tag = .freestanding,
        .abi = .none,
    };

    const optimize = b.standardOptimizeOption(.{});
    const kernel = b.addExecutable(.{
        .name = "kernel",
        .root_source_file = .{ .path = "kernel/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    kernel.addAssemblyFile(.{ .path = "kernel/boot/multiboot.s" });
    kernel.code_model = .kernel;
    kernel.setLinkerScriptPath(.{ .path = "kernel/linker.ld" });
    kernel.pie = true;
    kernel.strip = true;

    b.installArtifact(kernel);
}
