#!/bin/sh -e
VERSION=14.1.1
FILE="$PKGS_WD/$VERSION.rg.tar.gz"
HASH="c827481"

download-and-check \
  -u "https://github.com/BurntSushi/ripgrep/releases/download/$VERSION/ripgrep-$VERSION-$PKGS_ARCH-unknown-linux-gnu.tar.gz" \
  -f "$FILE" \
  -h "$HASH"

TO="$PKGS_LIB/rg"
mkdir -p "$TO"
tar xf "$FILE" --strip-components=1 -C "$TO"
install -Dm755 "$TO/rg" "$PKGS_BIN/rg"
(cd "$TO" && ./rg --generate=complete-bash > "$PKGS_COMP/rg")
rm -rf "$TO"
