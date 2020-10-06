#!/bin/sh

for pkg in "$@"; do
	echo "\n\n## Cleaning...\n"
	./xbps-src clean

	echo "\n\n## Building $pkg (x86_64-musl)...\n" # x86_64-musl
	./xbps-src pkg $pkg

	echo "\n\n## Building $pkg (aarch64)...\n"
	./xbps-src -a aarch64-musl pkg $pkg

	echo "\n\n## Building $pkg (armv7l-musl)...\n"
	./xbps-src -a armv7l-musl pkg $pkg
done
