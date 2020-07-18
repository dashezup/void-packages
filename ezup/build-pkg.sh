#!/bin/sh

./xbps-src -r musl pkg $1
./xbps-src -a armv7l-musl -r musl pkg $1
./xbps-src -a aarch64-musl -r aarch64 pkg $1
