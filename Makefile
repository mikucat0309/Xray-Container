name	:= mikucat/xray
version	:= v1.5.2
manifest:= $(name):$(version)
cache	:= cache
tool	:= buildah

define run-common
	mkdir -p $(cache)/$(version)/$(arch)
	wget -qNP $(cache) "https://github.com/v2fly/domain-list-community/releases/latest/download/dlc.dat"
	wget -qNP $(cache) "https://github.com/v2fly/geoip/releases/latest/download/geoip.dat"
	wget -qNP $(cache)/$(version)/$(arch) "https://github.com/XTLS/Xray-core/releases/download/$(version)/Xray-linux-$(pkgarch).zip"
	unzip -o $(cache)/$(version)/$(arch)/Xray-linux-$(pkgarch).zip -d $(cache)/$(version)/$(arch) xray
	sudo $(tool) build --arch $(arch) --manifest $(manifest) -f Dockerfile.arch \
		--build-arg TARGETARCH=$(arch) --build-arg CACHE=$(cache) --build-arg VERSION=$(version) .
endef

all: arm arm64 386 amd64

arm/v7: arch	:= arm
arm/v7: pkgarch	:= arm32-v7a
arm/v7:
	$(run-common)

arm64: arch		:= arm64
arm64: pkgarch	:= arm64-v8a
arm64:
	$(run-common)

386: arch		:= 386
386: pkgarch	:= 32
386:
	$(run-common)

amd64: arch		:= amd64
amd64: pkgarch	:= 64
amd64:
	$(run-common)

clean:
	-rm -rf $(cache)

