#!/bin/sh -e
VERSION=0.10.0
FILE="$PKGS_WD/$VERSION.shellcheck.tar.xz"
_download_if_not "https://github.com/koalaman/shellcheck/releases/download/v$VERSION/shellcheck-v$VERSION.linux.$PKGS_ARCH.tar.xz" "$FILE"
tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/shellcheck-v$VERSION"
install -Dm755 "$TO/shellcheck" "$PKGS_BIN/shellcheck"
rm -rf "$TO"
