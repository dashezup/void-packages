#!/bin/sh

echo '\n\n### Generating info.html...\n'
$(dirname $0)/gen-repoinfo.sh hostdir/binpkgs/ezupdev

echo '\n\n### Syncing musl/...\n'
rsync -rv --delete hostdir/binpkgs/ezupdev/ ezup:~/ezup/repo/voidlinux/current/

echo '\n\n### Updating git based xlocate database...\n'
ssh ezup ~/ezup/repo/voidlinux/xlocate/xupdategit
