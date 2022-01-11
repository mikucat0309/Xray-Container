# Xray-core Container Image

## Supported architectures

- `arm/v7`
- `arm64`
- `386`
- `amd64`

## Usage

Expose port 443 by default.

### Mount

- `/config.json` : Xray config  
    [example](https://github.com/XTLS/Xray-examples)  
    [reference](https://xtls.github.io/config/) (Chinese)  
    [v2ray reference](https://www.v2fly.org/en_US/config/overview.html) (Chinese & English)  

### Environment variables

None  

## Build

```bash
make
```

### Specific architecture

```bash
make <ARCH>
```

### Specific version

```bash
make version=<VERSION>
```

### Use docker

```bash
make tool=docker
```
