#!/usr/bin/env fish

# Manually enable the Basic Python runtime and enable this script

mkdir -p "$HOME/Library/Application Support/iTerm2/Scripts/AutoLaunch"
ln -sf (pwd)/iterm/autoDarkMode.py "$HOME/Library/Application Support/iTerm2/Scripts/AutoLaunch/autoDarkMode.py"
