#!/bin/sh -e
VERSION=0.7.0
FILE="$PKGS_WD/$VERSION.gofumpt.tar.gz"
HASH="d994902"

download-and-check \
  -u "https://github.com/mvdan/gofumpt/archive/v$VERSION.tar.gz" \
  -f "$FILE" \
  -h "$HASH"

tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/gofumpt-$VERSION"
(cd "$TO" && go build -trimpath -mod=readonly -modcacherw)
(cd "$TO" && install -Dm755 "gofumpt" "$PKGS_BIN/gofumpt")
rm -rf "$TO"
