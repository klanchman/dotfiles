#!/usr/bin/env fish

mkdir -p ~/bin

if test -d "/Applications/Sublime Merge.app"
  ln -sf "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" ~/bin/smerge
end
