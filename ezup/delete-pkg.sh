#!/bin/sh

for dir in aarch64 musl; do
	rm -v hostdir/binpkgs/$dir/${1}-*.xbps 2>/dev/null
	rm -v hostdir/binpkgs/$dir/${1}-*.xbps.sig 2>/dev/null
	rm -v hostdir/binpkgs/$dir/*-repodata 2>/dev/null
done
