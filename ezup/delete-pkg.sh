#!/bin/sh

rm -v hostdir/binpkgs/${1}-*.xbps 2>/dev/null
rm -v hostdir/binpkgs/${1}-*.xbps.sig 2>/dev/null
rm -v hostdir/binpkgs/*-repodata 2>/dev/null
