#!/usr/bin/env sh
set -e
DIR=~/Downloads
APPNAME=code-server
MIRROR=https://github.com/cdr/$APPNAME/releases/download

dl()
{
    local ver=$1
    local flavor_ver=$2
    local os=$3
    local arch=$4
    local suffix=${5:-tar.gz}
    local platform="${os}-${arch}"
    local file="${APPNAME}${ver}-${flavor_ver}-${platform}.${suffix}"
    local url=$MIRROR/$ver/$file
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
    local flavor_ver=$2
    printf "  '%s-%s':\n" $ver $flavor_ver
    dl $ver $flavor_ver alpine arm64
    dl $ver $flavor_ver alpine x86_64
    dl $ver $flavor_ver darwin x86_64 zip
    dl $ver $flavor_ver linux arm64
    dl $ver $flavor_ver linux x86_64
}

dl_ver 2.1698 vsc1.41.1
