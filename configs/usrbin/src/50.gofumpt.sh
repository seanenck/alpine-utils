#!/bin/sh -e
VERSION=0.7.0
FILE="$PKGS_WD/$VERSION.gofumpt.tar.gz"
_download_if_not "https://github.com/mvdan/gofumpt/archive/v$VERSION.tar.gz" "$FILE"
tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/gofumpt-$VERSION"
(cd "$TO" && go build -trimpath -mod=readonly -modcacherw)
(cd "$TO" && install -Dm755 "gofumpt" "$PKGS_BIN/gofumpt")
rm -rf "$TO"
