name		:= mikucat/xray
version		:= 1.5.2
manifest	:= $(name):$(version)
cache		:= cache
tool		:= buildah

define run-common
	mkdir -p $(cache)/$(version)/$(arch)
	wget -qNP $(cache) "https://github.com/v2fly/domain-list-community/releases/latest/download/dlc.dat"
	wget -qNP $(cache) "https://github.com/v2fly/geoip/releases/latest/download/geoip.dat"
	wget -qNP $(cache)/$(version)/$(arch) "https://github.com/XTLS/Xray-core/releases/download/v$(version)/Xray-linux-$(pkgarch).zip"
	unzip -o $(cache)/$(version)/$(arch)/Xray-linux-$(pkgarch).zip -d $(cache)/$(version)/$(arch) xray
	sudo $(tool) build $(args) --manifest $(manifest) -f Dockerfile.arch \
		--build-arg TARGETARCH=$(arch) --build-arg CACHE=$(cache) --build-arg VERSION=$(version) .
endef

default: amd64 arm64/v8

all: 386 amd64 arm/v5 arm/v6 arm/v7 arm64/v8 ppc64 ppc64le mips mipsle mips64 mips64le riscv64 s390x

386: args		:= --arch 386
386: pkgarch	:= 32
386:
	$(run-common)

amd64: args		:= --arch amd64
amd64: pkgarch	:= 64
amd64:
	$(run-common)

arm/v5: args	:= --arch arm --variant v5
arm/v5: pkgarch	:= arm32-v5
arm/v5:
	$(run-common)

arm/v6: args	:= --arch arm --variant v6
arm/v6: pkgarch	:= arm32-v6
arm/v6:
	$(run-common)

arm/v7: args	:= --arch arm --variant v7
arm/v7: pkgarch	:= arm32-v7a
arm/v7:
	$(run-common)

arm64/v8: args		:= --arch arm64 --variant v8
arm64/v8: pkgarch	:= arm64-v8a
arm64/v8:
	$(run-common)

ppc64: args		:= --arch ppc64
ppc64: pkgarch	:= ppc64
ppc64:
	$(run-common)

ppc64le: args		:= --arch ppc64le
ppc64le: pkgarch	:= ppc64le
ppc64le:
	$(run-common)

mips: args		:= --arch mips
mips: pkgarch	:= mips32
mips:
	$(run-common)

mipsle: args	:= --arch mipsle
mipsle: pkgarch	:= mips32le
mipsle:
	$(run-common)

mips64: args	:= --arch mips64
mips64: pkgarch	:= mips64
mips64:
	$(run-common)

mips64le: args		:= --arch mips64le
mips64le: pkgarch	:= mips64le
mips64le:
	$(run-common)

riscv64: args		:= --arch riscv64
riscv64: pkgarch	:= riscv64
riscv64:
	$(run-common)

s390x: args		:= --arch s390x
s390x: pkgarch	:= s390x
s390x:
	$(run-common)

clean:
	-rm -rf $(cache)
