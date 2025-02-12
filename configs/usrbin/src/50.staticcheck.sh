#!/bin/sh -e
VERSION=2025.1
FILE="$PKGS_WD/$VERSION.staticcheck.tar.gz"
HASH="314e785"

download-and-check \
  -u "https://github.com/dominikh/go-tools/archive/$VERSION.tar.gz" \
  -f "$FILE" \
  -h "$HASH"

tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/go-tools-$VERSION"
(cd "$TO" && go build -mod=readonly -modcacherw -ldflags "-compressdwarf=false" -o staticcheck ./cmd/staticcheck)
(cd "$TO" && install -Dm755 "staticcheck/staticcheck" "$PKGS_BIN/staticcheck")
rm -rf "$TO"
