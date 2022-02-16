all		:= linux/386,linux/amd64,linux/arm/v5,linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/ppc64,linux/ppc64le,linux/mips,linux/mipsle,linux/mips64,linux/mips64le,linux/riscv64,linux/s390x

name		:= mikucat/xray
version		:= 1.5.3
manifest	:= $(name):$(version)
platform	:= linux/amd64,linux/arm64/v8

tool		:= docker
command		:= buildx build
args		+= --tag $(manifest)
args		+= --file Containerfile.architecture
args		+= --build-arg "VERSION=$(version)"

.DEFAULT_GOAL := build
.PHONY: build
build:
	$(tool) $(command) --platform "$(platform)" $(args) .

.PHONY: all
all:
	$(tool) $(command) --platform "$(all)" $(args) .

