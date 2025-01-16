#!/bin/sh -e
NVIM_PLUG="$PKGS_SHARE/nvim/pack/plugins/start"
mkdir -p "$NVIM_PLUG"
_nvim_plugin() {
  DIR="$PKGS_WD/$(basename "$1").git"
  [ ! -d "$DIR" ] && git clone --quiet "https://github.com/$1" "$DIR"
  git -C "$DIR" pull --quiet
  cp -r "$DIR" "$NVIM_PLUG/$(basename "$1")"
}

_nvim_plugin "vim-airline/vim-airline"
_nvim_plugin "NoahTheDuke/vim-just"
_nvim_plugin "echasnovski/mini.completion"
_nvim_plugin "petertriho/nvim-scrollbar"
_nvim_plugin "mfussenegger/nvim-lint"
