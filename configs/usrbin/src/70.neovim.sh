#!/bin/sh -e
VERSION=0.10.3
FILE="$PKGS_WD/$VERSION.neovim.tar.gz"

[ ! -e "$FILE" ] && scp "release.ttypty.com:~/Resources/v$VERSION-nvim-linux64.tar.gz" "$FILE"

tar xf "$FILE" -C "$PKGS_LIB"
(cd "$PKGS_BIN" && ln -sf "../$PKGS_LIB_DIR/nvim-linux64/bin/nvim" nvim)
