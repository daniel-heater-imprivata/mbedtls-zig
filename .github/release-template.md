## mbedtls-zig {{VERSION}}

Zig package for mbedTLS cryptographic library.

**Version scheme**: `<upstream-version>[-<build-number>]`
- Base version matches upstream mbedTLS
- Build number increments for package-only changes

### Usage

```sh
zig fetch --save https://github.com/{{REPO}}/archive/refs/tags/{{VERSION}}.tar.gz
```

In your `build.zig`:

```zig
const mbedtls_dep = b.dependency("mbedtls", .{
    .target = target,
    .optimize = optimize,
});
your_compilation.linkLibrary(mbedtls_dep.artifact("mbedtls"));
```

### What's included

- Static library (`libmbedtls.a` on Linux/macOS, `mbedtls.lib` on Windows)
- Headers (`mbedtls/*.h`, `psa/*.h`)
- Cross-compilation support:
  - Linux: x86_64, aarch64
  - macOS: x86_64 (Intel), aarch64 (Apple Silicon)
  - Windows: x86_64, aarch64
- Position Independent Code (PIC) support via `-Dpie=true`

### Features

mbedTLS provides:
- TLS/SSL protocols (TLS 1.2, TLS 1.3)
- X.509 certificate handling
- Cryptographic primitives (AES, RSA, ECC, SHA, etc.)
- PSA Crypto API

### Cross-compilation example

```sh
zig build -Dtarget=aarch64-linux -Doptimize=ReleaseSafe
zig build -Dtarget=x86_64-windows -Doptimize=ReleaseSafe
```

