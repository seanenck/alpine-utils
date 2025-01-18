#!/bin/sh -e
for FILE in bin/* ; do
  install -Dm755 "$FILE" "$PKGS_BIN/"
done
