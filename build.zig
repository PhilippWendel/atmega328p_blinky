const std = @import("std");

const atmega = @import("atmega");

const microzig = atmega.microzig;

pub fn build(b: *std.build.Builder) !void {
    const optimize = b.standardOptimizeOption(.{});
    var exe = microzig.addEmbeddedExecutable(b, .{
        .name = "my-executable",
        .source_file = .{
            .path = "src/main.zig",
        },
        .backing = .{
            .chip = atmega.chips.atmega328p,
        },
        .optimize = optimize,
    });
    exe.installArtifact(b);
}
