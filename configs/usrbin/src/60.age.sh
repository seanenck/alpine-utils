#!/bin/sh -e
VERSION=1.2.1
FILE="$PKGS_WD/$VERSION.age.tar.gz"
_download_if_not "https://github.com/FiloSottile/age/archive/v$VERSION.tar.gz" "$FILE"
tar xf "$FILE" -C "$PKGS_LIB"
TO="$PKGS_LIB/age-$VERSION"
(cd "$TO" && go build -mod=readonly -modcacherw -ldflags "-X main.Version=$VERSION" -o . ./...)
for BINARY in age age-keygen; do
  (cd "$TO" && install -Dm755 "$BINARY" "$PKGS_BIN/$BINARY")
done
rm -rf "$TO"
