#!/usr/bin/env bash

set -e

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing required Homebrew packages..."
brew install fish git mint rbenv

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.36.0/install.sh | bash

echo "[sudo] Adding fish to /etc/shells..."
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

echo "Changing default shell for user..."
chsh -s /usr/local/bin/fish

echo "You are now ready to run setup.fish!"
