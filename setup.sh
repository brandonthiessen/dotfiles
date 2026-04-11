#!/usr/bin/env bash

dotfiles=(".vimrc" ".bashrc" ".tmux.conf")
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for f in "${dotfiles[@]}"; do
    ln -sf "$SCRIPT_DIR/$f" "$HOME/$f"
done

mkdir -p "$HOME/.config"

# Link Neovim config
ln -sfn "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"

source "$HOME/.bashrc"
