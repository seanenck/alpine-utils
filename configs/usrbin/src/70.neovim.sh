#!/bin/sh -e
VERSION=0.10.3
FILE="$PKGS_WD/$VERSION.neovim.tar.gz"
HASH="5bd9083"

download-and-check \
  -u "https://voidedtech.com/0.10.3.neovim.tar.gz" \
  -f "$FILE" \
  -h "$HASH" \
  -p "neovim/neovim"

tar xf "$FILE" -C "$PKGS_LIB"
(cd "$PKGS_BIN" && ln -sf "../$PKGS_LIB_DIR/nvim-linux64/bin/nvim" nvim)
