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

echo "[sudo] Installing required ports..."
sudo port -N install fish git mint rbenv ruby-build

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.0/install.sh | bash

echo "[sudo] Adding fish to /etc/shells..."
echo "/opt/local/bin/fish" | sudo tee -a /etc/shells

echo "Changing default shell for user..."
chsh -s /opt/local/bin/fish

echo "You are now ready to run setup.fish!"
