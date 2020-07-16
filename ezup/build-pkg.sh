#!/bin/sh

#openssl genrsa -des3 -out privkey.pem 4096
#./xbps-src binary-bootstrap

./xbps-src -r musl pkg $1
./xbps-src -a armv7l-musl -r musl pkg $1
./xbps-src -a aarch64-musl -r aarch64 pkg $1

#rm hostdir/binpkgs/{musl,aarch64}/{*-repodata,*.xbps.sig}
#XBPS_TARGET_ARCH=x86_64-musl xbps-rindex -a hostdir/binpkgs/musl/*.x86_64-musl.xbps
#XBPS_TARGET_ARCH=armv7l-musl xbps-rindex -a hostdir/binpkgs/musl/*.armv7l-musl.xbps
#XBPS_TARGET_ARCH=aarch64-musl xbps-rindex -a hostdir/binpkgs/aarch64/*.aarch64-musl.xbps

