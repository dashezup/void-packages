#!/bin/sh

## https://github.com/void-linux/void-infrastructure/blob/master/ansible/roles/buildmaster/templates/xbps-sign-repos.sh.j2

REPO="$PWD/hostdir/binpkgs/ezupdev"
ARCHS="aarch64 aarch64-musl armv7l armv7l-musl x86_64 x86_64-musl"

export XBPS_PASSPHRASE="$XBPS_PASSPHRASE"
for x in ${ARCHS}; do
	export XBPS_TARGET_ARCH=$x
	xbps-rindex -v -s \
		--signedby "Dash Eclipse" \
		--privkey $HOME/.ssh/void-rsa \
		${REPO}
	find ${REPO} -maxdepth 1 -name '*.xbps' -print0 | \
		xargs -L 1000 -r0 \
		xbps-rindex -v -S \
		--signedby "Dash Eclipse" \
		--privkey $HOME/.ssh/void-rsa
done

xbps-rindex -v -S \
	--signedby "Dash Eclipse" \
	--privkey $HOME/.ssh/void-rsa \
	${REPO}/*.noarch.xbps

exit 0
