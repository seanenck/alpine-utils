#!/bin/sh -e
VERSION=0.17.1
FILE="$PKGS_WD/$VERSION.gopls.tar.gz"
_download_if_not "https://github.com/golang/tools/archive/gopls/v$VERSION.tar.gz" "$FILE"
tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/tools-gopls-v$VERSION"
(cd "$TO/gopls" && go build -buildmode=pie -mod=readonly -modcacherw -ldflags "-compressdwarf=false" -o gopls)
(cd "$TO/gopls" && install -Dm755 "gopls" "$PKGS_BIN/gopls")
rm -rf "$TO"
