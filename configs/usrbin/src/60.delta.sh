#!/bin/sh -e
VERSION=0.18.2
FILE="$PKGS_WD/$VERSION.delta.tar.gz"
HASH="adf7674"

download-and-check \
  -u "https://github.com/dandavison/delta/releases/download/$VERSION/delta-$VERSION-$PKGS_ARCH-unknown-linux-gnu.tar.gz" \
  -f "$FILE" \
  -h "$HASH"

TO="$PKGS_LIB/delta"
mkdir -p "$TO"
tar xf "$FILE" --strip-components=1 -C "$TO"
install -Dm755 "$TO/delta" "$PKGS_BIN/delta"
rm -rf "$TO"
