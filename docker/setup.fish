#!/usr/bin/env fish

if test -d /Applications/Docker.app
  mkdir -p ~/.config/fish/completions
  ln -shf /Applications/Docker.app/Contents/Resources/etc/docker.fish-completion ~/.config/fish/completions/docker.fish
  ln -shf /Applications/Docker.app/Contents/Resources/etc/docker-compose.fish-completion ~/.config/fish/completions/docker-compose.fish
end

echo 'Add {"credsStore": "osxkeychain"} to ~/.docker/config.json'
