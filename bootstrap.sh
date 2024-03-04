#!/usr/bin/env bash

set -e

if ! command -v port > /dev/null; then
  echo "MacPorts is not installed. Please install MacPorts first, then run this script again."
  exit 1
fi

if ! command -v brew > /dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first, then run this script again."
  exit 1
fi

echo "Installing required packages from Homebrew..."
brew install fish git mint mise

echo "[sudo] Adding fish to /etc/shells..."
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells

echo "Changing default shell for user..."
chsh -s /opt/homebrew/bin/fish

echo "You are now ready to run setup.fish!"
