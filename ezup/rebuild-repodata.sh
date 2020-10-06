#!/bin/sh

#openssl genrsa -des3 -out privkey.pem 4096
#./xbps-src binary-bootstrap

#rm hostdir/binpkgs/{*-repodata,*.xbps.sig}
rm hostdir/binpkgs/*-repodata hostdir/binpkgs/*.sig

XBPS_TARGET_ARCH=x86_64-musl xbps-rindex -a hostdir/binpkgs/*.x86_64-musl.xbps
XBPS_TARGET_ARCH=aarch64-musl xbps-rindex -a hostdir/binpkgs/*.aarch64-musl.xbps
XBPS_TARGET_ARCH=armv7l-musl xbps-rindex -a hostdir/binpkgs/*.armv7l-musl.xbps
