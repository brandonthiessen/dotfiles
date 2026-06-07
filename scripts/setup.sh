#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> Using dotfiles directory: $DOTFILES_DIR"
echo

link () {
    src="$1"
    dest="$2"

    echo "-> Linking $dest"
    ln -sfn "$src" "$dest"
}

echo "==> Linking bash configs"
link "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
link "$DOTFILES_DIR/bash/.bash_profile" "$HOME/.bash_profile"
echo

echo "==> Linking Vim configs"
link "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
echo

echo "==> Linking Neovim configs"
mkdir -p "$HOME/.config"
link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo

echo "==> Linking Ghostty configs"
link "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
echo

echo "==> Linking tmux configs"
link "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
link "$DOTFILES_DIR/tmux/.tmux" "$HOME/.tmux"
mkdir -p "$HOME/.tmux/plugins"
echo

echo "==> Linking git configs"
link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_DIR/git/.gitconfig-uoft" "$HOME/.gitconfig-uoft"
echo

echo "✔ All dotfiles linked successfully."
