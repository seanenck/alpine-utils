#!/bin/sh -e
VERSION=0.10.4
FILE="$PKGS_WD/$VERSION.neovim.tar.gz"
HASH="f411777"

download-and-check \
  -u "https://voidedtech.com/$VERSION-nvim-linux-$PKGS_ALTARCH.tar.gz" \
  -f "$FILE" \
  -h "$HASH" \
  -p "neovim/neovim"

tar xf "$FILE" -C "$PKGS_LIB"
(cd "$PKGS_BIN" && ln -sf "../$PKGS_LIB_DIR/nvim-linux-$PKGS_ALTARCH/bin/nvim" nvim)
