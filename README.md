[![CI](https://github.com/allyourcodebase/mbedtls/actions/workflows/ci.yaml/badge.svg)](https://github.com/allyourcodebase/mbedtls/actions)

# Mbed TLS

This is [Mbed TLS](https://github.com/Mbed-TLS/mbedtls), packaged for [Zig](https://ziglang.org/).

## Installation

First, update your `build.zig.zon`:

```
# Initialize a `zig build` project if you haven't already
zig init
zig fetch --save git+https://github.com/allyourcodebase/mbedtls.git
```

You can then import `mbedtls` in your `build.zig` with:

```zig
const mbedtls_dependency = b.dependency("mbedtls", .{
    .target = target,
    .optimize = optimize,
});
your_exe.root_module.linkLibrary(mbedtls_dependency.artifact("mbedtls"));
```
