#!/bin/sh

#openssl genrsa -des3 -out privkey.pem 4096
#./xbps-src binary-bootstrap

#rm hostdir/binpkgs/ezupdev/{*-repodata,*.xbps.sig}
rm hostdir/binpkgs/ezupdev/*-repodata hostdir/binpkgs/ezupdev/*.sig

for arch in aarch64 aarch64-musl armv7l armv7l-musl x86_64 x86_64-musl; do
	XBPS_TARGET_ARCH=$arch xbps-rindex -a hostdir/binpkgs/ezupdev/*.${arch}.xbps
done
