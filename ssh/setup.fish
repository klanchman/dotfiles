#!/usr/bin/env fish

if test -d ~/.ssh
  exit
end

mkdir -p ~/.ssh
chmod 700 ~/.ssh
