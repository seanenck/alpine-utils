#!/bin/sh -e
VERSION=1.7.0
FILE="$PKGS_WD/$VERSION.revive.tar.gz"
HASH="2ea41ab"

download-and-check \
  -u "https://github.com/mgechev/revive/archive/v$VERSION.tar.gz"\
  -f "$FILE" \
  -h "$HASH"

tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/revive-$VERSION"
(cd "$TO" && go build -buildmode=pie -trimpath -modcacherw)
(cd "$TO" && install -Dm755 "revive" "$PKGS_BIN/revive")
rm -rf "$TO"
