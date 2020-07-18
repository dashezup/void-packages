#!/bin/sh

## https://github.com/void-linux/void-infrastructure/blob/master/ansible/roles/buildmaster/templates/xbps-sign-repos.sh.j2

MAINREPO="$PWD/hostdir/binpkgs"
REPOS="$MAINREPO/musl $MAINREPO/aarch64"
ARCHS="x86_64-musl armv7l-musl aarch64-musl"

for f in ${REPOS}; do
    export XBPS_PASSPHRASE="$XBPS_PASSPHRASE"
    for x in ${ARCHS}; do
       export XBPS_TARGET_ARCH=$x
       xbps-rindex -v -s \
                       --signedby "Dash Eclipse" --privkey $HOME/.ssh/void-rsa ${f}
       find ${f} -maxdepth 1 -name '*.xbps' -print0 | \
                       xargs -L 1000 -r0 xbps-rindex -v -S \
                       --signedby "Dash Eclipse" --privkey $HOME/.ssh/void-rsa
    done
    xbps-rindex -v -S \
                   --signedby "Dash Eclipse" --privkey $HOME/.ssh/void-rsa ${f}/*.noarch.xbps
done

exit 0
