#!/bin/sh

: "${progname:="${0##*/}"}"

get_info_html() {
	#PACKAGES=$(find $REPODIR -name "*.xbps" | xargs -I{} basename {} .xbps | rev | cut -d. -f2- | cut -d- -f2- | rev | sort -u)
	cat <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Information about Dash Eclipse's Void Linux Repository | ezup.dev </title>
</head>
<pre>
<b><a href="https://ezup.dev/">[ezup.dev]</a></b> / repo / voidlinux / <b><a href="https://ezup.dev/repo/voidlinux/current/">[current]</a></b> / info.html

<b>Dash Eclipse's Void Linux Repository</b>
<b>------------------------------------</b>

Dash Eclipse's Void Linux packages collection

stagit: <a href="https://ezup.dev/git/void-packages/" target="_blank">https://ezup.dev/git/void-packages/</a>
git clone <a href="git://ezup.dev/void-packages.git">git://ezup.dev/void-packages.git</a>


<b>How to Use</b>
<b>----------</b>

1. Copy the main repository configuration file to /etc/xbps.d

   # cp /usr/share/xbps.d/00-repository-main.conf /etc/xbps.d/00-repository-main.conf

2. To get packages which only includes in this repository,
   add corresponding repository after your main repository

   # for x86_64-musl, armv7l-musl
   repository=<a href="https://ezup.dev/repo/voidlinux/current/musl" target="_blank">https://ezup.dev/repo/voidlinux/current/musl</a>

   # for aarch64-musl
   repository=<a href="https://ezup.dev/repo/voidlinux/current/aarch64" target="_blank">https://ezup.dev/repo/voidlinux/current/aarch64</a>

3. Synchronize repositories, install packages you need

   # xbps-install -S [PKG...]

WARNING: You can replace a package from your main repository with the one
which has the same name from this repository by insert this repository at the
beginning of your repository configuration, but you will risking some of other
packages also be replaced. I would recommend you to check related package
template, build it by yourself and optionally self-host your own repository.


<b>Packages</b>
<b>--------</b>

EOF

	ls -v1 $REPODIR/musl/*.x86_64-musl.xbps $REPODIR/musl/*.noarch.xbps \
		| xargs -I{} basename {} | sed 's/.\(x86_64-musl\|noarch\).xbps$//' \
		| rev | sed 's/-/ /; s/_/ - /' | rev \
		| tac | sort -uk1,1 \
		| column -t -R4 \
		| tree -N --fromfile \
		| sed -e "
			s|^0 directories, \([0-9]\+\) files$|\1 packages - <b>$(date -u +%FT%TZ)</b>|
			s,\x1B\[[0-9;]*[a-zA-Z],,g
			"

	cat <<EOF
</pre>
</html>
EOF
}

#get_info_html >$(dirname $(realpath $0))/info.html

usage() {
	cat <<_EOF
Usage: $progname repo_dir
_EOF
}

if [ ! -z $1 ]; then
	[ -f $1/musl/x86_64-musl-repodata ] || { echo "$1 is not a valid repo" && exit 0; }
	REPODIR=$1
	get_info_html >$REPODIR/info.html
else
	usage
fi
