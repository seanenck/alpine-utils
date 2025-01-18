#!/bin/sh -e
VERSION=0.25.0
FILE="$PKGS_WD/$VERSION.bat.tar.gz"
HASH="ee0f12c"

_download_if_not "https://github.com/sharkdp/bat/releases/download/v$VERSION/bat-v$VERSION-$PKGS_ARCH-unknown-linux-$PKGS_LIBC.tar.gz" "$FILE" "$HASH"

TO="$PKGS_LIB/bat"
mkdir -p "$TO"
tar xf "$FILE" --strip-components=1 -C "$TO"
install -Dm755 "$TO/bat" "$PKGS_BIN/bat"
rm -rf "$TO"
