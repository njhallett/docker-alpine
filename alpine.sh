#!/bin/bash

ALPINE_PATH="$HOME/Software/Alpine"
#ALPINE_PATH="/mnt/a/Software/ISO"

[ -d  "$ALPINE_PATH" ] && ALPINE_VERSION=$(find "$ALPINE_PATH" -name alpine-minirootfs-*-x86_64.tar.gz | awk -F"-" '{ print $3 }')

[ -z "$ALPINE_VERSION" ] && exit

cp "$ALPINE_PATH"/alpine-minirootfs-${ALPINE_VERSION}-x86_64.tar.gz .
docker build --build-arg ALPINE_VERSION=${ALPINE_VERSION} -t alpine .
docker tag alpine alpine:${ALPINE_VERSION}
rm alpine-minirootfs-${ALPINE_VERSION}-x86_64.tar.gz
