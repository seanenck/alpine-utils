#!/bin/sh -e
mkdir -p "$1/etc/apk"
cp "$OVL_WORLD" "$1/etc/apk/world"
