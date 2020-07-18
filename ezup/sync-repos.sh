#!/bin/sh

echo '\n\n### Syncing musl/...\n'
rsync -rv --delete hostdir/binpkgs/musl ../../repo/voidlinux/current/

echo '\n\n### Sync aarch64/...\n'
rsync -rv --delete hostdir/binpkgs/aarch64 ../../repo/voidlinux/current/
