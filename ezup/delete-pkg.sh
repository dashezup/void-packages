#!/bin/sh

rm -v hostdir/binpkgs/ezupdev/${1}-*.xbps 2>/dev/null
rm -v hostdir/binpkgs/ezupdev/${1}-*.xbps.sig 2>/dev/null
rm -v hostdir/binpkgs/ezupdev/*-repodata 2>/dev/null
