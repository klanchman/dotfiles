#!/usr/bin/env fish

mkdir -p ~/bin

if test -d "/Applications/Sublime Merge.app"
  ln -sf "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" ~/bin/smerge
end

echo "Downloading cbor CLI tool..."
curl -L https://github.com/fiatjaf/cbor/releases/download/v1.0.0/cbor_darwin_amd64 -o ~/bin/cbor

echo "Downloading itermoxyl..."
curl -L https://raw.githubusercontent.com/luciopaiva/itermoxyl/master/itermoxyl -o ~/bin/itermoxyl
chmod u+x ~/bin/itermoxyl
