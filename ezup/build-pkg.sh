#!/bin/sh

for pkg in "$@"; do
	echo "\n\n## Cleaning...\n"
	./xbps-src clean

	echo "\n\n## Building $pkg (x86_64-musl)...\n"
	./xbps-src -r musl pkg $pkg

	echo "\n\n## Building $pkg (armv7l-musl)...\n"
	./xbps-src -a armv7l-musl -r musl pkg $pkg

	echo "\n\n## Building $pkg (aarch64)...\n"
	./xbps-src -a aarch64-musl -r aarch64 pkg $pkg
done
