#!/bin/sh -e
VERSION=1.24.0
HASH="c3fa6d1"
FILE="$PKGS_WD/$VERSION.go.tar.gz"

download-and-check \
  -u "https://go.dev/dl/go$VERSION.linux-$PKGS_ALTARCH.tar.gz" \
  -f "$FILE" \
  -h "$HASH" \
  -p "golang/go"

tar xf "$FILE" -C "$PKGS_LIB"
(cd "$PKGS_BIN" && ln -sf "../$PKGS_LIB_DIR/go/bin/go" go)
