#!/usr/bin/env sh
VER='1.1156-vsc1.33.1'
DIR=~/Downloads
APPNAME=code-server
MIRROR=https://github.com/cdr/$APPNAME/releases/download/$VER

dl()
{
    OS=$1
    PLATFORM=$2
    SUFFIX=$3
    FILE=$APPNAME$VER-$OS-$PLATFORM.$SUFFIX
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s-%s: sha256:%s\n" $OS $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl darwin x64 zip
dl linux x64 tar.gz
dl musl x64 tar.gz



