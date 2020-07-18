#!/bin/sh

#openssl genrsa -des3 -out privkey.pem 4096
#./xbps-src binary-bootstrap

#rm hostdir/binpkgs/{musl,aarch64}/{*-repodata,*.xbps.sig}
rm hostdir/binpkgs/musl/*-repodata
rm hostdir/binpkgs/musl/*.sig
rm hostdir/binpkgs/aarch64/*-repodata
rm hostdir/binpkgs/aarch64/*.sig

XBPS_TARGET_ARCH=x86_64-musl xbps-rindex -a hostdir/binpkgs/musl/*.x86_64-musl.xbps
XBPS_TARGET_ARCH=armv7l-musl xbps-rindex -a hostdir/binpkgs/musl/*.armv7l-musl.xbps
XBPS_TARGET_ARCH=aarch64-musl xbps-rindex -a hostdir/binpkgs/aarch64/*.aarch64-musl.xbps
