// https://gitlab.com/UltimaN3rd/hello-zig/-/blob/master/build.zig
// https://zig.news/xq/zig-build-explained-part-1-59lf
const std = @import("std");
const path = std.os.path;
const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("main", "main.zig");
    exe.setBuildMode(mode);
    // Link Raylib, libC needed ?
    exe.linkLibC();
    exe.linkSystemLibrary("raylib");
    // On osx, raylib buid can fail if we don't link framework
    // https://github.com/raysan5/raylib/wiki/Working-on-macOS
    exe.linkFramework("IOKit");
    exe.linkFramework("Cocoa");
    exe.linkFramework("OpenGL");

    exe.install();
}
