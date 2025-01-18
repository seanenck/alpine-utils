#!/bin/sh -e
VERSION=1.4.1
FILE="$PKGS_WD/$VERSION.lb.tar.gz"
HASH="35a2120"

_download_if_not "https://github.com/seanenck/lockbox/archive/v$VERSION.tar.gz" "$FILE" "$HASH"

tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/lockbox-$VERSION"
(cd "$TO" && just --quiet)
(cd "$TO" && install -Dm755 "target/lb" "$PKGS_BIN/lb")
(cd "$TO" && SHELL=bash target/lb completions > "$PKGS_COMP/lb")
rm -rf "$TO"
