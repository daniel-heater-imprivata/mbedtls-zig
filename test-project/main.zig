const std = @import("std");
const c = @cImport({
    @cInclude("mbedtls/version.h");
});

pub fn main() !void {
    const version = c.mbedtls_version_get_number();
    const major = (version >> 24) & 0xFF;
    const minor = (version >> 16) & 0xFF;
    const patch = (version >> 8) & 0xFF;
    
    std.debug.print("mbedtls version: {}.{}.{}\n", .{ major, minor, patch });
    std.debug.print("mbedtls test successful!\n", .{});
}

