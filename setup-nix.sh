#!/bin/bash

# Create ~/.config/nix directory if it doesn't exist
mkdir -p ~/.config/nix

# Ensure nix.conf is in place
if [ ! -f ~/.config/nix/nix.conf ]; then
  cp .config/nix/nix.conf ~/.config/nix/nix.conf
fi

# Check if we're in the right directory
CURRENT_DIR=$(pwd)
DIRNAME=$(basename "$CURRENT_DIR")

if [ "$DIRNAME" = "dotfiles" ]; then
  echo "✅ You're in the correct directory: $CURRENT_DIR"
else
  echo "❌ WARNING: You're not in a directory named 'dotfiles'. Current directory: $CURRENT_DIR"
  read -p "Continue anyway? (y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

# Run nix build with flakes enabled
echo "🚀 Running nix build with flakes enabled..."
nix --extra-experimental-features "nix-command flakes" build

echo "✨ Setup complete! You can now use nix with flakes."
echo "ℹ️  Try running: nix --extra-experimental-features 'nix-command flakes' flake check"
