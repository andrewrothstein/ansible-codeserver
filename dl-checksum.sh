#!/usr/bin/env sh
set -e
DIR=~/Downloads
APPNAME=code-server
MIRROR=https://github.com/cdr/$APPNAME/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-tar.gz}
    local platform="${os}-${arch}"
    local file="${APPNAME}-${ver}-${platform}.${suffix}"
    local url=$MIRROR/v$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver macos amd64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver linux armv7l
 }

dl_ver ${1:-4.5.1}
