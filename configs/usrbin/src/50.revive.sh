#!/bin/sh -e
VERSION=1.5.1
FILE="$PKGS_WD/$VERSION.revive.tar.gz"
_download_if_not "https://github.com/mgechev/revive/archive/v$VERSION.tar.gz" "$FILE"
tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/revive-$VERSION"
(cd "$TO" && go build -buildmode=pie -trimpath -modcacherw)
(cd "$TO" && install -Dm755 "revive" "$PKGS_BIN/revive")
rm -rf "$TO"
