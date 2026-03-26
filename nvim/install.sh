#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v nvim &> /dev/null; then
  echo "Installing neovim..."
  brew install neovim
fi

if ! command -v rg &> /dev/null; then
  echo "Installing ripgrep..."
  brew install ripgrep
fi

if ! command -v fd &> /dev/null; then
  echo "Installing fd..."
  brew install fd
fi

if ! command -v tree-sitter &> /dev/null; then
  echo "Installing tree-sitter CLI..."
  brew install tree-sitter tree-sitter-cli
fi

mkdir -p ~/.config

if [ -L ~/.config/nvim ]; then
  rm ~/.config/nvim
elif [ -d ~/.config/nvim ]; then
  mv ~/.config/nvim ~/.config/nvim.bak
fi

echo "Symlinking $SCRIPT_DIR -> ~/.config/nvim"
ln -s "$SCRIPT_DIR" ~/.config/nvim

echo "Done! Run 'nvim' to start. Lazy.nvim will auto-install all plugins on first launch."
