const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .x86,
        .os_tag = .freestanding,
        .abi = .none,
    });

    const optimize = b.standardOptimizeOption(.{});
    const kernel = b.addExecutable(.{
        .name = "kernel",
        .root_source_file = b.path("src/kernel/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    kernel.addAssemblyFile(b.path("src/kernel/boot/multiboot.s"));
    kernel.setLinkerScript(b.path("src/kernel/linker.ld"));

    b.installArtifact(kernel);
}
