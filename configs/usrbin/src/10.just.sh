#!/bin/sh -e
VERSION=1.38.0
FILE="$PKGS_WD/$VERSION.just.tar.gz"
HASH="efded3b"

download-and-check \
  -u "https://github.com/casey/just/releases/download/$VERSION/just-$VERSION-$PKGS_ARCH-unknown-linux-$PKGS_LIBC.tar.gz" \
  -f "$FILE" \
  -h "$HASH"

TO="$PKGS_LIB/just"
mkdir -p "$TO"
tar xf "$FILE" -C "$TO"
install -Dm755 "$TO/just" "$PKGS_BIN/just"
install -Dm644 "$TO/completions/just.bash" "$PKGS_COMP/just"
rm -rf "$TO"
