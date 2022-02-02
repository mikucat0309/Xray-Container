# Xray-container

Xray-core container image

## Supported platforms

- `linux/386`
- `linux/amd64`
- `linux/arm/v5`
- `linux/arm/v6`
- `linux/arm/v7`
- `linux/arm64/v8`
- `linux/ppc64`
- `linux/ppc64le`
- `linux/mips`
- `linux/mipsle`
- `linux/mips64`
- `linux/mips64le`
- `linux/riscv64`
- `linux/s390x`

## Usage

- [GitHub Package](https://github.com/users/mikucat0309/packages/container/package/xray)

```bash
docker pull ghcr.io/mikucat0309/xray:latest
```

### Exposed Ports

- 443-449

### Mounts

- `/config.json` : Xray config  
    [example](https://github.com/XTLS/Xray-examples)  
    [reference](https://xtls.github.io/config/) (Chinese)  
    [v2ray reference](https://www.v2fly.org/en_US/config/overview.html) (Chinese & English)  

## Build

### Requirements

- `docker buildx`
- `qemu-user-static`

### Usage

```bash
make [version=<VERSION>] [platform=<PLATFORM...>]
```

### Specific architecture

```bash
make platform=linux/arm/v7
```

### All architectures

```bash
make all
```

