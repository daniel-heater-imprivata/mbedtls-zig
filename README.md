[![CI](https://github.com/daniel-heater-imprivata/mbedtls-zig/actions/workflows/ci.yaml/badge.svg)](https://github.com/daniel-heater-imprivata/mbedtls-zig/actions)

# mbedtls

This is [mbedTLS](https://github.com/Mbed-TLS/mbedtls), packaged for [Zig](https://ziglang.org/).

## Installation

First, update your `build.zig.zon`:

```
# Initialize a `zig build` project if you haven't already
zig init
zig fetch --save git+https://github.com/daniel-heater-imprivata/mbedtls-zig.git#3.6.4
```

You can then import `mbedtls` in your `build.zig` with:

```zig
const mbedtls_dependency = b.dependency("mbedtls", .{
    .target = target,
    .optimize = optimize,
});
your_exe.linkLibrary(mbedtls_dependency.artifact("mbedtls"));
```

## Build Options

Position Independent Code (PIC) can be enabled:

```zig
const mbedtls_dependency = b.dependency("mbedtls", .{
    .target = target,
    .optimize = optimize,
    .pie = true, // Enable Position Independent Code (default=false)
});
```

## Features

mbedTLS provides:
- TLS/SSL protocols (TLS 1.2, TLS 1.3)
- X.509 certificate handling
- Cryptographic primitives (AES, RSA, ECC, SHA, etc.)
- PSA Crypto API

All dependencies are included - the resulting binaries are self-contained.

## Versioning

Format: `<upstream-version>[-<build-number>]`

Examples:
- `3.6.4` - Matches mbedTLS 3.6.4
- `3.6.4-1` - Package update (build changes, CI fixes)
- `3.6.5` - New upstream mbedTLS version

## Releasing

Package update (build changes, CI fixes):
```sh
git tag 3.6.4-1
git push origin 3.6.4-1
```

Upstream update (new mbedTLS version):
```sh
# Update build.zig.zon: .version, .dependencies.upstream.url, .dependencies.upstream.hash
git commit -am "Update to mbedTLS 3.6.5"
git tag 3.6.5
git push origin main 3.6.5
```
