#!/bin/sh -e
VERSION=1.23.5
FILE="$PKGS_WD/$VERSION.go.tar.gz"
_download_if_not "https://go.dev/dl/go$VERSION.$PKGS_OS-$PKGS_ALTARCH.tar.gz" "$FILE"
tar xf "$FILE" -C "$PKGS_LIB"
(cd "$PKGS_BIN" && ln -sf "../$PKGS_LIB_DIR/go/bin/go" go)
