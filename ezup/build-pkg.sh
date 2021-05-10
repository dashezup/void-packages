#!/bin/sh

CROSS_ARCHS="aarch64 aarch64-musl armv7l armv7l-musl x86_64-musl"

for pkg in "$@"; do
	echo "\n\n## Cleaning...\n"
	./xbps-src clean

	echo "\n\n## Building $pkg for host architecture...\n"  # x86_64
	./xbps-src pkg $pkg

	for arch in ${CROSS_ARCHS}; do
		echo "\n\n## Building $pkg ($arch)...\n"
		./xbps-src -a $arch pkg $pkg
	done
done
