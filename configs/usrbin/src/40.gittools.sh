#!/bin/sh -e
VERSION=0.2.0
FILE="$PKGS_WD/$VERSION.gittools.tar.gz"
HASH="50a872e"

download-and-check \
  -u "https://github.com/seanenck/git-tools/archive/v$VERSION.tar.gz" \
  -f "$FILE" \
  -h "$HASH"

tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/git-tools-$VERSION"
(cd "$TO" && just --quiet)
for BINARY in git-uncommitted git-motd git-current-state; do
  (cd "$TO" && install -Dm755 "target/$BINARY" "$PKGS_BIN/$BINARY")
done
rm -rf "$TO"
