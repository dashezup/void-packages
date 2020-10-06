#!/bin/sh

echo '\n\n### Syncing musl/...\n'
rsync -rv --delete hostdir/binpkgs/ ../../repo/voidlinux/current/

echo '\n\n### Updating git based xlocate database...\n'
../../repo/voidlinux/xlocate/xupdategit

echo '\n\n### Generating info.html...\n'
$(dirname $0)/gen-repoinfo.sh ../../repo/voidlinux/current
